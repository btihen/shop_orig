json.extract! order_item, :id, :quantity, :order_item_note, :item_purchase_price, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
