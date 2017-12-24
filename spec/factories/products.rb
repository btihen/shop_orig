FactoryBot.define do
  factory :product do
    product_name            { Faker::Commerce.product_name }
    description             { Faker::Commerce.department }
    # color                   {  Faker::Commerce.color }
    product_price           { Money.new(Faker::Commerce.price * 100,
                              ApplicationHelper::CURRENCIES.sample) }
    # product_category        { ApplicationHelper::PRODUCT_CATEGORIES.sample }
    supplier                { FactoryHelpers.get_supplier() }
  end
  factory :invalid_product, parent: :product do
    product_name            { nil }
    product_price_cents     { nil }
    product_price_currency  { nil }
    supplier                { nil }
  end

end
