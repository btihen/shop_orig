FactoryBot.define do
  factory :order_line do
    order_line_quantity { Faker::Number.between(1, 10) }
    order_line_note     { Faker::Hipster.sentence }
    order_line_actual_purchase_price { Money.new(Faker::Commerce.price * 100,
                          ApplicationHelper::REGISTER_CURRENCIES.sample) }
    #
    product             { FactoryHelpers.get_product() }
    order               { FactoryHelpers.get_order() }
  end
  factory :invalid_order_line, parent: :order_line do
    order_line_quantity                       { nil }
    order_line_actual_purchase_price_cents    { nil }
    order_line_actual_purchase_price_currency { nil }
    #
    product             { nil }
    order               { nil }
  end
end
