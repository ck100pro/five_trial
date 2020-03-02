class ListsController < ApplicationController
  before_action :find_board, only: [:create]
  
  def create
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

private
  def find_board
    @board = Board.find(params[:board_id])
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