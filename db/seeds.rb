# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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

employees_list.each do |user_id, last_name, first_name, title|
    Employee.create( user_id: user_id, last_name: last_name,  first_name: first_name, title: title)
end

