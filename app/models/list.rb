class List < ApplicationRecord
  validates :title, :presence => {:message => "List名稱不能空白"}
  
  belongs_to :board
  has_many :cards

  scope :create_time_asc_includes_cards,-> { order(created_at: :asc).includes(:cards) }

  def to_json
    {id: id, title: title, card: cards}
  end
end