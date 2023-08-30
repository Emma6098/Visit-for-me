import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-room-name"
export default class extends Controller {
  static targets = ["nameInput"];

  connect() {
    console.log("hello")
    this.nameInputTarget.classList.add("hidden");
  }

  editName() {

    this.nameInputTarget.classList.remove("hidden");
    this.nameInputTarget.focus();
  }
}
