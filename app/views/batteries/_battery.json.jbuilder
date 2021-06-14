json.extract! battery, :id, :building_id, :type, :status, :employee_id, :commissioned_date, :last_inspection_date, :certificate_of_operations, :information, :notes, :created_at, :updated_at
json.url battery_url(battery, format: :json)
