require 'rails_helper'

RSpec.describe "Board", type: :model do
  context "board create" do
    let!(:board) { create(:board) }
    
    it "create success" do
      expect(board).to be_valid
      expect(Board.last.title).to eq board.title
      expect(Board.count).to eq 1
    end

    it "create fail" do
      b1 = Board.new(title: "")
      expect(b1).to be_invalid
    end
  end
end