class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :user_id
      t.date :customer_creation_date
      t.string :company_name
      t.string :headquarters_address
      t.string :company_contact_full_name
      t.string :company_contact_phone
      t.string :company_contact_email
      t.string :company_description
      t.string :service_tech_authority_full_name
      t.string :technical_authority_for_service_phone
      t.string :technical_manager_email_for_service

      t.timestamps
    end
  end
end
