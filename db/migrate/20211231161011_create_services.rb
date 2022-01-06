class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.integer :name, null: false, default: 0
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :address, null: false

      t.timestamps
    end

    add_index :services, :name, unique: true
  end
end
