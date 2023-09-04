class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @chat = Chat.new
  end

  def index
    @chatrooms = Chatroom.all
    @chatroom_user = current_user
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :chats)
  end
end
