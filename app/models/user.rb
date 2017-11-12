class User < ApplicationRecord
  has_many :orders
  has_many :order_items, through: :orders
  has_many :stock_items, through: :order_items

end
