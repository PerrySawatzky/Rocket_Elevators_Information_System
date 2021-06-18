json.extract! address, :id, :address_type, :status, :entity, :number_and_street, :suite_or_apartment, :city, :postal_code, :country, :notes, :created_at, :updated_at
json.url address_url(address, format: :json)
