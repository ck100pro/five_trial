require 'rails_helper'

RSpec.describe "Card", type: :model do
  context "card create" do
    let!(:board) { create(:board) }
    let!(:list) { create(:list, :board_id => board.id) }
    
    it "create success" do
      name = Faker::Name.name 

      expect{ Card.create(title: name, list_id: list.id) }.to change { Card.count }.by(1)
      card = Card.last

      expect(card).to be_valid
      expect(card.title).to eq name
      expect(list.cards).to include(card)
    end

    it "create fail" do
      card = Card.create(title: "", list_id: list.id)

      expect(card).to be_invalid
      expect(card.errors[:title]).to be_present
    end
  end
end