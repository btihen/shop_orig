class StockItem < ApplicationRecord
  belongs_to :order_line

  has_one    :product,  through: :order_line
  has_one    :supplier, through: :product

  has_one    :order,    through: :order_line
  has_one    :sourcer,  through: :order

  monetize   :stock_item_sold_price_cents

  validates  :stock_item_status,
                        presence: true,
                        inclusion: { in: ApplicationHelper::STOCK_STATUS }

end
