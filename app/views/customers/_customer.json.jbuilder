json.extract! customer, :id, :user_id, :customer_creation_date, :company_name, :headquarters_address, :company_contact_full_name, :company_contact_phone, :company_contact_email, :company_description, :service_tech_authority_full_name, :technical_authority_for_service_phone, :technical_manager_email_for_service, :created_at, :updated_at
json.url customer_url(customer, format: :json)
