import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-room"
export default class extends Controller {
  static targets = ["room"];

  connect() {
    console.log("Connected to add-room controller");
  }

  addRoom() {
    const newRoomCard = document.createElement("div");
    newRoomCard.classList.add("card-room");

    newRoomCard.innerHTML = `
      <div class="nested-fields">
        <input class="custom-input" type="text" name="rooms_names[<%= room.id %>]" placeholder="Nom de la pièce" label="Nom de la pièce" />
        <input class="custom-input" type="text" name="rooms_descriptions[<%= room.id %>]" placeholder="Description de la pièce" label="Description de la pièce" />
        <div class="d-flex align-items-center">
            <img image_tag="" class="photo-edit d-none" data-photo-preview-target="preview" >
            <label for="photo-<%= room.id %>" class="custom-file-upload"><span class="plus-icon">+</span></label>
            <input class="d-none" id="photo-<%= room.id %>" type="file" name="rooms_photos[<%= room.id %>][]" multiple placeholder="Photos de la pièce" label="Photos de la pièce" data-photo-preview-target="input" data-action="change->photo-preview#displayPreview" />
          </div>
          <p><span data-photo-preview-target="span">0</span> photos téléchargées</p>
        </div>
      </div>
      <br>
    `;
    const addRoomButton = this.element.querySelector("#addRoomButton");
    this.element.insertBefore(newRoomCard, addRoomButton);
  }
}
