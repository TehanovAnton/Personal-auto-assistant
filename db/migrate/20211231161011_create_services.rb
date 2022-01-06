class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.integer  :name, null: false, default: 0

      t.timestamps
    end

    add_index :services, :name, unique: true
  end
end
