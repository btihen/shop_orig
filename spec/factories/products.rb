FactoryBot.define do
  factory :product do
    product_name "MyString"
    description "MyText"
    # order_price ""
    order_price  { Money.new(10000, 'CHF') }
    order_currency "MyString"
    supplier { FactoryHelpers.get_supplier() }
  end
end
