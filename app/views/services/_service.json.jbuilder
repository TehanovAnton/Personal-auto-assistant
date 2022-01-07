json.extract! service, :id, :name, :email, :address, :phone_number, :created_at, :updated_at
json.url service_url(service, format: :json)
