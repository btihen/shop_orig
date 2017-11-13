class Register < ApplicationRecord
  belongs_to :user

  monetize :open_amount_cents
  monetize :close_amount_cents
  
end
