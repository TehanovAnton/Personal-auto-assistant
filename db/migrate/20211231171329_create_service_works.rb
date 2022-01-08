class CreateServiceWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :service_works do |t|
      t.string :title, null: false

      t.timestamps
    end

    add_index :service_works, :title, unique: true
  end
end
