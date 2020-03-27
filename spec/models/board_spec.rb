require 'rails_helper'

RSpec.describe "Board", type: :model do
  context "board create" do
    
    it "create success" do
      name = Faker::Name.name 

      expect{ Board.create(title: name) }.to change { Board.count}.by(1)

      board = Board.last
      expect(board).to be_present
      expect(board.title).to eq name
    end

    it "create fail" do
      board = Board.create(title: "")
      
      expect(board).to be_invalid
      expect(board.errors[:title]).to be_present
    end
  end
end