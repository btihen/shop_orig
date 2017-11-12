class Order < ApplicationRecord
  belongs_to  :user
  has_many    :order_items
  has_many    :products, through: :order_items
  has_many    :supplier, through: :products

end
