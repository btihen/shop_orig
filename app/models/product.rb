class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :supplier
  has_many   :order_lines
  has_many   :supplier_packages
  # has_many   :included_products, through: :supplier_packages
  has_many   :included_products, through: :supplier_packages, dependent: :destroy do
    def with_package_data
      select('products.*, supplier_packages.created_at AS package_created_at')
    end

    def count(column_name = :all)
      super
    end
  end

  # before_validation :create_details_json, on: [:create, :update]
  before_save         :create_details_json

  validates :product_code,  presence: true, uniqueness: true,
                            length: { minimum: 2 }
  validates :product_name,  presence: true, # uniqueness: true,
                            length: { minimum: 2 }
  validates :product_status, presence: true,
                            inclusion: { in: ApplicationHelper::PRODUCT_STATUSES }

  def package_created_at
    Time.zone.parse(self[:package_created_at].to_s) if self[:package_created_at]
  end

  def create_details_json
    self.product_details = {
                              product_size: self.product_size,
                              product_color: self.product_color,
                              product_style: self.product_style,
                              product_material: self.product_material,
                            }
  end

end
