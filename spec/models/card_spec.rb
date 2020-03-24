require 'rails_helper'

RSpec.describe "Card", type: :model do
  context "card create" do
    let!(:board) { create(:board) }
    let!(:list) { create(:list, :board_id => board.id) }
    
    it "create success" do
      name = Faker::Name.name 

      c1 = Card.new(title: name)
      list.cards = [c1]

      expect(c1).to be_valid
      expect(Card.last.title).to eq name
      expect(Card.count).to eq 1
      expect(list.cards).to include(c1)
    end

    it "create fail" do
      c1 = Card.new(title: "")
      expect(c1).to be_invalid
    end
  end
end