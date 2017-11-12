class Product < ApplicationRecord
  belongs_to :supplier
  has_many   :order_items

  monetize :product_price_cents

end
