class CreateStockItems < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_items do |t|
      t.string   :stock_item_status,         null: false
      t.monetize :stock_item_bought_price,   null: false
      t.monetize :stock_item_resell_price,   null: false
      t.date     :stock_item_sell_by_date
      t.monetize :stock_item_sold_price
      t.datetime :stock_item_sold_datetime
      t.references :order_line, foreign_key: true, index: true

      t.timestamps
    end
  end
end
