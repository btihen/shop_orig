json.extract! user, :id, :username, :full_name, :user_role, :created_at, :updated_at
json.url user_url(user, format: :json)
