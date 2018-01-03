FactoryBot.define do
  factory :tax_category do
    # add random num to avoid duplicates
    tax_category_name { "#{Faker::Commerce.department(2, true)}_#{Random.rand(1000)}" }
    tax_category_rate { Faker::Number.decimal(2, 3) }
    days_ago          = Faker::Date.between(400.days.ago, Date.today + 100.days)
    tax_start_date    { days_ago }
    tax_end_date      { [days_ago + 200.days, nil].sample }
  end
  factory :invalid_tax_category, parent: :tax_category do
    tax_category_name { nil }
    tax_category_rate { nil }
    tax_start_date    { nil }
  end
  factory :invalid_neg_tax_rate, parent: :tax_category do
    tax_category_name { Faker::Commerce.department(2, true) }
    tax_category_rate { -1 * Faker::Number.decimal(2, 3) }
  end

end
