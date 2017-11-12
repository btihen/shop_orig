json.extract! stock_item, :id, :status, :add_date, :sale_date, :sale_price, :order_item_id, :created_at, :updated_at
json.url stock_item_url(stock_item, format: :json)
