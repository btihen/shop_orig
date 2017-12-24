module ApplicationHelper

  CURRENCIES         = %w[CHF EUR]
  USER_ROLES         = %w[itadmin owner manager cashier user]
  ORDER_STATUS       = %w[new reviewed approved recieved paid]
  STOCK_STATUS       = %w[available sold returned lost]
  PAYMENT_METHOD     = %w[cash card]
  PRODUCT_CATEGORIES = [
                        'food', 'clothing', 'book', 'practice material',
                        'incense',
                       ]
end
