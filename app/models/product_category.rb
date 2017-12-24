class ProductCategory < ApplicationRecord

  has_many   :products
  belongs_to :tax_category

  validates :product_category_name, presence: true,
                                    uniqueness: true,
                                    length: { minimum: 2 }
end
