require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  before(:all) do
    @board = FactoryBot.create(:board)
  end

  it "#index" do
    get :index
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end

  describe "#create" do
    before(:all) do
      @params = {board: {title: "title"}}
    end

    it "create success" do
      expect{post :create, params: @params}.to change{Board.all.size}.by(1)
    end

    it "create success redirect" do
      post :create, params: @params
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(board_path(Board.last))
    end

    it "create fail redirect" do
      allow_any_instance_of(Board).to receive(:save).and_return(false)
      post :create, params: @params
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "#show" do
    it "show html" do
      get :show, params: {:id => @board.id}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.content_type).to eq "text/html; charset=utf-8"
    end

    it "show json" do
      get :show, params: {:id => @board.id, :format => :json}
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end
end