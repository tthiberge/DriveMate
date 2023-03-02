import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookings"
export default class extends Controller {
  connect() {
    console.log("hello wld");
  }

  showForm() {
    this.formTarget.classList.toggle("d-none")
    this.pendingTarget.innerText = "Yeah"
    }
}
