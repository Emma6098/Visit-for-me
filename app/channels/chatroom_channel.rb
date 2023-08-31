class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end
    # stream_from "some_channel"

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
