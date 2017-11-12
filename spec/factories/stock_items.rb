FactoryBot.define do
  factory :stock_item do
    status      { ApplicationHelper::STOCK_STATUS.sample}
    days_ago    = rand(0..100)
    add_date    { Date.today - days_ago }
    sale_date   { Date.today - rand(0..days_ago) }
    sale_price  { Money.new(Faker::Commerce.price * 100,
                  ApplicationHelper::CURRENCIES.sample) }
    order_item  { FactoryHelpers.get_order() }
  end
end
