class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.citext :username,          null: false
      t.citext :user_email,        null: false
      t.string :user_real_name,    null: false
      t.string :user_role,         null: false

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :user_role
  end
end
