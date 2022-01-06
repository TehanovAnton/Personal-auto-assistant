class CreateServiceWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :service_works do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :service_works, :name, unique: true
  end
end
