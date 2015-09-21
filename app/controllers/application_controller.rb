class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_board

  def current_board
    Board.find(session[:current_board]["id"])
  end
end
