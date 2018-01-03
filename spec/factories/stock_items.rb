FactoryBot.define do
  factory :stock_item do
    stock_item_status         { ApplicationHelper::STOCK_STATUS.sample}
    days_ago                  = Faker::Date.between(100.days.ago, Date.today)
    stock_item_added_datetime { days_ago }
    stock_item_sold_datetime  { Faker::Date.between(days_ago, Date.today) }
    stock_item_sold_price     { Money.new(Faker::Commerce.price * 100,
                                ApplicationHelper::REGISTER_CURRENCIES.sample) }
    order_line                { FactoryHelpers.get_order_line() }
  end
  factory :invalid_stock_item, parent: :stock_item do
    stock_item_status         { 'wrong' }
    order_line                { nil }
  end
end
