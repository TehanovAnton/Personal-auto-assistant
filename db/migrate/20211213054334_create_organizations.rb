class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :adress, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :organizations, :email, unique: true
    add_index :organizations, :phone_number, unique: true
    add_index :organizations, :adress, unique: true
  end
end
