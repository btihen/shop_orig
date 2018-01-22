class TaxRate < ApplicationRecord
  belongs_to :tax_category

  # valitates :tax_category_name, presence: true
  validates :tax_rate,          allow_nil: false,
                                numericality: {
                                  greater_than_or_equal_to: 0,
                                }
  validates_date  :tax_start_date,  allow_nil: false

end
