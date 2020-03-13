require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  before(:all) do
    @board = FactoryBot.create(:board)
    @list = FactoryBot.create(:list, board_id: @board.id)
  end

  describe "#create" do
    before(:all) do
      @params = {list: {title: "title"}, board_id: @board.id, format: :json }
    end

    it "create success" do
      expect{post :create, params: @params}.to change{List.all.size}.by(1)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end

    it "create error" do
      allow_any_instance_of(List).to receive(:save).and_return(false)
      post :create, params: @params
      expect(response).to have_http_status(400)
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end

  describe "#update" do
    before(:all) do
      @params = {list: {title: "update"}, board_id: @board.id, id: @list.id, format: :json}
    end

    it "update success" do
      patch :update, params: @params
      # expect(list.reload.title).to eq('update')
      expect(List.find(@list.id).title).to eq "update"
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end

    it "update error" do
      allow_any_instance_of(List).to receive(:update).and_return(false)
      patch :update, params: @params
      expect(List.find(@list.id).title).to eq "#{@list.title}"
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end
end

