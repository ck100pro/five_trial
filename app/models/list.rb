class List < ApplicationRecord
  validates :title, :presence => {:message => "List名稱不能空白"}
  
  belongs_to :board
  has_many :cards
end