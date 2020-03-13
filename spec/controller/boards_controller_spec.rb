require 'rails_helper'

RSpec.describe BoardsController, type: :controller do

  it "#index" do
    get :index
    expect( response ).to have_http_status( 200 )
    expect( response ).to render_template( :index )
  end

  describe "#create" do
    let( :params ) { {board: {title: "title"}} }

    it "create success" do
      expect{post :create, params: params}.to change{Board.count}.by(1)
      expect(Board.last.title).to eq ("title")
    end

    it "create success redirect" do
      post :create, params: params
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(board_path(Board.last))
    end

    it "create fail redirect" do
      allow_any_instance_of(Board).to receive(:save).and_return(false)
      expect{ post :create, params: params }.to change{Board.count}.by(0)
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "#show" do
    let!(:board) { create(:board) }
    let!(:list) { create(:list, board: board, title: 'LIST') }
    let!(:card) { create(:card, list: list, title: 'CARD') }
    let(:json_rs) do
      [{
        id: list.id,
        title: list.title,
        card: [
          {
            id: card.id,
            title: card.title,
            list_id: list.id
          }.stringify_keys
        ]
      }.stringify_keys]
    end

    it "show html" do
      get :show, params: { id: board }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.content_type).to eq "text/html; charset=utf-8"
    end

    it "show json" do
      get :show, params: {:id => board.id, :format => :json}
      expect(response.content_type).to eq "application/json; charset=utf-8"
      expect(JSON.parse(response.body)).to eq(json_rs)
    end
  end
end
