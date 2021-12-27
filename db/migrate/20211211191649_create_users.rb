# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      t.string :email, null: false
      t.integer :role, null: false, default: 0

      t.timestamps
    end
    add_index :users, :phone_number, unique: true
    add_index :users, :email, unique: true
  end
end
