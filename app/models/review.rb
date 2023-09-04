class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: "User"
  validates :rating, presence: true
  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome(self.recipient).deliver_now
  end
end
