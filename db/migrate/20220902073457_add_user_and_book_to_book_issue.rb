class AddUserAndBookToBookIssue < ActiveRecord::Migration[7.0]
  def change
    add_reference :book_issues, :user, null: false, foreign_key: true
    add_reference :book_issues, :book, null: false, foreign_key: true
  end
end
