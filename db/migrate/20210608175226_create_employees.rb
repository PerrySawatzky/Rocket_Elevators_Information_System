class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :First_name
      t.string :Last_Name
      t.string :Title
      t.string :Email

      t.timestamps
    end
  end
end
