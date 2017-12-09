FactoryBot.define do

  factory :order do
    status  { ApplicationHelper::ORDER_STATUS.sample }
    reason  { Faker::Lorem.sentence }
    sourcer { FactoryHelpers.get_sourcer() }
  end
  factory :invalid_order, parent: :order do
    status  { nil }
    reason  { nil }
    sourcer { nil }
  end

end
