class BookIssue < ApplicationRecord
  enum :status, [:request, :allot, :cancel, :return, :deposit]
end