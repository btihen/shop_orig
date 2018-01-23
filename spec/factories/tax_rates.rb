FactoryBot.define do
  factory :tax_rate do
    # days_ago        = Faker::Date.between(400.days.ago, Date.today + 100.days)
    tax_rate        { Faker::Number.decimal(2, 3) }
    tax_start_date  { Faker::Date.between(400.days.ago, Date.today + 100.days) }
    tax_end_date    { [tax_start_date + 200.days, nil].sample }
    tax_category    { FactoryHelpers.get_tax_category() }
  end
  factory :invalid_tax_rate, parent: :tax_rate do
    tax_rate        { nil }
    tax_start_date  { nil }
    tax_end_date    { nil }
  end
  factory :invalid_neg_tax_rate, parent: :tax_rate do
    tax_rate        { (-1.0 * Faker::Number.decimal(2, 3).to_f) }
    tax_start_date  { Date.today }
    tax_end_date    { [tax_start_date + 200.days, nil].sample }
  end

end
