
class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :title, :string
  end
end

