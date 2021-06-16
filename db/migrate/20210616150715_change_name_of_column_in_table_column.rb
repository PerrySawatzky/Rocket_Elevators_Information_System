class ChangeNameOfColumnInTableColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :columns, :type, :column_type
  end
end
