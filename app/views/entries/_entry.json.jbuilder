json.extract! entry, :id, :name, :address, :phone, :email, :created_at, :updated_at
json.url entry_url(entry, format: :json)
