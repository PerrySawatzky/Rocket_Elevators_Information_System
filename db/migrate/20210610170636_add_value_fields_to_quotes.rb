class AddValueFieldsToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :elevator_amount, :integer
    add_column :quotes, :unit_price, :integer
    add_column :quotes, :total_price, :integer
    add_column :quotes, :install_fees, :integer
    add_column :quotes, :final_price, :integer
  end
end
