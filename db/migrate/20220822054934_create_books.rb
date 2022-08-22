class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :book_author
      t.integer :qty

      t.timestamps
    end
  end
end
