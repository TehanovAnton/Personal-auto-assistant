class CreateCitiesOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :cities_organizations, id: false do |t|
      t.integer :city_id
      t.integer :organization_id

      t.timestamps
    end

    add_foreign_key :cities_organizations, :cities, on_delete: :cascade
    add_foreign_key :cities_organizations, :organizations, on_delete: :cascade
  end
end
