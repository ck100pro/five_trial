class CardsController < ApplicationController
  before_action :find_list, only: [:create]
  before_action :find_card, only: [:destroy]

  def create
    @card = @list.cards.build(card_params)
    respond_to do |format|
      if @card.save
        format.json {render :json => create_sucess_to_json, status: 200}
      else
        format.json {render :json => card_error_messages, status: 400}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @card.destroy
        format.json {render :json => {message: "刪除成功"}, status: 200}
      else
        format.json {render :json => {message: "刪除失敗"}, status: 400} #暫定先這樣寫等相關設定出來在進行改寫
      end
    end
  end
  
  private
  #find_instance
  def find_list 
    @list = List.find(params[:list_id])
  end

  def find_card
    @card = Card.find(params[:id])
  end

#permit_with_params
  def card_params
    params.require(:card).permit(:title)
  end

#action_messages_success
  def create_sucess_to_json
    @card.create_sucess_to_json
  end

  def card_error_messages
    @card.errors.messages
  end
end