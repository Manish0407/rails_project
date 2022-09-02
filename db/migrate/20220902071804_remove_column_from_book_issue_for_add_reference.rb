class RemoveColumnFromBookIssueForAddReference < ActiveRecord::Migration[7.0]
  def change
    remove_column :book_issues, :book_id, :integer
    remove_column :book_issues, :student_id, :integer
  end
end
