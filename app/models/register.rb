class Register < ApplicationRecord
  # belongs_to :user
  belongs_to :cashier, class_name: 'User', foreign_key: 'user_id'

  has_many   :sales
  has_many   :sale_items,  through: :sales
  has_many   :stock_items, through: :sale_items
  has_many   :order_items, through: :stock_items
  has_many   :products_sold, through: :order_items, source: 'product'

  monetize :start_amount_cents
  monetize :close_amount_cents

end
