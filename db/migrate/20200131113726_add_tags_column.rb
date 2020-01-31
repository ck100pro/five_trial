class AddTagsColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :board_id, :integer, null: false
    add_index :tags, :board_id
  end
end
