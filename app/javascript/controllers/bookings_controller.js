import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookings"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("hello wld");
    // this.formTarget.classList.add("d-none")
  }

  showForm(event) {
    event.preventDefault()
    this.formTarget.classList.toggle("d-none")
    }
}
