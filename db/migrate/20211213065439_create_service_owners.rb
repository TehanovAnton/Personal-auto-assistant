class CreateServiceOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :service_owners do |t|

      t.timestamps
    end
  end
end
