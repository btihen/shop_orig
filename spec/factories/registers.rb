FactoryBot.define do
  factory :register do
    start_amount  { Money.new(Faker::Commerce.price * 100,
                              ApplicationHelper::CURRENCIES.sample) }
    close_amount  { Money.new(Faker::Commerce.price * 100,
                              ApplicationHelper::CURRENCIES.sample) }
    cashier       { FactoryHelpers.get_cashier() }
  end
  factory :invalid_register, parent: :register do
    start_amount  { Money.new(-1100,
                              ApplicationHelper::CURRENCIES.sample) }
    cashier       { nil }
  end
end
