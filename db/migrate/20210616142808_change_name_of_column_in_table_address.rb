class ChangeNameOfColumnInTableAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :address_type, :address_type
  end
end
