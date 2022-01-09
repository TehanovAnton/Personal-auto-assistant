class CreateOrganizationsWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations_works do |t|
      t.references :organization, null: false, foreign_key: { on_delete: :cascade }
      t.references :work, null: false, foreign_key: { on_delete: :cascade }
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
