FactoryBot.define do
  factory :supplier do
    supplier_name         { Faker::Company.name }
    supplier_currency     { ApplicationHelper::CURRENCIES.sample }
    supplier_web_url      { Faker::Internet.url }
    supplier_email        { Faker::Internet.email }
    supplier_phone        { Faker::PhoneNumber.phone_number }
    supplier_address_1    { Faker::Address.street_address }
    supplier_address_2    { Faker::Address.secondary_address }
    supplier_city         { Faker::Address.city }
    supplier_region       { Faker::Lorem.word }
    supplier_postcode     { Faker::Address.postcode }
    supplier_country_code { Faker::Address.country_code }
    supplier_notes        { Faker::Company.catch_phrase }
  end
  factory :invalid_supplier, parent: :supplier do
    supplier_name         { nil }
    supplier_currency     { nil }
    supplier_web_url      { nil }
    supplier_email        { nil }
  end
end
