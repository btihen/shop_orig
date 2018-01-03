FactoryBot.define do
  factory :sale_line do
    sale_line_quantity       { Faker::Number.between(1, 10) }
    sale_line_note           { Faker::Lorem.sentence }
    sale_line_price_cents    { Faker::Commerce.price * 100 }
    sale_line_price_currency { ApplicationHelper::REGISTER_CURRENCIES.sample }
    # sale_line_sale_price  { Money.new(Faker::Commerce.price * 100,
    #                                   ApplicationHelper::REGISTER_CURRENCIES.sample) }
    sale                     { FactoryHelpers.get_sale() }
    stock_item               { FactoryHelpers.get_stock_item() }
  end
  factory :invalid_nil_sale_line, parent: :sale_line do
    sale                     { nil }
    stock_item               { nil }
    sale_line_quantity       { nil }
    sale_line_price_cents    { nil }
    # sale_price          { Money.new(nil, nil) }
  end
  factory :invalid_neg_sale_line, parent: :sale_line do
    sale                     { nil }
    stock_item               { nil }
    sale_line_quantity       { -1 }
    sale_line_price_cents    { -1000 }
    sale_line_price_currency { nil }
    # sale_price          { Money.new(-100, nil ) }
  end
end
