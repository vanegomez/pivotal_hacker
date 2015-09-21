class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to board_path(@board)
    else
      flash[:errors] = "Please try again"
      # render :new
    end
  end

  def show
    @board   = set_board
    @ticket  = Ticket.new
    @tickets = set_board.tickets
  end

  def edit
    @board = set_board
  end

  def update
    @board = set_board
    @board.update(board_params)

    redirect_to root_path
  end

  def destroy
    set_board.destroy!
    redirect_to root_path
  end

  private

  def board_params
    params.require(:board).permit(:title)
  end

  def set_board
    board = Board.find(params[:id])
    session[:current_board] = board
    board
  end
end
