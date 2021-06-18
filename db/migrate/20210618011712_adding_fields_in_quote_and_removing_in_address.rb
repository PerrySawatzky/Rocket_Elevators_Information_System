class AddingFieldsInQuoteAndRemovingInAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :address_id, :integer
    remove_column :addresses, :building_id
  end
end
