class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @chat = Chat.new
    unless current_user.id == @chatroom.user_id || current_user.id == @chatroom.other_user_id
      redirect_to root_path, notice: "vous n'avez ps acces a cette chatroom"
    end
  end

  def index
    @chatroom_user = current_user
    @chatrooms = Chatroom.where("user_id = ? OR other_user_id = ?", current_user.id, current_user.id)
    @current_user_first_name = current_user.first_name
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :chats)
  end
end
