FactoryBot.define do
  factory :register do
    start_amount  { Money.new(Faker::Commerce.price * 100,
                              ApplicationHelper::CURRENCIES.sample) }
    close_amount  { Money.new(Faker::Commerce.price * 100,
                              ApplicationHelper::CURRENCIES.sample) }
    cashier       { FactoryHelpers.get_cashier() }
  end
  factory :open_nil_register, parent: :register do
    close_amount_cents  { nil }
    close_amount_currency  { nil }
    # close_amount  { Money.new(nil, nil) }
  end
  factory :open_empty_register, parent: :register do
    close_amount_cents  { "" }
    close_amount_currency  { "" }
  end
  factory :closed_register, parent: :register do
    close_amount  { Money.new(Faker::Commerce.price * 100,
                              ApplicationHelper::CURRENCIES.sample) }
  end
  factory :invalid_register, parent: :register do
    start_amount_cents    { nil }
    start_amount_currency { nil }
    close_amount_cents    { nil }
    close_amount_currency { nil }
    # close_amount          { Money.new(nil, nil) }
    cashier               { nil }
  end
  factory :invalid_neg_register, parent: :register do
    # close_amount          { Money.new(-100, nil ) }
    close_amount_cents    { -1000 }
    close_amount_currency { '' }
  end
end
