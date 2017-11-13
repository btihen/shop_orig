class Sale < ApplicationRecord
  belongs_to :register
  has_one    :user,    through: :register
  
end
