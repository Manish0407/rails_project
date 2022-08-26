class CreateBookIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :book_issues do |t|
      t.integer :student_id
      t.string :student_name
      t.string :book_name
      t.string :author
      t.integer :book_qty
      t.integer :status

      t.timestamps
    end
  end
end
