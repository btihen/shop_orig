# ruby encoding: utf-8

# http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html

Supplier.destroy_all

supplier_list = [
  [ "Migros", "CHF" ],
  [ "Unknown", "EUR" ],
  [ "Nepal - Tatiana", "EUR" ],
  [ "Nepal - Old", "EUR" ],
  [ "Sonam Khamritsang", "EUR" ],
  [ "Phoenix Mani Bhadra", "EUR" ],
  [ "Weyermann", "CHF" ],
  [ "Berk", "EUR" ],
  [ "Nepal Old", "EUR" ],
]

supplier_list.each do |supplier_name, supplier_currency |
  Supplier.create(
                  supplier_name: supplier_name,
                  supplier_currency: supplier_currency
                 )
end
