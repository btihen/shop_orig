json.extract! user, :id, :username, :full_name, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
