// app/javascript/controllers/loader_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["overlay"]

  connect() {
    // cache le loader dès que Turbo a fini (nouvelle page) ou re-render (erreur)
    document.addEventListener("turbo:load",  () => this.hide())
    document.addEventListener("turbo:render", () => this.hide())
  }

  // appelé par le form au submit-start
  show() {
    this.overlayTarget.classList.remove("hidden")
    this.overlayTarget.setAttribute("aria-hidden", "false")
  }

  hide() {
    this.overlayTarget.classList.add("hidden")
    this.overlayTarget.setAttribute("aria-hidden", "true")
  }
}
