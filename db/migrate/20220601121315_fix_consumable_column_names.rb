class FixConsumableColumnNames < ActiveRecord::Migration[6.1]
  def change
    change_table :consumables do |t|
      t.rename :consumable_id, :consumable_category_id
    end
  end
end
