module ApplicationHelper

  LOCAL_CURRENCY      = 'CHF'
  REGISTER_CURRENCIES = %w[CHF EUR]
  SUPPLIER_CURRENCIES = %w[CHF EUR USD]
  USER_ROLES          = %w[itadmin finance sourcer inventory cashier user]
  ORDER_STATUS        = %w[new reviewed approved recieved paid]
  STOCK_STATUS        = %w[available sold returned lost]
  PAYMENT_METHOD      = %w[cash card]
  PRODUCT_STATUSES    = [ "Auslauf", "Bestellen", "Spende", "ev.order",
                          "out of stock2", "running",
                        ]

end
