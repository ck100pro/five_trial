class AddTagsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :title, null: false, default: ""
      t.string :color, default: ""

      t.timestamps null: false
    end
    add_index :tags, :title, unique: true
  end
end
