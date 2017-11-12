class OrderItem < ApplicationRecord
  belongs_to  :product 

  monetize :item_purchase_price_cents
end
