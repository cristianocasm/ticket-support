class User < ApplicationRecord
  acts_as_token_authenticatable
  
  devise :database_authenticatable, :validatable

  # includes the object type when "to_json" is
  # called so that front-end is able to choose
  # layout.
  def serializable_hash options=nil
    super.merge "type" => type
  end
end
