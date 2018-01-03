FactoryBot.define do
  factory :product_category do
    # add random num to avoid duplicates
    product_category_name { "#{Faker::Lorem.word}_#{Random.rand(1000)}" }
    tax_category          { FactoryHelpers.get_tax_category() }
  end
  factory :invalid_product_category, parent: :product_category do
    product_category_name { nil }
    tax_category          { nil }
  end
end
