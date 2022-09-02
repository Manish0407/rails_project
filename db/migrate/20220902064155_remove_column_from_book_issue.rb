class RemoveColumnFromBookIssue < ActiveRecord::Migration[7.0]
  def change
    remove_column :book_issues, :student_name, :string
    remove_column :book_issues, :book_name, :string
    remove_column :book_issues, :author, :string
    remove_column :book_issues, :book_qty, :integer
    add_column :book_issues, :book_id, :integer
  end
end
