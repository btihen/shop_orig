class SaleItem < ApplicationRecord
  belongs_to :sale
  has_one    :register,   through: :sale
  has_one    :user,       through: :register
  has_one    :cashier,    through: :register
  #
  belongs_to :stock_item
  has_one    :order_item, through: :stock_item
  has_one    :product,    through: :order_item
  has_one    :supplier,   through: :product
  #
  has_one    :order,      through: :order_item
  has_one    :sourcer,    through: :order

  monetize :sale_price_cents,
                          allow_nil: false,
                          numericality: false
                          # numericality: {
                          #   greater_than_or_equal_to: 0,
                          #   # less_than_or_equal_to: 100000
                          # }
  validates  :sale_price_cents,
                          numericality: { greater_than_or_equal_to: 0,
                                          # less_than_or_equal_to: 100000
                                        }
  validates  :sale_price_currency,
                          inclusion: { in: ApplicationHelper::CURRENCIES },
                          allow_nil: false

end
