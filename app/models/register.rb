class Register < ApplicationRecord
  # belongs_to :user
  belongs_to :cashier, class_name: 'User', foreign_key: 'user_id'

  has_many   :sales
  has_many   :sale_items,     through: :sales
  has_many   :stock_items,    through: :sale_items
  has_many   :order_items,    through: :stock_items
  has_many   :products_sold,  through: :order_items, source: 'product'

  monetize   :start_amount_cents, disable_validation: true
  monetize   :close_amount_cents, disable_validation: true

  after_validation(on: :create) do
    self.start_amount = Money.new(start_amount_cents.to_i,
                                  register_currency) if attribute_present?("start_amount_cents")
    self.close_amount = Money.new(close_amount_cents.to_i,
                                  register_currency) if attribute_present?("close_amount_cents")
  end

  validates  :register_currency, presence: true,
                              allow_nil: false,
                              inclusion: { in: ApplicationHelper::CURRENCIES }
  validates  :start_amount_cents,
                              numericality: { greater_than_or_equal_to: 0 },
                              allow_nil: false
  validates  :close_amount_cents,
                              numericality: { greater_than_or_equal_to: 0 },
                              allow_nil: true #,
                              # if: :validate_close_amount?

  # def validate_close_amount?
  #   return true unless close_amount_cents.blank?
  # end

end
