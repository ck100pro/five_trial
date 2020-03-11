class BoardsController < ApplicationController
  before_action :find_board, only: [:show]

  layout "showApplictaion", only: [:show] 

  def index
    @board = Board.new
    @boards = Board.all #後面會用分頁或者不一次顯示多筆
  end

  def create
    board = Board.new(board_params)
    board.save
    redirect_to board_path(board.id), {notice: "board建立成功"}
  end

  def show
    @list = List.new

    lists = List.includes(:cards).to_a.map do |list|
      list.to_json.merge(card: list.cards.map(&:to_json))
    end
    
    respond_to do |format|
      format.html
      format.json { render :json => lists}
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