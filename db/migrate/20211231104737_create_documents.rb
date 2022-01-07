class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.integer :name, null: false, default: 0

      t.timestamps
    end

    add_index :documents, :name, unique: true
  end
end
