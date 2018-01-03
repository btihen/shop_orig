FactoryBot.define do
  factory :register do
    register_currency           { ApplicationHelper::REGISTER_CURRENCIES.sample }
    register_start_amount_cents { Faker::Commerce.price * 100 }
    register_close_amount_cents { [Faker::Commerce.price * 100, nil].sample }
    register_cash_deposit_cents { (register_close_amount_cents.nil? ? nil : register_close_amount_cents * 4) }
    cashier                     { FactoryHelpers.get_cashier() }
  end
  factory :open_register_closed_nil, parent: :register do
    register_close_amount_cents { nil }
    register_cash_deposit_cents { nil }
  end
  factory :open_register_closed_blank, parent: :register do
    register_close_amount_cents { "" }
    register_cash_deposit_cents { "" }
  end
  factory :closed_register, parent: :register do
    register_close_amount_cents { Faker::Commerce.price * 100 }
    register_cash_deposit_cents { Faker::Commerce.price * 100 }
  end
  factory :invalid_register, parent: :register do
    register_currency           { nil }
    register_start_amount_cents { nil }
    register_close_amount_cents { nil }
    cashier                     { nil }
  end
  factory :invalid_neg_register, parent: :register do
    register_currency           { ApplicationHelper::REGISTER_CURRENCIES.sample }
    register_close_amount_cents { -1000 }
  end
end
