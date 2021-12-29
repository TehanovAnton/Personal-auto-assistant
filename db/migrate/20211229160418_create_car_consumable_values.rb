class CreateCarConsumableValues < ActiveRecord::Migration[6.1]
  def change
    create_table :car_consumable_values, id: false do |t|
      t.integer :car_id, null: false
      t.integer :consumable_id, null: false
      t.integer :value, null: false

      t.timestamps
    end

    add_index :car_consumable_values, %i[car_id consumable_id], unique: true
    add_foreign_key :car_consumable_values, :cars, on_delete: :cascade
    add_foreign_key :car_consumable_values, :consumables, on_delete: :cascade
  end
end
