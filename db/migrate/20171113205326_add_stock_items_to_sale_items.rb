class AddStockItemsToSaleItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :sale_items, :stock_item, foreign_key: true, index: true
  end
end
