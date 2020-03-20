require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  let!(:board) { create(:board) }
  let!(:list) { create(:list, board_id: board.id) }

  describe "#create" do
    let!(:params) { {card: {title: "title"}, board_id: board.id, list_id: list.id, format: :json} }

    it "create success " do
      expect{ post :create, params: params }.to change{ Card.count}.by(1)
      expect(Card.last.title).to eq("title")
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end

    it "create fail" do
      allow_any_instance_of(Card).to receive(:save).and_return(false)
      expect{ post :create, params: params }.to change{ Card.count }.by(0)
      expect(response).to have_http_status(400)
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end

  describe "delete success" do
    let!(:card) { create(:card, :list_id => list.id) }
    let!(:params) { {board_id: board.id, list_id: list.id, id: card.id, format: :json} }

    it "destroy success" do 
      expect{delete :destroy, params: params}.to change{ Card.count }.by(-1)
      expect(Card.find_by(id: card.id)).to be_nil
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end

    it "destroy fail" do 
      allow_any_instance_of(Card).to receive(:destroy).and_return(false)
      expect{ delete :destroy, params: params }.to change{ Card.count }.by(0)
      expect(Card.find_by(id: card.id)).to eq (card)
      expect(response).to have_http_status(400)
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end
end