class AddBoardTable < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string  :title,  null:false, default: ""
      t.boolean :status, null:false, default: true

      t.timestamps null: false
    end
    add_index :boards, :title,  unique: true
    add_index :boards, :status, unique: true
  end
end
