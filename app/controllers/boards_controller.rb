class BoardsController < ApplicationController
  before_action :find_board, only: [:list_create]
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

  def list_create
    list = @board.lists.build(list_params)
    respond_to do |format|
      if list.valid?
        list.save
        format.json { render :json => success_message(list)}
      else
        format.json { render :json => error_message(list) }
      end
    end
  end

  def show
    @list = List.new
    @lists = List.select(:id, :title).to_json
  end

  private
  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end

  def list_params
    params.require(:list).permit(:title)
  end

  def error_message(list)
    status = {status: "error"}
    list.errors.messages.merge(status)
  end

  def success_message(list)
    status = {status: "success"}
    list.as_json(only: [:id, :title]).merge(status)
  end
end