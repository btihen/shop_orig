FactoryBot.define do
  factory :sale_item do
    note        { Faker::Lorem.sentence }
    sale_price  { Money.new(Faker::Commerce.price * 100,
                  ApplicationHelper::CURRENCIES.sample) }
    sale        { FactoryHelpers.get_sale() }
    stock_item  { FactoryHelpers.get_stock_item() }
  end
end
