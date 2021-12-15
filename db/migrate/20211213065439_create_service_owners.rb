# frozen_string_literal: true

class CreateServiceOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :service_owners, &:timestamps
  end
end
