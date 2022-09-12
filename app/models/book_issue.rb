class BookIssue < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum :status, [:request, :allot, :cancel, :return, :deposit]
  validates :book_id, presence: true#, uniqueness: { scope: :user_id if status: != "deposit"}
  # attr_accessor :status

#   before_save :check_status
#   private

#   def check_status
#     unless self.status_previous_changes
    
#     end 
#   end
end