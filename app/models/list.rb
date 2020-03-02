class List < ApplicationRecord
  validates :title, presence: true
  belongs_to :board

  def error_message
    errors.add(:title, "名稱不能空白")
  end
end