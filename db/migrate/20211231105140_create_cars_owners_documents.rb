class CreateCarsOwnersDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :cars_owners_documents do |t|
      t.integer :user_id, null: false
      t.integer :document_id, null: false
      t.date :issue_date, null: false, default: Date.new(2021, 1, 1)

      t.timestamps
    end

    add_foreign_key :cars_owners_documents, :users, on_delete: :cascade
    add_foreign_key :cars_owners_documents, :documents, on_delete: :cascade
    add_index :cars_owners_documents, %i[user_id document_id], unique: true
  end
end
