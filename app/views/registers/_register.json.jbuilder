json.extract! register, :id, :open_amount, :close_amount, :user_id, :created_at, :updated_at
json.url register_url(register, format: :json)