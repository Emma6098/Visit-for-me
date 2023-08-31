import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map-toggle"
export default class extends Controller {
  static targets = ["mapContainer", "showButton"];
  connect() {
    console.log("hello")
  }
  toggleMap() {
    this.mapContainerTarget.classList.toggle("d-none");
    if (this.mapContainerTarget.classList.contains("d-none")) {
      this.showButtonTarget.innerText = "Afficher sur la carte";
    } else {
      this.showButtonTarget.innerText = "Fermer la carte";
    }
  }
}
