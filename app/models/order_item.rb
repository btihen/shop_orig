class OrderItem < ApplicationRecord

  monetize :item_purchase_price_cents
end
