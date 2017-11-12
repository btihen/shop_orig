class OrderItem < ApplicationRecord
  belongs_to  :order
  belongs_to  :product
  has_one     :supplier, through: :product
  has_many    :stock_items

  monetize :item_purchase_price_cents

end