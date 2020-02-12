json.extract! user, :id, :email, :name, :last_name, :mobile_phone, :work_place, :created_at, :updated_at
json.url user_url(user, format: :json)
