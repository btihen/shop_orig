class Order < ApplicationRecord
  belongs_to  :user
  has_many    :order_items
  has_many    :products,    through: :order_items
  has_many    :supplier,    through: :products
  has_many    :stock_items, through: :order_items

end
