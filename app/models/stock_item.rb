class StockItem < ApplicationRecord
  belongs_to :order_item

  monetize   :sale_price_cents
end
