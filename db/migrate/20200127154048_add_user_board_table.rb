class AddUserBoardTable < ActiveRecord::Migration[6.0]
  def change
    create_table :user_boards do |t|
      t.references :user,  null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
