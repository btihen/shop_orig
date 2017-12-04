FactoryBot.define do
  factory :order do
    status  { ApplicationHelper::ORDER_STATUS }
    reason  { Faker::Lorem.sentence }
    sourcer { FactoryHelpers.get_sourcer() }
  end
end
