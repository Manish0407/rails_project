class SetDefaultStatusToBookIssue < ActiveRecord::Migration[7.0]
  def change
    change_column :book_issues, :status, :integer, default: 0
  end
end
