class ChangeFuelAndTransmissionColumnType < ActiveRecord::Migration[6.1]
  def change
    change_table :cars do |t|
      t.remove :fuel_type
      t.integer :fuel_type, null: false, default: 0

      t.remove :transmission_type
      t.integer :transmission_type, null: false, default: 0
    end
  end
end
