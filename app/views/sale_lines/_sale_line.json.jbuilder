json.extract! sale_line, :id, :sale_line_note, :sale_line_sale_price, :sale_id, :created_at, :updated_at
json.url sale_line_url(sale_line, format: :json)
