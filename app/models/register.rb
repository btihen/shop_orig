class Register < ApplicationRecord
  belongs_to :user
  has_many   :sales
  has_many   :sale_items, through: :sales

  monetize :start_amount_cents
  monetize :close_amount_cents

end
