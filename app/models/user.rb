class User < ApplicationRecord
  #has_many :books
  before_validation :normalize_name, on: :create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :email, confirmation: true, presence: true
  validates :name, presence: true, length: { minimum: 3, too_short: "must have at least %{count} characters." }
  validates :password, confirmation: true

  def admin?
    type == "Admin"
  end

  def student?
    type == "Student"
  end

  private
    def normalize_name
      self.name = name.downcase.titleize
    end
end
