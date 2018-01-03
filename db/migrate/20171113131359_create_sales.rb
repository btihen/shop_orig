class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.string   :sale_payment_method,      null: false
      t.references :register, foreign_key: true, index: true

      t.timestamps
    end
  end
end
