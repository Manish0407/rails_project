class User < ApplicationRecord
  has_many :books
  enum :user_type, [:admin, :student]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # def admin?
  #   user_type == "admin"
  # end

  # def student?
  #   user_type == "student"
  # end
end
