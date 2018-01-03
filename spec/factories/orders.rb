FactoryBot.define do

  factory :order do
    order_status  { ApplicationHelper::ORDER_STATUS.sample }
    order_reason  { Faker::Lorem.sentence }
    sourcer { FactoryHelpers.get_sourcer() }
  end
  factory :invalid_order, parent: :order do
    order_status  { nil }
    order_reason  { nil }
    sourcer { nil }
  end

end
