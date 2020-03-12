require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  before(:all) do
    @board = FactoryBot.create(:board)
    @list = FactoryBot.create(:list, board_id: @board.id)
    @card = FactoryBot.create(:card, list_id: @list.id)
  end

  describe "#create" do
    before(:all) do
      @params = {card: {title: "title"}, board_id: @board.id, list_id: @list.id, format: :json}
    end

    it "create success " do
      post :create, params: @params
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end

    it "create fail" do
      allow_any_instance_of(Card).to receive(:save).and_return(false)
      post :create, params: @params
      expect(response).to have_http_status(400)
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end

  describe "delete success" do
    before(:all) do
      @params = {board_id: @board.id, list_id: @list.id, id: @card.id, format: :json}
    end

    it "destroy success" do 
      expect{delete :destroy, params: @params}.to change{Card.all.size}.by(-1)
      expect(Card.find_by(id: @card.id)).to be nil
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq "application/json; charset=utf-8"
      # expect(response.body).to eq "刪除成功"
      # p "----------#{response.body}-----------------"
    end

    it "destroy fail" do 
      allow_any_instance_of(Card).to receive(:destroy).and_return(false)
      expect{delete :destroy, params: @params}.to change{Card.all.size}.by(0)
      expect(response).to have_http_status(400)
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end
end