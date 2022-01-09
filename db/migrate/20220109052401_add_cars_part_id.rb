class AddCarsPartId < ActiveRecord::Migration[6.1]
  def change
    add_column :cars_parts, :id, :primary_key
  end
end
