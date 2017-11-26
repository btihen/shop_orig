class SaleItem < ApplicationRecord
  belongs_to :sale
  has_one    :register,   through: :sale
  has_one    :user,       through: :register
  # has_one    :cashier,    through: :register, foreign_key: "user_id", class_name: 'User'
  #
  belongs_to :stock_item
  has_one    :order_item, through: :stock_item
  has_one    :product,    through: :order_item
  has_one    :supplier,   through: :product
  #
  has_one    :order,      through: :order_item
  # has_one    :orderer,    through: :order, foreign_key: "user_id", class_name: 'User'

  monetize   :sale_price_cents

end
