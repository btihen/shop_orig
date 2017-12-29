json.extract! product, :id, :product_name, :product_description, :product_supplier_price, :product_resell_item_price, :created_at, :updated_at
json.url product_url(product, format: :json)
