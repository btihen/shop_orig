json.extract! sale_item, :id, :note, :sale_price, :sale_id, :created_at, :updated_at
json.url sale_item_url(sale_item, format: :json)
