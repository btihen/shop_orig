FactoryBot.define do
  factory :sale do
    payment_method { ApplicationHelper::PAYMENT_METHOD }
    register       { FactoryHelpers.get_register() }
  end
  factory :cash_sale, parent: :sale do
    payment_method { 'cash' }
  end
  factory :card_sale, parent: :sale do
    payment_method { 'card' }
  end
end
