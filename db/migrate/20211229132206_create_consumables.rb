class CreateConsumables < ActiveRecord::Migration[6.1]
  def change
    create_table :consumables do |t|
      t.string :name

      t.timestamps
    end

    add_index :consumables, :name, unique: true
  end
end
