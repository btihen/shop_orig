class Product < ApplicationRecord
  belongs_to :supplier
  monetize :order_price_cents
end
