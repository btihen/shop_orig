class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :supplier
  has_many   :order_items

  monetize :product_price_cents,
                          allow_nil: false,
                          numericality: false
                          # numericality: {
                          #   greater_than_or_equal_to: 0,
                          #   # less_than_or_equal_to: 100000
                          # }
  validates :product_price_cents,
                          numericality: { greater_than_or_equal_to: 0,
                                          # less_than_or_equal_to: 100000
                                        }
  validates :product_price_currency,
                          allow_nil: false,
                          inclusion: { in: ApplicationHelper::CURRENCIES }

  validates :product_name, presence: true, # uniqueness: true,
                           length: { minimum: 2 }

end
