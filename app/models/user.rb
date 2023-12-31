class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :visit_forms, dependent: :destroy
  has_many :bookings
  has_many :chats
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  def received_reviews
    Review.where(recipient: self)
  end

  def my_reviews
    Review.where(recipient: self)
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
end
