class AddUserTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name,     null:false, default: ""    
      t.string :password, null:false, default: ""
      t.string :email,    null:false, default: ""
      t.boolean :status,  null:false, default: true

      t.timestamps null: false
    end
    add_index :users, :name,  unique: true
    add_index :users, :email, unique: true
  end
end
