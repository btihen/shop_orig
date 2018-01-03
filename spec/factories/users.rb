FactoryBot.define do
  factory :user do
    username        { Faker::Internet.user_name }
    user_real_name  { Faker::Name.name }
    user_role       { ApplicationHelper::USER_ROLES.sample }
    user_email      { Faker::Internet.email }
    # passwd = Faker::Internet.password(8)
    # password { passwd }
    # password_confirm { passwd }
  end
  factory :cashier, parent: :user do
    user_role       { 'cashier' }
  end
  factory :sourcer, parent: :user do
    user_role       { 'sourcer' }
  end
  factory :inventory, parent: :user do
    user_role       {'inventory'}
  end
  factory :finance, parent: :user do
    user_role       {'finance'}
  end
  factory :invalid_user, parent: :user do
    username        { " " }
    user_real_name  { " " }
    user_email      { " " }
    user_role       { " " }
  end
  factory :invalid_nil_user, parent: :user do
    username        { nil }
    user_real_name  { nil }
    user_email      { nil }
    user_role       { nil }
  end
end
