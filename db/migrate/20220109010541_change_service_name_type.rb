class ChangeServiceNameType < ActiveRecord::Migration[6.1]
  def change
    change_column :services, :name, :string, null: false
  end
end
