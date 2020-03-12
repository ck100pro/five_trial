class Card < ApplicationRecord
  validates :title, :presence => {:message => "CARD名稱不能空白"}

  belongs_to :list

  def to_json
    {id: id, title: title, list_id: list_id}
  end
end