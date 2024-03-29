FactoryBot.define do
  factory :product do
    product_code              { "#{Faker::Lorem.word}#{Random.rand(99)}" }
    product_category          { FactoryHelpers.get_product_category() }
    product_name              { Faker::Commerce.product_name }
    product_size              { ['XS', 'S', 'M', 'L', 'XL', 'XXL'].sample }
    product_color             { Faker::Color.color_name }
    product_material          { Faker::Commerce.material }
    # product_details           { {
    #                               size: ['XS', 'S', 'M', 'L', 'XL', 'XXL'].sample,
    #                               color: Faker::Color.color_name,
    #                               material: Faker::Commerce.material,
    #                               style: ['Mens', 'Women'].sample,
    #                           } }
    product_details           { {
                                  author: Faker::Book.author,
                                  title: Faker::Book.title,
                                  language: [ 'German', 'English', 'French',
                                              'Spanish', 'Rusian'].sample,
                                  publisher: Faker::Book.publisher,
                                  genre: Faker::Book.genre,
                              } }
    product_sell_by_date      { Faker::Date.between(50.days.ago, Date.today + 400.days) }
    product_added_info        { Faker::Lorem.sentence }
    product_status            { ApplicationHelper::PRODUCT_STATUS.sample }
    product_supplier_price_cents   { Faker::Commerce.price * 100 }
    # product_supplier_price_currency{ ApplicationHelper::REGISTER_CURRENCIES.sample }
    # product_supplier_price    { Money.new(Faker::Commerce.price * 100,
    #                             ApplicationHelper::REGISTER_CURRENCIES.sample) }
    product_resell_item_price { Money.new(Faker::Commerce.price * 100,
                                ApplicationHelper::REGISTER_CURRENCIES.sample) }
    supplier                  { FactoryHelpers.get_supplier() }
  end
  factory :invalid_product, parent: :product do
    product_code                    { nil }
    product_name                    { nil }
    product_status                  { nil }
    product_supplier_price_cents    { nil }
    product_resell_item_price_cents { -100 }
    supplier                        { nil }
  end

end
