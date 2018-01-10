class Sale < ApplicationRecord
  belongs_to :register
  has_one    :cashier,      through: :register

  has_many   :sale_lines
  has_many   :stock_items,  through: :sale_lines
  has_many   :products,     through: :stock_items
  has_many   :suppliers,    through: :products

  validates :sale_payment_method,
                            presence: true,
                            inclusion: {in: ApplicationHelper::PAYMENT_METHOD}

end
