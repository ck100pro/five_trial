class ListsController < ApplicationController
  include HasJsonResponse

  before_action :find_board, only: [:create]
  before_action :find_list, only: [:update]
  
  def create
    @list = @board.lists.build(list_params)
    respond_to do |format|
      if @list.save
        format.json {render :json => create_success(@list), status: 200}
      else
        format.json {render :json => messages_errors(@list), status: 400}
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.json {render :json => list_update_success, status: 200}
      else
        format.json {render :json => messages_errors(@list), status: 400}
      end
    end
  end

private
#find_instance
  def find_board
    @board = Board.find(params[:board_id])
  end

  def find_list
    @list = List.find(params[:id])
  end
  
#permit_with_params
  def list_params
    params.require(:list).permit(:title)
  end

#action_messages_success
  def list_update_success
    @list.update_success_to_json
  end
end