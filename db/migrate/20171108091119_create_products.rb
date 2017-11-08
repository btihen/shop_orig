class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.monetize :order_price
      t.string :order_currency

      t.timestamps
    end
  end
end
