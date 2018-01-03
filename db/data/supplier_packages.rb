# ruby encoding: utf-8

# http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html

SupplierPackages.destroy_all

package_list = [
  [ "Swiss Register 2014", "CHF", 12345, 12345, 234567 ],
  [ "Swiss Register 2015", "CHF", 23456, 23456, 345678 ],
  [ "Swiss Register 2016", "CHF", 34567, 34567, 456789 ],
  [ "Swiss Register 2017", "CHF", 45678, 45678, 567890 ],
  [ "Swiss Register 2018", "CHF", 56789, nil, nil ],
  [ "Euro Register 2014", "EUR", 12345, 12345, 234567 ],
  [ "Euro Register 2015", "EUR", 23456, 23456, 345678 ],
  [ "Euro Register 2016", "EUR", 34567, 34567, 456789 ],
  [ "Euro Register 2017", "EUR", 45678, 45678, 567890 ],
  [ "Euro Register 2018", "EUR", 56789, nil, nil ],
]

package_list.each do |username, user_real_name, user_role |
  SupplierPackages.create(
              register_name: username,
              register_currency: user_real_name,
              register_start_amount: user_role,
              register_close_amount: user_role
              register_cash_deposit: user_role
             )
end
