class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
<<<<<<< HEAD:db/migrate/20210610153414_create_employees.rb
      t.integer :user_id
=======
      t.string :user_id
>>>>>>> main:db/migrate/20210608175226_create_employees.rb
      t.string :last_name
      t.string :first_name
      t.string :title

      t.timestamps
    end
  end
end
