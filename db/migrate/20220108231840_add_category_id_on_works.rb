class AddCategoryIdOnWorks < ActiveRecord::Migration[6.1]
  def change
    change_table :works do |t|
      t.references :category, null: false, foreign_key: { on_delete: :cascade }
    end
  end
end
