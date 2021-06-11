json.extract! employee, :id, :user_id, :last_name, :first_name, :title, :created_at, :updated_at
json.url employee_url(employee, format: :json)
