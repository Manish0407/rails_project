class Book < ApplicationRecord
  #belongs_to :user
  validates :name, presence: true
  validates :book_author, presence: true, uniqueness: true
  validates :qty, presence: true, length: { minimum: 1 } 
end
