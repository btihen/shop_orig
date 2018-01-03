# ruby encoding: utf-8

# http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html

Product.destroy_all

product_list = [
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

product_list.each do |supplier_name, supplier_currency |
  Product.create(
                  product_code: product_code,
                  product_name: product_name,
                )
end
