class ChangeConsumableNameColumnTypeOnString < ActiveRecord::Migration[6.1]
  def change
    change_column :consumable_categories, :name, :string, null: false
  end
end
