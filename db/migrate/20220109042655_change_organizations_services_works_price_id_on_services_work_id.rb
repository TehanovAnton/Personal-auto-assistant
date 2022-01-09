class ChangeOrganizationsServicesWorksPriceIdOnServicesWorkId < ActiveRecord::Migration[6.1]
  def change
    change_table :orders do |t|
      t.remove :organizations_services_works_price_id
      t.references :services_work, null: false, foreign_key: true
    end
  end
end
