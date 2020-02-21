class AddListTable < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false, default: ""
      t.integer :position
      t.references :board, null: false, foreign_key: true 

      t.timestamps null: false
    end
    add_index :lists, :title
  end
end
