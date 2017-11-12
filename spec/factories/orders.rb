FactoryBot.define do
  factory :order do
    status { ApplicationHelper::ORDER_STATUS }
    reason { Faker::Lorem.sentence }
    user { FactoryHelpers.get_user() }
  end
end
