class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :building_type
      t.string :product_line
      t.integer :apartments
      t.integer :floors
      t.integer :basements
      t.integer :elevators
      t.integer :companies
      t.integer :parking_spots
      t.integer :max_occupancy_per_floor
      t.integer :corporations
      t.string :business_hours

      t.timestamps
    end
  end
end
