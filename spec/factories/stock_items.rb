FactoryBot.define do
  factory :stock_item do
    status        { ApplicationHelper::STOCK_STATUS.sample}
    days_ago      = Faker::Date.between(100.days.ago, Date.today)
    add_datetime  { days_ago }
    sold_datetime { Faker::Date.between(days_ago, Date.today) }
    sell_price    { Money.new(Faker::Commerce.price * 100,
                    ApplicationHelper::CURRENCIES.sample) }
    order_line    { FactoryHelpers.get_order_line() }
  end
  factory :invalid_stock_item, parent: :stock_item do
    status        { 'wrong' }
    order_line    { nil }
  end
end
