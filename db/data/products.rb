# ruby encoding: utf-8

# http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html

Product.destroy_all

product_list = [
  [ ],
]

product_list.each do |product_code, product_name, supplier_name |
  Product.create(
                  product_code: product_code,
                  product_category_name: ProductCategory.
                            where(product_category_name: product_category_name),
                  product_name: product_name,
                  product_size: product_size,
                  product_color: product_color,
                  product_material: product_material,
                  product_status: product_status,
                  product_added_info: product_added_info,
                  product_sell_by_date: product_sell_by_date,
                  product_supplier_price: product_supplier_price,
                  product_resell_item_price: product_resell_item_price,
                  supplier_name: Supplier.
                            where(supplier_name: supplier_name).first,
                )
end
