class Supplier < ApplicationRecord
  has_many  :products

  validates :supplier_name, presence: true, uniqueness: true,
                            length: { minimum: 2 }

end
