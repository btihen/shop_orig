class Sale < ApplicationRecord
  belongs_to :register
  # has_one    :user,          through: :register
  has_one    :cashier,       through: :register
  #
  has_many   :sale_items
  has_many   :stock_items,   through: :sale_items
  # has_many   :products,      through: :stock_items
  # has_many   :suppliers,     through: :products

  validates :payment_method, presence: true,
                             inclusion: {in: ApplicationHelper::PAYMENT_METHOD}

end
