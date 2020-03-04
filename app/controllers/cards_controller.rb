class CardsController < ApplicationController
  before_action :find_list, only: [:create]

  def create
    card = @list.cards.build(card_params)
    respond_to do |format|
      if card.valid?
        card.save
        format.json {render :json => card, status: 200}
      else
        format.json {render :json => error_message(card), status: 400}
      end
    end
  end
  private
  def find_list 
    @list = List.find(params[:list_id])
  end

  def card_params
    params.require(:card).permit(:title)
  end

  def error_message(card)
    card.errors.messages
  end
end