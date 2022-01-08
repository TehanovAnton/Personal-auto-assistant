class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :organizations_services_works_price_id, null: false
      t.integer :car_id, null: false

      t.timestamps
    end

    add_foreign_key :orders, :organizations_services_works_prices, on_delete: :cascade
  end
end
