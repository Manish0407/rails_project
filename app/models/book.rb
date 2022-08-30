class Book < ApplicationRecord
  # validates :name, presence: true
  # validates :book_author, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: { scope: :book_author }
  validates :qty, presence: true, length: { minimum: 1 } 
end

