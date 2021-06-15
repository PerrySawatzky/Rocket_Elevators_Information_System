# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

require 'json'
​
file = File.read('real_addresses.json')
​
data_hash = JSON.parse(file)

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


#response = RestClient.get("https://api.geocod.io/v1.6/geocode?q=7515+118+Ave+NW%2C+Edmonton%2C+AB+T5B+0X2%2C+Canada&api_key=c6903cee5395ed05c901910eee956010e59563c")
#response = RestClient.get("http://ip-api.com/json/24.48.0.1?fields=status,message,country,countryCode,region,regionName,city,zip,lat,lon,timezone,isp,org,as,query")


#response = RestClient.get("https://api-adresse.data.gouv.fr/reverse/?lon=2.37&lat=48.357")
response = RestClient.get("https://api-adresse.data.gouv.fr/search/?q=nice&type=street")
breeds_array = JSON.parse(response)

breeds_array.each do |breed|

 Address.create(
    type_of_address: Faker::Food.fruits,
    status: Faker::Food.fruits,
    entity: Faker::Food.fruits,
    number_and_street: breed[1]['address_components']['number'] + " " + breed[1]['address_components']['suffix'] + " " + breed[1]['address_components']['street'],
    suite_or_apartment: Faker::Food.fruits,
    city: breed[1]['address_components']['city'],
    postal_code: Faker::Food.fruits,
    country: breed[1]['address_components']['country'],
    notes: Faker::Food.fruits,

  )

  end
  binding.pry




# 100.times do 
#     Lead.create(
#       full_name: Faker::Food.fruits,
#       company_name: Faker::Food.fruits,
#       email: Faker::Food.fruits,
#       phone: Faker::Food.fruits,
#       project_name: Faker::Food.fruits,
#       project_description: Faker::Food.fruits,
#       dept_in_charge_of_elevators: Faker::Food.fruits,
#       message: Faker::Food.fruits,

#       date_of_contact_request: Faker::Food.fruits,

#   )

# end



employees_list.each do |user_id, last_name, first_name, title|
    Employee.create( user_id: user_id, last_name: last_name,  first_name: first_name, title: title)
end

users_list.each do |email, password, superadmin_role|
  User.create( email: email, password: password, superadmin_role: superadmin_role)
end

