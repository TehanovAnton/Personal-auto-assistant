# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests, &:timestamps
  end
end
