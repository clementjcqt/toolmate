// app/javascript/controllers/nav_active_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    document.addEventListener("turbo:load", () => this.highlightActiveLink())
    this.highlightActiveLink()
  }

  highlightActiveLink() {
    const activePath = window.location.pathname
    const links = this.element.querySelectorAll("a.nav-link")

    links.forEach((link) => {
      const rawHref = link.getAttribute("href") || ""

      // 1) skip anchors
      if (rawHref === "#") {
        link.classList.remove("is-active")
        return
      }

      const linkPath = new URL(link.href).pathname
      let isActive = false

      if (linkPath === "/") {
        // 2) root active only on homepage
        isActive = (activePath === "/")
      } else {
        // 3) exact or nested
        isActive = activePath === linkPath || activePath.startsWith(linkPath + "/")
      }

      link.classList.toggle("is-active", isActive)
    })
  }
}
