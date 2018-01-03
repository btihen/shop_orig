class Order < ApplicationRecord
  # belongs_to  :user
  belongs_to  :sourcer,     class_name: 'User', foreign_key: 'user_id'
  has_many    :order_lines
  has_many    :products,    through: :order_lines
  has_many    :supplier,    through: :products
  has_many    :stock_items, through: :order_lines

  validates   :order_status, presence: true,
                            inclusion: { in: ApplicationHelper::ORDER_STATUS }

end
