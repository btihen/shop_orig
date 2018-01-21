class TaxCategory < ApplicationRecord

  has_many :product_categories

  validates :tax_category_name, presence: true,
                                uniqueness: true,
                                length: { minimum: 2 }
  # valitates :tax_category_info, presence: true
  # validates :tax_rate,          allow_nil: false,
  #                               numericality: {
  #                                 greater_than_or_equal_to: 0,
  #                               }
  # validates_date  :start_date,  allow_nil: false
end
