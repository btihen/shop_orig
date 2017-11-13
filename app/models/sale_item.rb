class SaleItem < ApplicationRecord
  belongs_to :sale
  has_one    :register, through: :sale
  has_one    :user,     through: :register

  monetize   :sale_price_cents

end
