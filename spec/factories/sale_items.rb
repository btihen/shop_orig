FactoryBot.define do
  factory :sale_item do
    note        { Faker::Lorem.sentence }
    sale_price  { Money.new(Faker::Commerce.price * 100,
                            ApplicationHelper::CURRENCIES.sample) }
    sale        { FactoryHelpers.get_sale() }
    stock_item  { FactoryHelpers.get_stock_item() }
  end
  factory :invalid_sale_item, parent: :sale_item do
    sale        { nil }
    stock_item  { nil }
    sale_price_cents    { nil }
    sale_price_currency { nil }
    # sale_price  { Money.new(nil, nil) }
  end
  factory :invalid_nil_sale_item, parent: :sale_item do
    sale        { nil }
    stock_item  { nil }
    sale_price_cents    { -1000 }
    sale_price_currency { nil }
    # sale_price  { Money.new(nil, nil) }
  end
  factory :invalid_neg_sale_item, parent: :sale_item do
    sale        { nil }
    stock_item  { nil }
    sale_price_cents    { -1000 }
    sale_price_currency { nil }
    # sale_price  { Money.new(-100, nil ) }
  end
end
