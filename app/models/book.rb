class Book < ApplicationRecord
  validates :name, presence: true
  validates :book_author, presence: true
  validates :qty, presence: true, length: { minimum: 1 } 
end
