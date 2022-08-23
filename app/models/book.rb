class Book < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :book_author, presence: true
  validates :qty, presence: true, length: { minimum: 1 } 
end
