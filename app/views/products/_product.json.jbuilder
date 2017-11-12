json.extract! product, :id, :product_name, :description, :product_price, :product_currency, :created_at, :updated_at
json.url product_url(product, format: :json)
