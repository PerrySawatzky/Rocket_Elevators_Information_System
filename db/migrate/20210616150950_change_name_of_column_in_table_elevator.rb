class ChangeNameOfColumnInTableElevator < ActiveRecord::Migration[5.2]
  def change
    rename_column :elevators, :type, :elevator_type
  end
end
