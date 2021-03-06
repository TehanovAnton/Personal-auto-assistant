class CreateServicesWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :services_works do |t|
      t.references :service, null: false, foreign_key: { on_delete: :cascade }
      t.references :work, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
