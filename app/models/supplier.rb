class Supplier < ApplicationRecord
  has_many  :products

  validates :supplier_name, presence: true, uniqueness: true,
                            length: { minimum: 2 }
  validates :supplier_currency,
                            allow_nil: false,
                            inclusion: { in: ApplicationHelper::REGISTER_CURRENCIES }
                            
end
