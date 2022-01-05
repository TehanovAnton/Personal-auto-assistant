# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :model, null: false, default: 'a12'
      t.integer :year_production, null: false, default: 2000
      t.integer :engine_volume, null: false, default: 1
      t.integer :mileage, null: false, default: 0
      t.string :body_type, null: false, default: 'sedan'
      t.integer :fuel_type, null: false, default: 0
      t.integer :transmission_type, null: false, default: 0
      t.string :maker, null: false, default: 'bmw'
      t.string :vin, null: false, default: '123asdfaase123'

      t.timestamps
    end

    add_foreign_key :cars, :users, on_delete: :cascade
    add_index :cars, :vin, unique: true
  end
end
