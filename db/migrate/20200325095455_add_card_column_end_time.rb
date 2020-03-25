class AddCardColumnEndTime < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :endtime_at, :datetime, precision: 6
  end
end
