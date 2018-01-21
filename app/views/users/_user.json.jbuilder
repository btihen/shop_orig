json.extract! user, :id, :user_login, :user_name, :user_role, :created_at, :updated_at
json.url user_url(user, format: :json)
