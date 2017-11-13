class CreateRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :registers do |t|
      t.monetize :start_amount
      t.monetize :close_amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
