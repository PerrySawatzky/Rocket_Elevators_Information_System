json.extract! employee, :id, :first_name, :last_Name, :title,  :email, :created_at, :updated_at
json.url employee_url(employee, format: :json)
