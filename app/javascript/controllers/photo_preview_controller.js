import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-preview"
export default class extends Controller {
  static targets = ["input", "preview", "span"]
  connect() {
    console.log("toto photo");
  }

  displayPreview(event) {
    const reader = new FileReader();
    reader.onload = (event) => {
      this.previewTarget.src = event.currentTarget.result;
      console.log(this.inputTarget.files.length)
    }
    reader.readAsDataURL(this.inputTarget.files[0])
    this.previewTarget.classList.remove('d-none');
    this.spanTarget.innerHTML = this.inputTarget.files.length
  }
}
