FactoryBot.define do
  factory :product do
    product_name              { Faker::Commerce.product_name }
    product_description       { Faker::Lorem.sentence }
    product_details           { { material:    Faker::Commerce.material,
                                  color:       Faker::Color.color_name,
                                  style:       ['Mens', 'Women'].sample,
                                  size: ['XS', 'S', 'M', 'L', 'XL', 'XXL'].sample } }
    product_supplier_price_cents   { Faker::Commerce.price * 100 }
    # product_supplier_price_currency{ ApplicationHelper::CURRENCIES.sample }
    # product_supplier_price    { Money.new(Faker::Commerce.price * 100,
    #                             ApplicationHelper::CURRENCIES.sample) }
    product_resell_item_price { Money.new(Faker::Commerce.price * 100,
                                ApplicationHelper::CURRENCIES.sample) }
    product_category          { FactoryHelpers.get_product_category() }
    supplier                  { FactoryHelpers.get_supplier() }
  end
  factory :invalid_product, parent: :product do
    product_name                    { nil }
    product_supplier_price_cents    { nil }
    product_resell_item_price_cents { -100 }
    supplier                        { nil }
  end

end
