class CardsController < ApplicationController
  include HasJsonResponse

  before_action :find_list, only: [:create]
  before_action :find_card, only: [:show, :update, :destroy]

  def create
    @card = @list.cards.build(card_params)
    respond_to do |format|
      if @card.save
        format.json {render :json => create_success(@card), status: 200}
      else
        format.json {render :json => messages_errors(@card), status: 400}
      end
    end
  end

  def show
    respond_to do |format|
      format.json {render :json => card_content, status: 200}
    end
  end

  def update
    respond_to do |format|
      if @card.update(card_update_time_params)
        format.json {render :json => card_content, status: 200}
      else

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

  def card_update_time_params
    params.require(:card).permit(:endtime_at)
  end

#card_api
  def card_content
    @card.card_content
  end
end