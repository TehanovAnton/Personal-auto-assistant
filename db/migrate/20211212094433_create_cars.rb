# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.integer :year_production
      t.integer :engine_volume
      t.integer :mileage
      t.string :body_type
      t.string :fuel_type
      t.string :transmission_type
      t.string :maker
      t.string :vin

      t.timestamps
    end
    add_index :cars, :vin, unique: true
  end
end
