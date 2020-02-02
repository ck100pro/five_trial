class AddCardTable < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title, null: false, default: ""
      t.integer :position
      t.boolean :status, null: false, default: true
      t.references :list, null: false, foreign_key: true

      t.timestamps null: false
    end
    add_index :cards, :title, unique: true
  end
end
