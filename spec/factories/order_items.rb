FactoryBot.define do
  factory :order_item do
    quantity            { Faker::Number.between(1, 10) }
    note                { Faker::Hipster.sentence }
    item_purchase_price { Money.new(Faker::Commerce.price * 100,
                          ApplicationHelper::CURRENCIES.sample) }
    #
    # product             { FactoryHelpers.get_product() }
  end
end
