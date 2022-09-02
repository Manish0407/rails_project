class BookIssue < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum :status, [:request, :allot, :cancel, :return, :deposit]
  before_validation :details, on: :create 
  validates :book_id, presence: true, uniqueness: { scope: :user_id }
  def details
    self.status = "request"
  end
end