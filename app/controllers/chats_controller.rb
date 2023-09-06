class ChatsController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chat = Chat.new(message_params)
    @chat.chatroom = @chatroom
    @chat.user = current_user
    @toto = @chatroom.other_user
    if @chat.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "chat", locals: { chat: @chat })
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:chat).permit(:content)
  end
end
