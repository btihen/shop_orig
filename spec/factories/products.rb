FactoryBot.define do
  factory :product do
    product_code              { "#{Faker::Lorem.word}#{Random.rand(99)}" }
    product_category          { FactoryHelpers.get_product_category() }
    product_name              { Faker::Commerce.product_name }
    product_size              { ['XS', 'S', 'M', 'L', 'XL', 'XXL'].sample }
    product_color             { Faker::Color.color_name }
    product_material          { Faker::Commerce.material }
    product_details           { {
                                  size: product_size,
                                  color: Faker::Color.color_name,
                                  material: Faker::Commerce.material,
                                  style: ['Mens', 'Women'].sample,
                              } }
    # product_details           { {
    #                               author: Faker::Book.author,
    #                               title: Faker::Book.title,
    #                               language: [ 'German', 'English', 'French',
    #                                           'Spanish', 'Rusian'].sample,
    #                               publisher: Faker::Book.publisher,
    #                               genre: Faker::Book.genre,
    #                           } }
    product_sell_by_date      { Faker::Date.between(50.days.ago, Date.today + 400.days) }
    product_extra_info        { Faker::Lorem.sentence }
    product_status            { ApplicationHelper::PRODUCT_STATUSES.sample }
    supplier                  { FactoryHelpers.get_supplier() }
  end
  factory :invalid_product, parent: :product do
    product_code                    { nil }
    product_name                    { nil }
    product_status                  { nil }
    supplier                        { nil }
  end

end
