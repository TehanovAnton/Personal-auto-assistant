class CreateConsumables < ActiveRecord::Migration[6.1]
  def change
    create_table :consumables do |t|
      t.integer :name, null: false, default: 0 

      t.timestamps
    end

    add_index :consumables, :name, unique: true
  end
end
