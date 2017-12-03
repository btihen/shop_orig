FactoryBot.define do
  factory :user do
    username    { Faker::Internet.user_name }
    full_name   { Faker::Name.name }
    role        { ApplicationHelper::USER_ROLES.sample }
    # email { Faker::Internet.email }
    # passwd = Faker::Internet.password(8)
    # password { passwd }
    # password_confirm { passwd }
  end
  factory :cashier, parent: :user do
    role        { 'cashier' }
  end
  factory :sourcer, parent: :user do
    role        { 'manager' }
  end
  factory :manager, parent: :user do
    role        {'manager'}
  end
  factory :owner, parent: :user do
    role        {'owner'}
  end
  factory :invalid_user, parent: :user do
    username    { " " }
    full_name   { "a" }
    role        { nil }
  end
end
