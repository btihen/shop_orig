FactoryBot.define do
  factory :tax_category do
    # add random num to avoid duplicates
    tax_category_name { "#{Faker::Commerce.department(2, true)}_#{Random.rand(1000)}" }
    # tax_category_rate { Faker::Number.decimal(2, 3) }
    tax_start_date    = Faker::Date.between(400.days.ago, Date.today + 100.days)
    tax_category_rate {{ name: tax_category_name,
                        tax_rates: [
                          { rate: Faker::Number.decimal(1, 1),
                            start_date: tax_start_date,
                            end_date: nil},
                          { rate: Faker::Number.decimal(1, 1),
                            start_date: tax_start_date - 3.year,
                            end_date: tax_start_date - 1.day
                          },
                        ]
                      }}
  end
  factory :invalid_tax_category, parent: :tax_category do
    tax_category_name { nil }
    tax_category_rate { nil }
  end
  factory :invalid_neg_tax_rate, parent: :tax_category do
    tax_category_name { Faker::Commerce.department(2, true) }
    tax_start_date    = Faker::Date.between(400.days.ago, Date.today + 100.days)
    tax_category_rate {{name: tax_category_name,
                        tax_rates: [
                          { rate: Faker::Number.negative,
                            start_date: tax_start_date,
                            end_date: nil},
                          { rate: Faker::Number.negative,
                            start_date: tax_start_date - 3.year,
                            end_date: tax_start_date - 1.day
                          },
                        ]
                      }}

  end

end
