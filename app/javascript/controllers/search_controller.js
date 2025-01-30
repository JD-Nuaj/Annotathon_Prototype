import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["searchBar", "searchIcon", "mobileMenu"]

  toggleSearch() {
    this.searchBarTarget.classList.toggle("hidden")
  }

  toggleMobileMenu() {
    this.mobileMenuTarget.classList.toggle("hidden")  // Bascule l'affichage du menu mobile
  }
}
