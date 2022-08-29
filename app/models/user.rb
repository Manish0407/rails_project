class User < ApplicationRecord
  #has_many :books
  #enum :type, [:admin, :student]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :email, confirmation: true
  validate :name, presence: true
  #validates :email_confirmation, presence: true

  def admin?
    type == "Admin"
  end

  def student?
    type == "Student"
  end
end
