class ChangeNameOfColumnInTableBattery < ActiveRecord::Migration[5.2]
  def change
    rename_column :batteries, :type, :battery_type
  end
end
