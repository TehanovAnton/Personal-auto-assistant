class RemoveConsumableCategoryColumnNameDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :consumable_categories, :name, nil
  end
end
