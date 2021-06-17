require "faker"

require 'json'

file = File.read('real_addresses.json')

data_hash = JSON.parse(file)


# This file should contain all the record creation needed to send the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 require "faker"


employees_list = [
  [1, "Genest" , "Nicolas", "CEO"],
  [2, "Fortier" , "Nadya", "Director"],
  [3, "Chantal" , "Martin", "Assistant Director "],
  [4, "Houde" , "Mathieu", "Captain"],
  [5, "Thibault" , "Patrick ", "Captain"],
  [6, "Boutin" , "David", "Engineer"],
  [7, "Lortie" , "Mathieu", "Engineer"],
  [8, "Carrier" , "Thomas", "Engineer"],
  [9, "Savoie" , "Serge", "Enigneer"],
  [10, "Patry-Jessop" , "Francis", "Engineer"],
  [11, "Lefrancois" , "Mathieu", "Engineer"],
  [12, "Larochelle" , "David", "Engineer"],
  [13, "Pineault" , "Nicolas", "Engineer"],
  [14, "Amyot" , "David", "Engineer"],
  [15, "Gagnon" , "Remi", "Engineer"],
  [16, "Wever" , "Timothy", "Developer"],
  [17, "Kleinerman" , "Kiril", "Developer"],
  [18, "Derilus" , "Emmanuela", "Developer"],
  [19, "Akeeb" , "Abdul", "Developer"],
  [20, "Sheely" , "Krista", "Developer"],
  [21, "Murray" , "Jonathan", "Developer"]
]


users_list = [
  ["nicolas.genest@codeboxx.biz", "password", true],
  ["nadya.fortier@codeboxx.biz", "password", true],
  ["martin.chantal@codeboxx.biz", "password", true],
  ["mathieu.houde@codeboxx.biz", "password", true],
  ["patrick.thibault@codeboxx.biz", "password", true],
  ["david.boutin@codeboxx.biz", "password", true],
  ["mathieu.lortie@codeboxx.biz", "password", true],
  ["thomas.carrier@codeboxx.biz", "password", true],
  ["serge.savoie@codeboxx.biz", "password", true],
  ["francis.patry-jessop@codeboxx.biz", "password", true],
  ["mathieu.lefrancois@codeboxx.biz", "password", true],
  ["david.larochelle@codeboxx.biz", "password", true],
  ["nicolas.pineault@codeboxx.biz", "password", true],
  ["david.amyot@codeboxx.biz", "password", true],
  ["remi.gagnon@codeboxx.biz", "password", true],
  ["timothy.wever@codeboxx.biz", "password", true],
  ["kiril.kleinerman@codeboxx.biz", "password", true],
  ["emmanuela.derilus@codeboxx.biz", "password", true],
  ["abdul.akeeb@codebozz.biz", "password", true],
  ["krista.sheely@codeboxx.biz", "password", true],
  ["jonathan.murray@codeboxx.biz", "password", true]

]


# User.create! do |u|
#   u.email     = 'test_admin@test.com'
#   u.password  = 'password'
#   u.superadmin_role = true

users_list.each do |email, password, superadmin_role|
  User.create( email: email, password: password, superadmin_role: superadmin_role)
end

employees_list.each do |user_id, last_name, first_name, title|
  Employee.create( user_id: user_id, last_name: last_name,  first_name: first_name, title: title)
end

address_type = ["Billing", "Shipping", "Home", "Business"]
address_status = ["Active", "Inactive"]
adress_entity = ["Building", "Customer"]
i = 0
data_hash['addresses'].each do |address|  
  Address.create(
    type_of_address: address_type[rand(4)], 
    status: address_status[rand(2)],
    entity: adress_entity[rand(2)], 
    number_and_street: address['address1'], 
    suite_or_apartment: address['address2'], 
    city: address['city'], 
    postal_code: address['postalCode'], 
    country: address["state"], 
    notes: Faker::Lorem.paragraph,
    #created_at: , 
    #updated_at: , 
    #building_id: , 
  )
  

  Lead.create(
      full_name: Faker::Name.name,
      company_name: Faker::Company.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      project_name: Faker::Lorem.word,
      project_description: Faker::Lorem.paragraph,
      dept_in_charge_of_elevators: Faker::Job.field, #commercial, residential ..&
      message: Faker::Lorem.paragraph,
      attached_file: Faker::File.mime_type,
      date_of_contact_request: Faker::Date.between(from: '2018-06-20', to: '2021-06-20'),
      #created_at: ,
      #updated_at: ,
  )
  
  Customer.create(
    user_id: i,
    customer_creation_date: Faker::Date.backward(days: 14),
    company_name: Faker::Company.name,
    headquarters_address: Address.create(A),
    company_contact_full_name: Faker::Name.name,
    company_contact_phone: Faker::PhoneNumber.phone_number,
    company_contact_email: Faker::Internet.email,
    company_description: Faker::Lorem.paragraph,
    service_tech_authority_full_name: Faker::Name.name,
    technical_authority_for_service_phone: Faker::PhoneNumber.phone_number,
    technical_manager_email_for_service: Faker::Internet.email
    #created_at: ,
    #updated_at: ,
  )

  Building.create(
    customer_id: i,
    address_of_the_building: address['address1'],
    full_name_of_the_building_administrator: Faker::Name.name,
    email_of_the_administrator_of_the_building: Faker::Internet.email,
    phone_number_of_the_building_administrator: Faker::PhoneNumber.phone_number,
    full_name_of_the_technical_contact_for_the_building: Faker::Name.name,
    technical_contact_email_for_the_building: Faker::Internet.email,
    technical_contact_phone_for_the_building: Faker::PhoneNumber.phone_number,
    #created_at: ,
    #updated_at: ,
  )


  Battery.create(
    building_id: i,
    # battery_type: null,
    # status: null,
    employee_id: Faker::IDNumber.valid,
    commissioned_date: Faker::Date.backward(days: 14),
    last_inspection_date: Faker::Date.backward(days: 14),
    certificate_of_operations: Faker::File.mime_type,
    information: Faker::Lorem.paragraph,
    notes: Faker::Lorem.paragraph,
    #created_at: ,
    #updated_at: ,
  )
  
  Column.create(
    battery_id: i,
    #column_type: Faker::Address.full_address,
    num_floors_served: Faker::Number.within(range: 1..60),
    # status: ,
    information: Faker::Lorem.paragraph,
    notes: Faker::Lorem.paragraph,
    #created_at: ,
    #updated_at: ,
  )

  Elevator.create(
    column_id: i,
    serial_number: Faker::IDNumber.valid,
    model: Faker::IDNumber.valid,
    # elevator_type: Faker::Internet.email,
    # status: Faker::Lorem.paragraph,
    date_of_commissioning: Faker::Date.backward(days: 14),
    last_inspection: Faker::Date.backward(days: 14),
    certificate_of_inspection: Faker::File.mime_type,
    information: Faker::Lorem.paragraph,
    notes: Faker::Lorem.paragraph,
    #created_at: ,
    #updated_at: ,
  )

  i = i + 1

end


 






