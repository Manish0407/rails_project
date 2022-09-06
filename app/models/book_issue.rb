class BookIssue < ApplicationRecord
  belongs_to :user
  belongs_to :book
  before_create :set_status
  enum :status, [:request, :allot, :cancel, :return, :deposit]
  validates :book_id, presence: true, uniqueness: { scope: :user_id }

  private

  def set_status
    self.status = "request"
  end
end