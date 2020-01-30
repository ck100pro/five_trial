class UsersPasswordColumnFix < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_password, :string, null: false, default: ""
    add_index :users, :user_password, unique: true
    remove_column :users, :password, :string
  end
end
