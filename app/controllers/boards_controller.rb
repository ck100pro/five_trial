class BoardsController < ApplicationController
  before_action :find_board, only: [:show]
  layout "showApplictaion", only: [:show] 
  def index
    @board = Board.new
    @boards = Board.all
  end

  def create
    board = Board.new(board_params)
    board.save
    redirect_to board_path(board.id), {notice: "board建立成功"}
  end

  def show
    @list = List.new
    @lists = List.select(:id, :title).to_json
    respond_to do |format|
      format.html
      format.json { render :json => @lists}
    end
  end

  private
  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end
end