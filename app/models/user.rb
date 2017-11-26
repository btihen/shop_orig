class User < ApplicationRecord
  has_many :orders
  has_many :order_items, through: :orders
  has_many :products_ordered, through: :order_items, :source => 'product'
  #
  has_many :registers
  has_many :sales,       through: :registers
  has_many :sale_items,  through: :sales
  has_many :stock_items, through: :sale_items #, :source => 'stock_item'
  # has_many :sold_order_items, through: :stock_items, :source => 'order_item'
  # has_many   :products_sold, through: :sold_order_items, source: 'product'

end
