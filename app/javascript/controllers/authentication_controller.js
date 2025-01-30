import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Authentication controller connected.");
  }

  // Exemple : logique pour afficher un indicateur de chargement lors de la soumission
  submit(event) {
    const button = this.element.querySelector("input[type='submit']");
    button.disabled = true;
    button.textContent = "Connexion...";
  }
}
