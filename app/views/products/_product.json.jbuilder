json.extract! product, :id, :product_name, :description, :order_price, :order_currency, :created_at, :updated_at
json.url product_url(product, format: :json)
