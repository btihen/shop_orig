class Product < ApplicationRecord
  monetize :order_price_cents
end
