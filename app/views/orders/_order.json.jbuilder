json.extract! order, :id, :order_status, :order_reason, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
