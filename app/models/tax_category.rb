class TaxCategory < ApplicationRecord

  has_many :product_categories

  validates :tax_category_name, presence: true,
                                uniqueness: true,
                                length: { minimum: 2 }
  # validates :tax_category_rate, allow_nil: false,
  #                               numericality: {
  #                                 greater_than_or_equal_to: 0,
  #                               }
  # validates_date  :tax_start_date,    allow_nil: false
end
