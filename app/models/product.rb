class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :supplier
  has_many   :order_lines

  before_validation :assign_currency

  # monetize :product_price_cents,
  #                         allow_nil: false,
  #                         numericality: false
  #                         # numericality: {
  #                         #   greater_than_or_equal_to: 0,
  #                         #   # less_than_or_equal_to: 100000
  #                         # }
  # validates :product_price_cents,
  #                         numericality: { greater_than_or_equal_to: 0,
  #                                         # less_than_or_equal_to: 100000
  #                                       }
  # validates :product_price_currency,
  #                         allow_nil: false,
  #                         inclusion: { in: ApplicationHelper::CURRENCIES }
  #
  # validates :product_name, presence: true, # uniqueness: true,
  #                          length: { minimum: 2 }

  monetize  :product_supplier_price_cents,
                            allow_nil: false,
                            numericality: false
                            # numericality: { greater_than_or_equal_to: 0 }
  monetize  :product_resell_item_price_cents,
                            allow_nil: true,
                            numericality: false

  validates :product_supplier_price_cents,
                            numericality: { greater_than_or_equal_to: 0 }
  validates :product_resell_item_price_cents,
                            allow_nil: true,
                            numericality: { greater_than_or_equal_to: 0 }
  validates :product_name,  presence: true, # uniqueness: true,
                            length: { minimum: 2 }
  validates :assign_currency, presence: true,
                            inclusion: { in: ApplicationHelper::CURRENCIES }

  def assign_currency
    product_supplier_price_currency = product_currency
  end

  def product_currency
    return nil if supplier_id.nil?
    # return 'CHF' if supplier_id.nil?
    Supplier.find(supplier_id).supplier_currency
  end

end
