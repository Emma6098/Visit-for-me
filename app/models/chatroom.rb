class Chatroom < ApplicationRecord
  has_many :chats, dependent: :destroy
end
