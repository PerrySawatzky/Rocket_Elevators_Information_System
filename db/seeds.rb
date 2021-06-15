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
<<<<<<< HEAD

 require "faker"
=======
>>>>>>> 4ac5a80ed1794b0aa18d9b326e2e11920057f61b


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

data_hash['addresses'].each do |address|
  Address.create( number_and_street: address['address1'], suite_or_apartment: address['address2'], city: address['city'], postal_code: address['postalCode'] )
end

500.times do 
    Lead.create(
      full_name: Faker::Name.name,
      company_name: Faker::Company.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      project_name: Faker::Lorem.word,
      project_description: Faker::Lorem.paragraph,
      dept_in_charge_of_elevators: Faker::Job.field,
      message: Faker::Lorem.paragraph,
      attached_file: Faker::File.mime_type,
      date_of_contact_request: Faker::Date.between(from: '2018-06-20', to: '2021-06-20')
  )
end

500.times do 
  Battery.create(
    building_id: Faker::IDNumber.valid,
    # type: null,
    # status: null,
    employee_id: Faker::IDNumber.valid,
    commissioned_date: Faker::Date.backward(days: 14),
    last_inspection_date: Faker::Date.backward(days: 14),
    certificate_of_operations: Faker::File.mime_type,
    information: Faker::Lorem.paragraph,
    notes: Faker::Lorem.paragraph,
  )
end

500.times do 
  Building.create(
    customer_id: Faker::IDNumber.valid,
    address_of_the_building: Faker::Address.full_address,
    full_name_of_the_building_administrator: Faker::Name.name,
    email_of_the_administrator_of_the_building: Faker::Internet.email,
    phone_number_of_the_building_administrator: Faker::PhoneNumber.phone_number,
    full_name_of_the_technical_contact_for_the_building: Faker::Name.name,
    technical_contact_email_for_the_building: Faker::Internet.email,
    technical_contact_phone_for_the_building: Faker::PhoneNumber.phone_number,
  )
end

500.times do 
  Column.create(
    battery_id: Faker::IDNumber.valid,
    type: Faker::Address.full_address,
    num_floors_served: Faker::Number.within(range: 1..60),
    # status: Faker::Internet.email,
    information: Faker::Lorem.paragraph,
    notes: Faker::Lorem.paragraph,
  )
end

500.times do 
  Elevator.create(
    column_id: Faker::IDNumber.valid,
    serial_number: Faker::IDNumber.valid,
    model: Faker::IDNumber.valid,
    # type: Faker::Internet.email,
    # status: Faker::Lorem.paragraph,
    date_of_commissioning: Faker::Date.backward(days: 14),
    last_inspection: Faker::Date.backward(days: 14),
    certificate_of_inspection: Faker::File.mime_type,
    information: Faker::Lorem.paragraph,
    notes: Faker::Lorem.paragraph,
  )
end
# 500.times do 
#   Building_detail.create(
#     building_id: Faker::IDNumber.valid,
#     information_key: Faker::Lorem.sentences,
#     value: Faker::Number.number(digits: 10)
#   )
# end


500.times do 
  Customer.create(
    user_id: Faker::IDNumber.valid,
    customer_creation_date: Faker::Date.backward(days: 14),
    company_name: Faker::Company.name,
    headquarters_address: Faker::Address.full_address,
    company_contact_full_name: Faker::Name.name,
    company_contact_phone: Faker::PhoneNumber.phone_number,
    company_contact_email: Faker::Internet.email,
    company_description: Faker::Lorem.paragraph,
    service_tech_authority_full_name: Faker::Name.name,
    technical_authority_for_service_phone: Faker::PhoneNumber.phone_number,
    technical_manager_email_for_service: Faker::Internet.email
  )
end



data_hash['addresses'].each do |address|
  Address.create( number_and_street: address['address1'], suite_or_apartment: address['address2'], city: address['city'], postal_code: address['postalCode'] )
end

# 500.times do 
#   Address.create(
#     type_of_address: ,
#     status: ,
#     entity: ,
#     number_and_street: addresses,ra
#     suite_or_apartment: ,
#     city: Faker::Address.city,
#     postal_code: Faker::Address.zip_code,
#     country: Faker::Address.country,
#     notes: Faker::Lorem.sentences,
#   )
# end


employees_list.each do |user_id, last_name, first_name, title|
    Employee.create( user_id: user_id, last_name: last_name,  first_name: first_name, title: title)
end

users_list.each do |email, password, superadmin_role|
  User.create( email: email, password: password, superadmin_role: superadmin_role)
end

