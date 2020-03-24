require 'rails_helper'

RSpec.describe "List", type: :model do
  context "list create" do
    let!(:board) { create(:board) }

    it "create success" do
      name = Faker::Name.name 

      l1 = List.new(title: name)
      board.lists = [l1]

      expect(l1).to be_valid
      expect(List.last.title).to eq name
      expect(List.count).to eq 1
      expect(board.lists).to include(l1)
    end

    it "create fail" do
      l1 = List.new(title: "")
      
      expect(l1).to be_invalid
    end
  end
end