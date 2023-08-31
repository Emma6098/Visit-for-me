class ChatsController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chat = Chat.new(message_params)
    @chat.chatroom = @chatroom
    @chat.user = current_user
    if @chat.saved_change_to_chatroom_id.broadcast_to(
      @chatroom,
      render_to_string(partial: "chat", locals: {chat: @chat})
    )
      redirect_to chatroom_path(@chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:chat).permit(:content)
  end
end
