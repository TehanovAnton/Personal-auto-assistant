class AddExpireDateAndRenameDateIssueCarOwnerDocuments < ActiveRecord::Migration[6.1]
  def change
    change_table :car_owner_documents do |t|
      t.rename :date_issue, :issue_date
      t.date :expire_date, null: false
    end
  end
end
