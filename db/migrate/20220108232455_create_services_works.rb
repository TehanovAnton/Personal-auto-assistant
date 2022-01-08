class CreateServicesWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :services_works do |t|
      t.references :service, null: false, foreign_key: true
      t.references :work, null: false, foreign_key: true

      t.timestamps
    end
  end
end
