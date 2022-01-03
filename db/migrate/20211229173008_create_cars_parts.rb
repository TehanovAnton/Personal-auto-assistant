class CreateCarsParts < ActiveRecord::Migration[6.1]
  def change
    create_table :cars_parts, id: false do |t|
      t.integer :car_id, null: false
      t.integer :part_id, null: false

      t.timestamps
    end

    add_foreign_key :cars_parts, :cars, on_delete: :cascade
    add_foreign_key :cars_parts, :parts, on_delete: :cascade
    add_index :cars_parts, %i[car_id part_id], unique: true
  end
end
