require 'elasticsearch/model'

class Book < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  searchkick word_start: [:name, :book_author], highlight: [:name]
  has_many :book_issues
  has_many :users, through: :book_issues, :dependent => :destroy
  before_save :normalize_name
  after_commit :reindex_books
  validates :name, presence: true, uniqueness: { scope: :book_author }
  validates :qty, presence: true, length: { minimum: 1 }

  private

  def normalize_name
    self.name = name.downcase.titleize 
    self.book_author = book_author.downcase.titleize
  end

  def reindex_books
    Book.reindex
  end
end

Book.import
