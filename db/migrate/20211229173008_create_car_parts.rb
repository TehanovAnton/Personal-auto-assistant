class CreateCarParts < ActiveRecord::Migration[6.1]
  def change
    create_table :car_parts, id: false do |t|
      t.integer :car_id, null: false
      t.integer :part_id, null: false

      t.timestamps
    end

    add_foreign_key :car_parts, :cars, on_delete: :cascade
    add_foreign_key :car_parts, :parts, on_delete: :cascade
    add_index :car_parts, %i[car_id part_id], unique: true
  end
end
