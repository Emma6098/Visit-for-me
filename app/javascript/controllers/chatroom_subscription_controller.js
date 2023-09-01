import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["chats", "form"]
  resetForm(event) {
    event.target.reset();
  }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertChatAndScrollDown(data) }

    )
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  #insertChatAndScrollDown(data) {
  this.chatsTarget.insertAdjacentHTML("beforeend", data)
  console.log(this.chatsTarget)
  this.chatsTarget.scrollTo(0, (this.chatsTarget.scrollHeight))
  this.formTarget.reset()
}
disconnect() {
  console.log("Unsubscribed from the chatroom")
  this.channel.unsubscribe()
}
}
