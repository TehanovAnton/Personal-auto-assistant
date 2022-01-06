class CreateOrganizationsServices < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations_services do |t|
      t.integer :organization_id, null: false
      t.integer :service_id, null: false

      t.timestamps
    end

    add_foreign_key :organizations_services, :organizations, on_delete: :cascade
    add_foreign_key :organizations_services, :services, on_delete: :cascade
    add_index :organizations_services, %i[organization_id service_id], unique: true
  end
end
