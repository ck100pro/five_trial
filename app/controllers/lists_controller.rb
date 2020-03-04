class ListsController < ApplicationController
  before_action :find_board, only: [:create]
  
  def create
    list = @board.lists.build(list_params)
    respond_to do |format|
      if list.valid?
        list.save
        format.json {render :json => list, status: 200}
      else
        format.json {render :json => error_message(list), status: 400}
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
    list.errors.messages
  end
end