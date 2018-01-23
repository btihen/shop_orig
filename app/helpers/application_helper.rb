module ApplicationHelper

  LOCAL_CURRENCY      = 'CHF'
  REGISTER_CURRENCIES = %w[CHF EUR]
  SUPPLIER_CURRENCIES = %w[CHF EUR USD]
  USER_ROLES          = %w[itadmin finance sourcer inventory cashier user]
  ORDER_STATUS        = %w[new reviewed approved recieved paid]
  # running -> running ;
  # to-order -> running ;
  # discuss -> discuss / decide ;
  # archive -> bucher (maybe later) ;
  # out-of-stock -> will re-order when available ;
  # liquidate -> never again ;
  PRODUCT_STATUS      = %w[running out-of-stock archive liquidate  donation]
  STOCK_STATUS        = %w[available sold returned lost]
  PAYMENT_METHOD      = %w[cash card]
  # PRODUCT_STATUSES    = %w[re-order liquidate]
  # TAX_CATEGORIES     = ['food', 'clothing', 'book', 'practice material',
  #                       'incense',
  #                      ]
  # PRODUCT_CATEGORIES = [
  #                      'food', 'clothing', 'book', 'practice material',
  #                      'incense',
  #                     ]
end
