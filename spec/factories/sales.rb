FactoryBot.define do
  factory :sale do
    sale_payment_method { ApplicationHelper::PAYMENT_METHOD.sample }
    register            { FactoryHelpers.get_register() }
  end
  factory :cash_sale, parent: :sale do
    sale_payment_method { 'cash' }
  end
  factory :card_sale, parent: :sale do
    sale_payment_method { 'card' }
  end
  factory :invalid_sale, parent: :sale do
    sale_payment_method { 'bad' }
    register            { nil }
  end
end
