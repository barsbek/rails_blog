json.extract! user, :id, :name, :email, :login, :avatar, :created_at, :updated_at
json.url user_url(user, format: :json)
