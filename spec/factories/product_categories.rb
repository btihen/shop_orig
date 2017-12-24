FactoryBot.define do
  factory :product_category do
    product_category_name { Faker::Commerce.department(1) }
    tax_category          { FactoryHelpers.get_tax_category() }
  end
  factory :invalid_product_category, parent: :product_category do
    product_category_name { nil }
    tax_category          { nil }
  end
end
