require 'rails_helper'

RSpec.describe "List", type: :model do
  context "list create" do
    let!(:board) { create(:board) }

    it "create success" do
      name = Faker::Name.name 

      expect{ List.create(title: name, board_id: board.id) }.to change { List.count }.by(1)
      list = List.last

      expect(list).to be_valid
      expect(list.title).to eq name
      expect(board.lists).to include(list)
    end

    it "create fail" do
      list = List.create(title: "", board_id: board.id)
      
      expect(list).to be_invalid
      expect(list.errors[:title]).to be_present
    end
  end
end