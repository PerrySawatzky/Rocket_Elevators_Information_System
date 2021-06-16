class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :customer_id, :integer
  end
end
