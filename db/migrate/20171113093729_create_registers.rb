class CreateRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :registers do |t|
      t.string   :register_name
      t.string   :register_currency,     null: false
      t.monetize :register_start_amount, null: false
      t.monetize :register_close_amount, amount: { null: true, default: nil }
      t.monetize :register_cash_deposit, amount: { null: true, default: nil }
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
