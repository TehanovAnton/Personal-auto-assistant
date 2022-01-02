class CreateCarOwnerDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :car_owner_documents, id: false do |t|
      t.integer :user_id, null: false
      t.integer :document_id, null: false
      t.date :date_issue, null: false

      t.timestamps
    end

    add_foreign_key :car_owner_documents, :users, on_delete: :cascade
    add_foreign_key :car_owner_documents, :documents, on_delete: :cascade
    add_index :car_owner_documents, %i[user_id document_id], unique: true
  end
end
