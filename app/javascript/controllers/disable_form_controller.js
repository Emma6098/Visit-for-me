import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disable-form"
export default class extends Controller {

  connect() {
    this.element.addEventListener("submit", this.disableForm.bind(this));
  }

  disableForm() {
    // Désactivez le formulaire une fois qu'il est soumis
    this.element.querySelectorAll("input, textarea, button").forEach((input) => {
      input.disabled = true;
    });
  }
}
