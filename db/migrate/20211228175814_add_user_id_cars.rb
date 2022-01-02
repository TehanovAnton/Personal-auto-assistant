# frozen_string_literal: true

class AddUserIdCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :user_id, :integer, null: false
  end
end
