FactoryBot.define do
  factory :register do
    start_amount   { Money.new(Faker::Commerce.price * 100,
                    ApplicationHelper::CURRENCIES.sample) }
    close_amount  { Money.new(Faker::Commerce.price * 100,
                    ApplicationHelper::CURRENCIES.sample) }
    user          { FactoryHelpers.get_user() }
  end
end
