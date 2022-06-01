class RenameCarConsumableValuesToConsumables < ActiveRecord::Migration[6.1]
  def change
    rename_table :car_consumable_values, :consumables
  end
end
