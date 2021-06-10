class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :User ID
      t.string :last name
      t.string :first name
      t.string :title

      t.timestamps
    end
  end
end
