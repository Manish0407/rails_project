class BookIssue < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum :status, [:request, :allot, :cancel, :return, :deposit]
  before_save :check_status
  validates :book_id, presence: true#, uniqueness: { scope: :user_id if status: != "deposit"}
  # attr_accessor :status

#   before_save :check_status
#   private

  def check_status
    if self.status == "allot"
      @book = Book.find(self.book_id)
      qty = @book.qty
      @book.update(qty: qty-1)
    elsif self.status == "deposit"
      @book = Book.find(self.book_id)
      qty = @book.qty
      @book.update(qty: qty+1)
    end 
  end
end