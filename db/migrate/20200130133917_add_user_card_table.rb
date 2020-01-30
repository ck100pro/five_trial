class AddUserCardTable < ActiveRecord::Migration[6.0]
  def change
    create_table :user_cards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
