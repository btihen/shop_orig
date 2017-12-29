class CreateRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :registers do |t|
      t.string   :register_currency
      t.monetize :start_amount
      t.monetize :close_amount, amount: { null: true, default: nil }
      t.monetize :cash_deposit, amount: { null: true, default: nil }
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
