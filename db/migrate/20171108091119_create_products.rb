class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.monetize :product_price
      t.string :product_currency
      t.references :products, :supplier, foreign_key: true, index: true

      t.timestamps
    end
  end
end
