import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="arrow-toggle"
export default class extends Controller {
  static targets = ["arrow"]
  connect() {
    console.log("coucou controller arrow");
  }

  toggle() {
    this.arrowTarget.classList.toggle("flip")
    console.log(this.arrowTarget);
  }
}
