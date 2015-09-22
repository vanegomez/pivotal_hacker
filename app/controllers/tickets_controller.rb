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

  def up
    @ticket = Ticket.find_by(id: params[:ticket_id])
    @ticket.update_attributes(status: params[:status])
    redirect_to current_board
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
end

## post
## tickets/:id/up
## tickets/:id/down

## ticket id / current status / target status
## current status neighbors
## update action
## model 2 methods: 1.up / 2.down

## ajax
## $.ajax( url:"/tickets/" + id + "/down",
# method: post,
# success: function(){
# update ticket in the dom})
