FactoryBot.define do
  factory :order_item do
    quantity            { Faker::Number.between(1, 10) }
    order_item_note     { Faker::Hipster.sentence }
    item_purchase_price { Money.new(Faker::Commerce.price * 100,
                          ApplicationHelper::CURRENCIES.sample) }
    #
    product             { FactoryHelpers.get_product() }
    order               { FactoryHelpers.get_order() }
  end
  factory :invalid_order_item, parent: :order_item do
    quantity            { nil }
    item_purchase_price_cents    { nil }
    item_purchase_price_currency { nil }
    #
    product             { nil }
    order               { nil }
  end
end
