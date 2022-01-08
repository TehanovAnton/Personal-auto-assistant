class RenameServiceWorksOnWorks < ActiveRecord::Migration[6.1]
  def change
    rename_table :service_works, :works
  end
end
