class StockItem < ApplicationRecord
  belongs_to :order_line

  has_one    :product,  through: :order_line
  has_one    :supplier, through: :product

  has_one    :order,    through: :order_line
  has_one    :sourcer,  through: :order

  # before_validation :assign_purchase_currency, on: [:create, :update]
  # before_validation :assign_purchase_currency, on: :create
  # before_save       :assign_purchase_currency

  monetize   :stock_item_bought_price_cents,
                        allow_nil: false
  monetize   :stock_item_resell_price_cents,
                        allow_nil: false
  monetize   :stock_item_sold_price_cents,
                        allow_nil: true
  # monetize  :stock_item_bought_price,
  #                       allow_nil: false,
  #                       numericality: false
  #                       # numericality: { greater_than_or_equal_to: 0 }
  # monetize  :stock_item_sold_price,
  #                       allow_nil: true,
  #                       numericality: false

  # validates :stock_item_bought_price_cents,
  #                       numericality: { greater_than_or_equal_to: 0 }
  # validates :stock_item_sold_price_cents,
  #                       allow_nil: true,
  #                       numericality: { greater_than_or_equal_to: 0 }
  # validates :stock_item_bought_price_currency, presence: true,
  #                       inclusion: { in: [ApplicationHelper::LOCAL_CURRENCY] }
  # validates :stock_item_sold_currency, presence: true,
  #                       inclusion: { in: ApplicationHelper::SUPPLIER_CURRENCIES }
  #                       # inclusion: { in: ApplicationHelper::REGISTER_CURRENCIES }
  validates  :stock_item_status,
                        presence: true,
                        inclusion: { in: ApplicationHelper::STOCK_STATUS }
  validates_date :stock_item_sold_datetime,
                        allow_nil: true
  validates_date :stock_item_sell_by_date,
                        allow_nil: true

  # def assign_purchase_currency
  #   unless supplier_id.nil?
  #     supplier = Supplier.find(supplier_id)
  #     self.product_supplier_price_currency = supplier.supplier_currency
  #   end
  #
  #   self.product_resell_item_price_currency  = ApplicationHelper::LOCAL_CURRENCY
  #   self.product_resell_item_price_cents   ||= product_supplier_price_cents * 2
  # end

end
