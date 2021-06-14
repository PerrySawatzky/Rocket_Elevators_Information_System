class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.integer :battery_id
      t.string :type
      t.integer :num_floors_served
      t.string :status
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end
