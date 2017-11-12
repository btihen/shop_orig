class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.monetize :product_price
      t.string :product_currency

      t.timestamps
    end
  end
end
