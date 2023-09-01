// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "jquery"
import "@nathanvda/cocoon"
import "@rails/actioncable"
import "mapbox-gl"
import "@mapbox/mapbox-gl-geocoder"

// Pour afficher images à côte du + qd on ajoute un photo refaire le _room_fields.html.erb

document.addEventListener("DOMContentLoaded", function() {
  const fileInputs = document.querySelectorAll(".hidden-file-input");

  fileInputs.forEach(function(fileInput) {
    fileInput.addEventListener("change", function(event) {
      const roomIndex = this.getAttribute("data-room-index");
      const selectedPhotosContainer = document.getElementById(`selected-photos-${roomIndex}`);
      selectedPhotosContainer.innerHTML = ""; // Efface les images précédentes

      const files = event.target.files;
      Array.from(files).forEach(function(file) {
        const img = document.createElement("img");
        img.src = URL.createObjectURL(file);
        selectedPhotosContainer.appendChild(img);
      });
    });
  });
});
