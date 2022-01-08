class AddOrganizationIdOnServices < ActiveRecord::Migration[6.1]
  def change
    change_table :services do |t|
      t.references :organization, null: false, foreign_key: true
    end
  end
end
