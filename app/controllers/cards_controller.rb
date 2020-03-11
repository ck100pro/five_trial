class CardsController < ApplicationController
  before_action :find_list, only: [:create]
  before_action :find_card, only: [:destroy]

  def create
    card = @list.cards.build(card_params)
    respond_to do |format|
      if card.save
        format.json {render :json => card.to_json, status: 200}
      else
        format.json {render :json => error_message(card), status: 400}
      end
    end
  end

  def destroy
    @card.destroy
    respond_to do |format|
      format.json {render :json => {message: "刪除成功"}, status: 200}
    end
  end
  
  private
  def find_list 
    @list = List.find(params[:list_id])
  end

  def find_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title)
  end

  def error_message(card)
    card.errors.messages
  end
end