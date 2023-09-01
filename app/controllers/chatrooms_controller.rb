class ChatroomsController < ApplicationController
  def show
      @chatroom = Chatroom.find(params[:id])
      @chat = Chat.new
  end
end
