class List < ApplicationRecord
  validates :title, :presence => { :message => "類別名稱不能空白" }
  
  belongs_to :board
  has_many :cards

  scope :create_time_asc_includes_cards,-> { order(created_at: :asc).includes(:cards) }

  def to_json
    { id: id, title: title, card: cards }
  end

  def create_success_to_json
    { id: id, title: title, card: [] }
  end

  def update_success_to_json
    { id: id, title: title, messages: "類別名稱更新完成" }
  end

end