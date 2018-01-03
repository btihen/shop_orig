# ruby encoding: utf-8

# http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html

ProductCategory.destroy_all

product_category_list = [
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

product_category_list.each do |product_category_name, tax_category |
  ProductCategory.create(
                          product_category_name: ,
                          tax_category: ,
                        )
end
