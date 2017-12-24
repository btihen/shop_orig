class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.text :order_item_note
      t.monetize :item_purchase_price

      t.timestamps
    end
  end
end
