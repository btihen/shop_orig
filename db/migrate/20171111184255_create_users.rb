class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.citext :username
      t.string :full_name
      t.string :role

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :role
  end
end
