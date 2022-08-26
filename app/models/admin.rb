class Admin < User
  has_many :books
  #belongs_to :user
end