class CreateStockItems < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_items do |t|
      t.string   :stock_item_status,         null: false
      t.datetime :stock_item_added_datetime, null: false
      t.monetize :stock_item_resell_price
      t.monetize :stock_item_sold_price
      t.datetime :stock_item_sold_datetime
      t.references :order_line, foreign_key: true, index: true

      t.timestamps
    end
  end
end
