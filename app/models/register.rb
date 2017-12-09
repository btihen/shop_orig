class Register < ApplicationRecord
  # belongs_to :user
  belongs_to :cashier, class_name: 'User', foreign_key: 'user_id'

  has_many   :sales
  has_many   :sale_items,     through: :sales
  has_many   :stock_items,    through: :sale_items
  has_many   :order_items,    through: :stock_items
  has_many   :products_sold,  through: :order_items, source: 'product'

  monetize   :start_amount_cents,
                              allow_nil: false,
                              numericality: false
                              # numericality: {
                              #   greater_than_or_equal_to: 0,
                              #   # less_than_or_equal_to: 100000
                              # }
  validates  :start_amount_cents,
                              numericality: { greater_than_or_equal_to: 0 },
                              allow_nil: false
  validates  :start_amount_currency,
                              inclusion: { in: ApplicationHelper::CURRENCIES },
                              allow_nil: false
  #
  monetize   :close_amount_cents,
                              allow_nil: true,
                              numericality: false
                              # disable_validation: true,
                              # numericality: {
                              #   greater_than_or_equal_to: 0,
                              #   # less_than_or_equal_to: 100000
                              # }
  validates  :close_amount_cents,
                            numericality: { greater_than_or_equal_to: 0 },
                            allow_nil: true, if: :validate_close_amount?
  validates  :close_amount_currency,
                            inclusion: { in: ApplicationHelper::CURRENCIES },
                            allow_nil: true, if: :validate_close_amount?
  # validates  :start_amount, presence: true,
  #                           numericality: { greater_than_or_equal_to: 0 }
  # validates  :close_amount, numericality: { greater_than_or_equal_to: 0 }

  def validate_close_amount?
    return true unless close_amount_cents.blank?
  end

end
