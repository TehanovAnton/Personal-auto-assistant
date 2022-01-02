# frozen_string_literal: true

class AddForeignKeyUserIdCars < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :cars, :users, on_delete: :cascade
  end
end
