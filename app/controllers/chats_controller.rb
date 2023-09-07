class ChatsController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chat = Chat.new(message_params)
    @chat.chatroom = @chatroom
    @chat.user = current_user
    if @chat.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        chat: render_to_string(partial: "chats/new_chat", locals: { chat: @chat }),
        sender_id: @chat.user.id,
        sender_name: @chat.user.first_name,
        send_time: @chat.created_at.strftime("%a %b %e at %l:%M %p"),
      )
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:chat).permit(:content)
  end
end
