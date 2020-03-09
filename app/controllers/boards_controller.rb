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

    lists = List.includes(:cards).select(:id, :title)
    list_card_to_json(lists)
    respond_to do |format|
      format.html
      format.json { render :json => @all_array}
    end
  end

  private
  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end

  def list_card_to_json(lists)
    @all_array = []

    lists.each do |list|
      list_json = list.as_json
      card_json = list.cards.as_json(only: [:id, :title])
      list_json["card"] = card_json
      @all_array.push(list_json)
    end
  end
end