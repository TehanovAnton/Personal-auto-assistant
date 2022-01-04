class CreateParts < ActiveRecord::Migration[6.1]
  def change
    create_table :parts do |t|
      t.integer :name, null: false, default: 0

      t.timestamps
    end

    add_index :parts, :name, unique: true
  end
end
