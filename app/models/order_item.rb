class OrderItem < ApplicationRecord
  belongs_to  :order
  belongs_to  :product
  has_one     :supplier, through: :product

  monetize :item_purchase_price_cents

end
