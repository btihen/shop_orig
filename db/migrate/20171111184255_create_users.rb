class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.citext :user_login_name,  null: false
      t.string :user_full_name, null: false
      t.string :user_role,      null: false

      t.timestamps
    end
    add_index :users, :user_login_name, unique: true
    add_index :users, :user_role
  end
end
