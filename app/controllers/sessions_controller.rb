class SessionsController < Devise::SessionsController
  acts_as_token_authentication_handler_for User

  def create
    warden.authenticate!

    render json: current_user
  end

  def destroy
    current_user.update(authentication_token: nil)
  end

  private
  # Check if there is no signed in user before doing the sign out.
  #
  # If there is no signed in user, it will return 404 Not Found message
  def verify_signed_out_user
    user = User.find_by(user_params)
    sign_in(user) and return if user
    
    render status: :not_found
  end

  def user_params
    params.require(:user).permit(:email, :authentication_token)
  end
end
