import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["searchBar", "searchIcon"]

  toggleSearch() {
    this.searchBarTarget.classList.toggle("hidden")
  }
}
