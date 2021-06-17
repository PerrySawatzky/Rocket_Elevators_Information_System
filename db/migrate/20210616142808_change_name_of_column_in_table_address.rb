class ChangeNameOfColumnInTableAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :type_of_address, :address_type
  end
end
