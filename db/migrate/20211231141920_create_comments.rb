class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :user_id, null: false
      t.references :comment, foreign_key: { to_table: :comments, on_delete: :cascade }

      t.timestamps
    end

    add_foreign_key :comments, :users, on_delete: :cascade
  end
end
