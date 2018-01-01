class SupplierPackage < ApplicationRecord

  belongs_to :product
  belongs_to :included_product, class_name: "Product"

  after_create  :create_inverse,    unless: :has_inverse?
  after_destroy :destroy_inverses,      if: :has_inverse?

  validates :included_quantity,  allow_nil: false,
                              numericality: { greater_than: 0 }

  def create_inverse
    self.class.create(inverse_package_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_package_options)
  end

  def inverses
    self.class.where(inverse_package_options)
  end

  def inverse_package_options
    { included_product_id: product_id, product_id: included_product_id }
  end

end
