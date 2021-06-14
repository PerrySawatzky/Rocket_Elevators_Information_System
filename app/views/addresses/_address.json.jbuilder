json.extract! address, :id, :type_of_address, :status, :entity, :number_and_street, :suite_or_apartment, :city, :postal_code, :country, :notes, :created_at, :updated_at
json.url address_url(address, format: :json)
