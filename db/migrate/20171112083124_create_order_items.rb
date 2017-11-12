class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.text :note
      t.monetize :item_purchase_price
      # t.references :order_items, :product, foreign_key: true, index: true

      t.timestamps
    end
  end
end
