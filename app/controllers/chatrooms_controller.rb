class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @chat = Chat.new
    unless current_user.id == @chatroom.user_id
      redirect_to root_path, notice: "vous n'avez ps acces a cette chatroom"
    end
  end

  def index
    @chatroom_user = current_user
    @chatrooms = Chatroom.where("user_id = ?", current_user.id)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :chats)
  end
end
