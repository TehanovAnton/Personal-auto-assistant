class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :name, null: false
      t.integer :term_of_validity, null: false

      t.timestamps
    end

    add_index :documents, :name, unique: true
  end
end
