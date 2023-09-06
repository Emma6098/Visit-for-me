class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :other_user, class_name: "User"
  has_many :chats, dependent: :destroy
end
