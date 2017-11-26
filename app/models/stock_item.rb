class StockItem < ApplicationRecord
  belongs_to :order_item
  
  has_one    :product,    through: :order_item
  has_one    :supplier,   through: :product

  has_one    :order,      through: :order_item
  has_one    :procurer,   through: :order

  monetize   :sale_price_cents
end
