FactoryBot.define do
  factory :register do
    register_currency  { ApplicationHelper::REGISTER_CURRENCIES.sample }
    start_amount_cents { Faker::Commerce.price * 100 }
    close_amount_cents { [Faker::Commerce.price * 100, nil].sample }
    cash_deposit_cents { (close_amount_cents.nil? ? nil : close_amount_cents * 4) }
    # cash_deposit_cents { (cash_deposit_cents.nil? ? nil : Faker::Commerce.price * 100) }
    # start_amount      { Money.new(Faker::Commerce.price * 100, register_currency) }
    # close_amount      { Money.new(Faker::Commerce.price * 100, register_currency) }
    cashier            { FactoryHelpers.get_cashier() }
  end
  factory :open_register_closed_nil, parent: :register do
    close_amount_cents { nil }
    cash_deposit_cents { nil }
  end
  factory :open_register_closed_blank, parent: :register do
    close_amount_cents { "" }
    cash_deposit_cents { "" }
  end
  factory :closed_register, parent: :register do
    close_amount_cents { Faker::Commerce.price * 100 }
    cash_deposit_cents { Faker::Commerce.price * 100 }
  end
  factory :invalid_register, parent: :register do
    register_currency  { nil }
    start_amount_cents { nil }
    close_amount_cents { nil }
    cashier            { nil }
  end
  factory :invalid_neg_register, parent: :register do
    register_currency  { ApplicationHelper::REGISTER_CURRENCIES.sample }
    close_amount_cents { -1000 }
  end
end
