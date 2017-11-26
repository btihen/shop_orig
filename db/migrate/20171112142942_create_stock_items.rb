class CreateStockItems < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_items do |t|
      t.string :status
      t.datetime :add_datetime
      t.datetime :sale_datetime
      t.monetize :sale_price
      t.references :order_item, foreign_key: true, index: true

      t.timestamps
    end
  end
end
