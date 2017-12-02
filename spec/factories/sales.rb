FactoryBot.define do
  factory :sale do
    payment_method { ApplicationHelper::PAYMENT_METHOD }
    register       { FactoryHelpers.get_register() }
  end
end
