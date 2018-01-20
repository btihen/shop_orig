FactoryBot.define do
  factory :user do
    user_login_name    { Faker::Internet.user_name }
    user_full_name   { Faker::Name.name }
    user_role        { ApplicationHelper::USER_ROLES.sample }
    # email { Faker::Internet.email }
    # passwd = Faker::Internet.password(8)
    # password { passwd }
    # password_confirm { passwd }
  end
  factory :cashier, parent: :user do
    user_role        { 'cashier' }
  end
  factory :sourcer, parent: :user do
    user_role        { 'sourcer' }
  end
  factory :inventory, parent: :user do
    user_role        {'inventory'}
  end
  factory :finance, parent: :user do
    user_role        {'finance'}
  end
  factory :invalid_user, parent: :user do
    user_login_name    { " " }
    user_full_name   { "a" }
    user_role        { nil }
  end
end
