class BookIssue < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum :status, [:request, :allot, :cancel, :return, :deposit]
  validates :book_id, presence: true#, uniqueness: { scope: :user_id,}
  # attr_accessor :status

  # before_save :check_status
  # private

  # def check_status
  #   unless self.status_previous_change
      
  #   end
  #   status.changed? 
  # end
  # def deposit
  #   book_issue.where(user_id).where(book_id).status == "deposit"
  # end
end