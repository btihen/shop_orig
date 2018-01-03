class Register < ApplicationRecord
  # belongs_to :user
  belongs_to :cashier, class_name: 'User', foreign_key: 'user_id'

  has_many   :sales
  has_many   :sale_lines,     through: :sales
  has_many   :stock_items,    through: :sale_lines
  has_many   :order_lines,    through: :stock_items
  has_many   :products_sold,  through: :order_lines, source: 'product'

  monetize   :register_start_amount_cents, disable_validation: true
  monetize   :register_close_amount_cents, disable_validation: true
  monetize   :register_cash_deposit_cents, disable_validation: true

  after_validation(on: :create) do
    self.register_start_amount = Money.new(register_start_amount_cents.to_i,
                                  register_currency) if attribute_present?("register_start_amount_cents")
    self.register_close_amount = Money.new(register_close_amount_cents.to_i,
                                  register_currency) if attribute_present?("register_close_amount_cents")
  end

  validates  :register_currency, presence: true,
                              allow_nil: false,
                              inclusion: { in: ApplicationHelper::REGISTER_CURRENCIES }
  validates  :register_start_amount_cents,
                              allow_nil: false,
                              numericality: { greater_than_or_equal_to: 0 }
  validates  :register_close_amount_cents,
                              allow_nil: true,
                              numericality: { greater_than_or_equal_to: 0 } #,
                              # if: :validate_close_amount?
  validates  :register_cash_deposit_cents,
                              allow_nil: true,
                              numericality: { greater_than_or_equal_to: 0 },
                              if: :validate_cash_deposit?

  def validate_close_amount?
    return true if not cash_deposit_cents.nil? and cash_deposit_cents > 0
  end
  def validate_cash_deposit?
    return true if not register_close_amount_cents.nil? and register_close_amount_cents > 0
  end

end
