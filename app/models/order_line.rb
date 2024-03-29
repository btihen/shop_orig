class OrderLine < ApplicationRecord
  belongs_to  :order
  has_one     :sourcer,   through: :order

  belongs_to  :product
  has_one     :supplier,  through: :product
  has_many    :stock_items

  monetize  :order_line_actual_purchase_price_cents,
                          allow_nil: false,
                          numericality: false
  validates :order_line_actual_purchase_price_cents,
                          allow_nil: false,
                          numericality: { greater_than_or_equal_to: 0 }
  validates :order_line_actual_purchase_price_currency,
                          allow_nil: false,
                          inclusion: { in: ApplicationHelper::REGISTER_CURRENCIES }
  validates :order_line_quantity,
                          allow_nil: false,
                          numericality: {
                            only_integer: true,
                            greater_than_or_equal_to: 1,
                          }

end
