class AddMileageOnOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :mileage, :integer, null: false
  end
end
