class User < ApplicationRecord
  has_many :orders
  has_many :order_items, through: :orders
  has_many :products_ordered, through: :order_items
  #
  has_many :registers
  has_many :sales,       through: :registers
  has_many :sale_items,  through: :sales
  has_many :stock_items, through: :sale_items
  has_many :sold_orders, through: :stock_items, class_name: 'OrderItem', foreign_key: 'order_item_id'
  has_many :products_sold, through: :sold_items

end
