class MessagesController < ApplicationController
  before_action :set_ticket

  # GET /tickets/:ticket_id/messages
  def index
    render json: @ticket.messages
  end

  # POST /tickets/:ticket_id/messages
  def create
    @message = @ticket.messages.new(message_params)

    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:ticket_id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:msg, :agent_id, :customer_id)
    end
end
