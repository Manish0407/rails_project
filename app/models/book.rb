class Book < ApplicationRecord
  before_validation :normalize_name, on: :create 
  validates :name, presence: true, uniqueness: { scope: :book_author }
  validates :qty, presence: true, length: { minimum: 1 }

  private
    def normalize_name
      self.name = name.downcase.titleize
      self.book_author = book_author.downcase.titleize
    end 
end

