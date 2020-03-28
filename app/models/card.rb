class Card < ApplicationRecord
  validates :title, :presence => {:message => "文章名稱不能空白"}

  belongs_to :list

  scope :create_time_asc, -> { order(created_at: :desc) }

  def to_json
    {id: id, title: title, list_id: list_id, endtime_at: time_conversion(endtime_at)}
  end

  def card_content
    {id: id, title: title, endtime_at: time_conversion(endtime_at) , list_id: list_id}
  end

  def create_success_to_json
    {id: id, title: title, list_id: list_id, endtime_at: endtime_at}
  end

  def time_conversion(endtime_at)
    (endtime_at != nil)? endtime_at.to_s(:custom):""
  end
end