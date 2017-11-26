class User < ApplicationRecord
  has_many :orders
  has_many :order_items, through: :orders
  has_many :stock_items, through: :order_items
  # has_many :products_ordered
  #
  has_many :registers
  has_many :sales,       through: :registers
  has_many :sale_items,  through: :sales
  # has_many :products_sold

end
