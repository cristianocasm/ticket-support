class TicketsController < ApplicationController
  before_action :set_ticket, only: :update

  # GET /tickets
  def index
    render json: current_user.tickets
  end

  # POST /tickets
  def create
    @ticket = current_user.tickets.new(ticket_create_params)

    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_update_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ticket_create_params
      params.require(:ticket).permit(:title)
    end

    def ticket_update_params
      params.require(:ticket).permit(:agent_id, :close)
    end
end
