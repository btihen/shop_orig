class User < ApplicationRecord
  has_many :orders
  has_many :order_lines, through: :orders
  has_many :products_ordered, through: :order_lines, :source => 'product'

  has_many :registers
  has_many :sales,       through: :registers
  has_many :sale_lines,  through: :sales
  has_many :stock_items, through: :sale_lines
  has_many :sold_order_lines, through: :stock_items,   source: 'order_line'
  has_many :products_sold,    through: :sold_order_lines, source: 'product'

  validates :username,  presence: true, uniqueness: true, length: { minimum: 2 }
  validates :full_name, presence: true, length: { minimum: 2 }
  validates :user_role, presence: true,
                        inclusion: { :in => ApplicationHelper::USER_ROLES }

end
