FactoryBot.define do
  factory :supplier do
    supplier_name { Faker::Company.name }
    description   { Faker::Company.catch_phrase }
  end
  factory :invalid_supplier, parent: :supplier do
    supplier_name { " " }
    description   { nil }
  end
end
