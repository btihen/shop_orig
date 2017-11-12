FactoryBot.define do
  factory :product do
    product_name      { Faker::Commerce.product_name }
    description       { Faker::Commerce.department }
    # category          { Faker::Commerce.department }
    # color             {  Faker::Commerce.color }
    product_price     { Money.new(Faker::Commerce.price * 100,
                        ApplicationHelper::CURRENCIES.sample) }
    product_currency  { ApplicationHelper::CURRENCIES.sample }
    supplier          { FactoryHelpers.get_supplier() }
  end
end
