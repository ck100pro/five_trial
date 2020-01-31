class Tag < ApplicationRecord
  has_many :card_tags
  has_many :cards, :card_tags
  belongs_to :board
end