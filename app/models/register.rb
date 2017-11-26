class Register < ApplicationRecord
  # belongs_to :user
  belongs_to :cashier, class_name: 'User', foreign_key: 'user_id'

  has_many   :sales
  has_many   :sale_items, through: :sales

  monetize :start_amount_cents
  monetize :close_amount_cents

end
