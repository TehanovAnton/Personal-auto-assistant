class ChangeNameDocuments < ActiveRecord::Migration[6.1]
  def change
    change_table :documents do |t|
      t.remove :name
      t.integer :name, null: false, default: 0
    end
  end
end
