class Card < ApplicationRecord
  validates :title, :presence => {:message => "CARD名稱不能空白"}
end