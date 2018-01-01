FactoryBot.define do
  factory :supplier_package do
    product           { FactoryBot.create :product }
    included_product  { FactoryHelpers.get_product() }
    included_quantity { Faker::Number.between(1, 20) }
  end
  factory :invalid_nil_package, parent: :supplier_package do
    product           { nil }
    included_product  { nil }
    included_quantity { nil }
  end
  factory :invalid_neg_package, parent: :supplier_package do
    included_quantity { -100 }
  end
end
