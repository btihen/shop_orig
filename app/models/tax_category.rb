class TaxCategory < ApplicationRecord

  has_many :tax_rates
  has_many :product_categories

  validates :tax_category_name, presence: true,
                                uniqueness: true,
                                length: { minimum: 2 }
end
