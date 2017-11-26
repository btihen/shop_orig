class Order < ApplicationRecord
  # belongs_to  :user
  belongs_to  :procurer,    class_name: 'User', foreign_key: 'user_id'
  has_many    :order_items
  has_many    :products,    through: :order_items
  has_many    :supplier,    through: :products
  has_many    :stock_items, through: :order_items

end
