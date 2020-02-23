class BoardsController < ApplicationController
  before_action :board_params, only: [:create]

  def index
    @board = Board.new
    @boards = Board.all
  end

  def create
    board = Board.new(board_params)
    if board.save
      redirect_to root_path, {notice: "board建立成功"}
    end
  end

  private
  def board_params
    params.require(:board).permit(:title)
  end
end