require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let!(:board) { create(:board) }

  describe "#create" do
    let!(:params) { { list: {title: "title"}, board_id: board.id, format: :json } }

    it "create success" do
      expect{ post :create, params: params }.to change{ List.count }.by(1)
      expect( List.last.title).to eq("title")
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end

    it "create error" do
      allow_any_instance_of(List).to receive(:save).and_return(false)
      expect{ post :create, params: params }.to change{ List.count }.by(0)
      expect(response).to have_http_status(400)
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end

  describe "#update" do
    let!(:list) { create(:list, :board_id => board.id)}
    let!(:params) { {list: {title: "update"}, board_id: board.id, id: list.id, format: :json} }

    it "update success" do
      expect{ patch :update, params: params }.to change{ List.count }.by(0)
      expect(list.reload.title).to eq('update')
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end

    it "update error" do
      allow_any_instance_of(List).to receive(:update).and_return(false)
      expect{ patch :update, params: params }.to change{ List.count }.by(0)

      expect(list.reload.title).not_to eq ("update")
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end
end

