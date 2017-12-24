FactoryBot.define do
  factory :tax_category do
    tax_category_name { Faker::Commerce.department(2, true) }
    tax_category_rate { Faker::Number.decimal(2, 3) }
  end
  factory :invalid_tax_category, parent: :tax_category do
    tax_category_name { nil }
    tax_category_rate { nil }
  end
  factory :invalid_neg_tax_rate, parent: :tax_category do
    tax_category_name { Faker::Commerce.department(2, true) }
    tax_category_rate { -1 * Faker::Number.decimal(2, 3) }
  end

end
