import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]

  connect() {
    const collapsed = localStorage.getItem("sidebarCollapsed") === "true";
    if (collapsed) {
      this.element.classList.add("is-collapsed");
      this.rotateButton(true);
      document.body.classList.toggle("sidebar-collapsed", collapsed);
    }
  }

  toggle() {
    this.element.classList.toggle("is-collapsed");
    const isCollapsed = this.element.classList.contains("is-collapsed");
    localStorage.setItem("sidebarCollapsed", isCollapsed);
    this.rotateButton(isCollapsed);
    document.body.classList.toggle("sidebar-collapsed", isCollapsed);
  }

  rotateButton(collapsed) {
    if (collapsed) {
      this.buttonTarget.classList.add("rotated");
    } else {
      this.buttonTarget.classList.remove("rotated");
    }
  }
}
