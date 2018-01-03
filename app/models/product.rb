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

  before_validation :assign_purchase_currency, on: :create
  # before_validation :assign_purchase_currency, on: [:create, :update]
  # before_save       :assign_purchase_currency

  monetize  :product_supplier_price_cents,
                            allow_nil: false,
                            numericality: false
                            # numericality: { greater_than_or_equal_to: 0 }
  monetize  :product_resell_item_price_cents,
                            allow_nil: true,
                            numericality: false

  validates :product_code,  presence: true, uniqueness: true,
                            length: { minimum: 2 }
  validates :product_name,  presence: true, # uniqueness: true,
                            length: { minimum: 2 }
  validates :product_status, presence: true,
                            inclusion: { in: ApplicationHelper::PRODUCT_STATUSES }
  validates :product_supplier_price_cents,
                            numericality: { greater_than_or_equal_to: 0 }
  validates :product_resell_item_price_cents,
                            allow_nil: true,
                            numericality: { greater_than_or_equal_to: 0 }
  validates :product_resell_item_price_currency, presence: true,
                            inclusion: { in: [ApplicationHelper::LOCAL_CURRENCY] }
  validates :product_supplier_price_currency, presence: true,
                            inclusion: { in: ApplicationHelper::SUPPLIER_CURRENCIES }
                            # inclusion: { in: ApplicationHelper::REGISTER_CURRENCIES }
  validates_date  :product_sell_by_date, allow_nil: false

  def package_created_at
    Time.zone.parse(self[:package_created_at].to_s) if self[:package_created_at]
  end

  def assign_purchase_currency
    unless supplier_id.nil?
      supplier = Supplier.find(supplier_id)
      self.product_supplier_price_currency = supplier.supplier_currency
    end

    self.product_resell_item_price_currency  = ApplicationHelper::LOCAL_CURRENCY
    self.product_resell_item_price_cents   ||= product_supplier_price_cents * 2
  end

end
