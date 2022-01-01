class CreateOrganizationsServicesWorksPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations_services_works_prices, id: false do |t|
      t.integer :organization_id, null: false
      t.integer :service_id, null: false
      t.integer :service_work_id, null: false
      t.integer :price, null: false

      t.timestamps
    end

    add_foreign_key :organizations_services_works_prices, :organizations, on_delete: :cascade
    add_foreign_key :organizations_services_works_prices, :services, on_delete: :cascade
    add_foreign_key :organizations_services_works_prices, :service_works, on_delete: :cascade

    add_index :organizations_services_works_prices, :service_work_id,
              unique: true,
              name: 'organization_service_servicework_price_index'
  end
end
