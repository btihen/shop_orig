class Sale < ApplicationRecord
  belongs_to :register
  has_one    :user,      through: :register
  #
  has_many   :sale_items

end
