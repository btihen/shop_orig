json.extract! stock_item, :id, :stock_item_status, :stock_item_added_datetime, :stock_item_sold_datetime, :stock_item_sold_price, :order_line_id, :created_at, :updated_at
json.url stock_item_url(stock_item, format: :json)
