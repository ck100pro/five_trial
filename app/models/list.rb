class List < ApplicationRecord
  validates :title, :presence => {:message => "類別名稱不能空白"}
  
  belongs_to :board
  has_many :cards

  scope :create_time_asc_includes_cards,-> { order(created_at: :asc).includes(:cards) }

  def to_json
    {id: id, title: title, card: cards}
  end

  def create_sucess_to_json
    {id: id, title: title, card: [], messages: "類別建立完成"}
  end
end