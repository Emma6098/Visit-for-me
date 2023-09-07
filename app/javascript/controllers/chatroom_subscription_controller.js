import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  static values = { chatroomId: Number, userId: Number };
  static targets = ["chats", "form"];

  resetForm(event) {
    event.target.reset();
  }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: (data) => this.insertChatAndScrollDown(data) }
    );
    console.log(
      `Subscribe to the chatroom with the id ${this.chatroomIdValue}.`
    );
  }

  insertChatAndScrollDown(data) {
    const currentUserIsSender = this.userIdValue === data.sender_id
    currentUserIsSender ?
    this.#insertMyMessageToChatAndScrollDown(data) :
    this.#insertSenderMessageToChatAndScrollDown(data)
  }

  #insertMyMessageToChatAndScrollDown(data) {
    const new_message = this.myMessageTemplate(data)
    this.chatsTarget.insertAdjacentHTML("beforeend", new_message);
    this.chatsTarget.scrollTo(0, this.chatsTarget.scrollHeight);
    this.formTarget.reset();
  }

  #insertSenderMessageToChatAndScrollDown(data) {
    const new_message = this.senderMessageTemplate(data)
    console.log(new_message)
    this.chatsTarget.insertAdjacentHTML("beforeend", new_message);
    this.chatsTarget.scrollTo(0, this.chatsTarget.scrollHeight);
    this.formTarget.reset();
  }

  myMessageTemplate(data) {
    return `
    <div class="current_user_chat chat-box">
    <p>${data.sender_name}</p>
      <small>
        <p>${data.send_time}</p>
      </small>
        ${data.chat}
    </div>
    `
  }

  senderMessageTemplate(data) {
    console.log(data)
    return `
    <div class="other_user_chat chat-box">
      <p>${data.sender_name}</p>
      <small>
        <p>${data.send_time}</p>
      </small>
      ${data.chat}
    </div>
    `
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom");
    this.channel.unsubscribe();
  }
}
