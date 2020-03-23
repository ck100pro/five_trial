class ListsController < ApplicationController
  before_action :find_board, only: [:create]
  before_action :find_list, only: [:update]
  
  def create
    @list = @board.lists.build(list_params)
    respond_to do |format|
      if @list.save
        format.json {render :json => list_create_success, status: 200}
      else
        format.json {render :json => list_error_messages, status: 400}
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.json {render :json => list_update_success, status: 200}
      else
        format.json {render :json => list_error_messages, status: 400}
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
#deal_with_params
  def list_params
    params.require(:list).permit(:title)
  end

#action_messages_success
  def list_create_success
    @list.create_sucess_to_json
  end

  def list_update_success
    @list.update_sucess_to_json
  end
#action_messages_errors
  def list_error_messages
    @list.errors.messages
  end
end