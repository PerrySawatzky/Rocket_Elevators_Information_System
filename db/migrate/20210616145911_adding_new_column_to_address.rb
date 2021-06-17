class AddingNewColumnToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :building_id, :integer
  end
end
