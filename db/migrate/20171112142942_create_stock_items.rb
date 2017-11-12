class CreateStockItems < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_items do |t|
      t.string :status
      t.date :add_date
      t.date :sale_date
      t.monetize :sale_price
      t.references :order_item, foreign_key: true

      t.timestamps
    end
  end
end
