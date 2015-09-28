class TicketsController < ApplicationController
  def create
    @ticket  = current_board.tickets.new(ticket_params)
    if @ticket.save
      redirect_to current_board
    else
      redirect_to current_board
      flash[:errors] = "Please try again"
    end
  end

  def edit
    @ticket = set_ticket
  end

  def update
    @ticket = set_ticket
    @ticket.update_attributes(ticket_params)

    redirect_to current_board
  end

  def status
    @ticket = set_ticket_by_id
    @ticket.update_attributes(status: params[:status])
    # redirect_to current_board

    render json: [:success]
  end

  def destroy
    set_ticket.destroy!
    redirect_to current_board
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :board_id)
  end

  def set_ticket
    Ticket.find(params[:id])
  end

  def set_ticket_by_id
    Ticket.find_by(id: params[:ticket_id])
  end
end
