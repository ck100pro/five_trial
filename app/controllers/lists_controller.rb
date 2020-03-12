class ListsController < ApplicationController
  before_action :find_board, only: [:create]
  before_action :find_list, only: [:update]
  
  def create
    list = @board.lists.build(list_params)
    respond_to do |format|
      if list.save
        format.json {render :json => list_create_success(list), status: 200}
      else
        format.json {render :json => list_create_error(list), status: 400}
      end
    end
  end

  def update
    @list.update(list_params)

    respond_to do |format|
      if @list.update(list_params)
        format.json {render :json => list_update(@list), status: 200}
      else
        format.json {render :json => list_error_message(@list), status: 400}
      end
    end
  end

private
  def find_board
    @board = Board.find(params[:board_id])
  end

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end

  def list_create_success(list)
    card = {card: []}
    list.as_json(only: [:id, :title]).merge(card)
  end

  def list_error_message(list)
    list.errors.messages
  end

  def list_update(updatelist)
    return updatelist.as_json(only: [:id, :title])
  end
end