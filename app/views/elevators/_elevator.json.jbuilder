json.extract! elevator, :id, :column_id, :serial_number, :model, :type, :status, :date_of_commissioning, :last_inspection, :certificate_of_inspection, :information, :notes, :created_at, :updated_at
json.url elevator_url(elevator, format: :json)
