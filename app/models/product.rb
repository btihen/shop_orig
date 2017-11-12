class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :order_item, optional: true

  monetize :product_price_cents

end
