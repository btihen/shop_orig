FactoryBot.define do

  factory :tax_category do
    # add random num to avoid duplicates
    tax_category_name { "#{Faker::Commerce.department(2, true)}_#{Random.rand(1000)}" }
  end
  factory :invalid_tax_category, parent: :tax_category do
    tax_category_name { nil }
  end

end
