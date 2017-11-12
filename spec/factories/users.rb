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
end
