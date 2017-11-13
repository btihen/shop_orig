FactoryBot.define do
  factory :stock_item do
    status        { ApplicationHelper::STOCK_STATUS.sample}
    days_ago      = Faker::Date.between(100.days.ago, Date.today)
    add_datetime  { days_ago }
    sale_datetime { Faker::Date.between(days_ago, Date.today) }
    sale_price    { Money.new(Faker::Commerce.price * 100,
                    ApplicationHelper::CURRENCIES.sample) }
    order_item    { FactoryHelpers.get_order() }
  end
end
