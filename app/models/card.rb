class Card < ApplicationRecord
  validates :title, :presence => {:message => "文章名稱不能空白"}

  belongs_to :list

  scope :create_time_asc, -> { order(created_at: :desc) }

  def to_json
    {id: id, title: title, list_id: list_id}
  end

  def card_content
    {id: id, title: title, endtime_at: time_strftime(endtime_at) , list_id: list_id}
  end

  def create_success_to_json
    {id: id, title: title, list_id: list_id}
  end

  def time_strftime(time)
    if time == nil
      time.to_s
    else
      time.strftime("%F %H:%M")
    end
  end
end

# endtime_at.strftime("%Y-%m-%d %H:%m")