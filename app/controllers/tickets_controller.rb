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

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end
end
