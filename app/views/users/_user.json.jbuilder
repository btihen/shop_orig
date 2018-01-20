json.extract! user, :id, :user_login_name, :user_full_name, :user_role, :created_at, :updated_at
json.url user_url(user, format: :json)
