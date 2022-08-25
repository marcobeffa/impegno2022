import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ['container']

  connect() {
    this.toggleClass = this.data.get('class') || 'hidden'
    this.modalBackground = '<div id="modal-background" class="fixed z-40 top-0 left-0 w-full h-full" style="background-color: rgba(0, 0, 0, 0.8);"></div>'
  }

  open(e) {
    e.preventDefault()

    // Add right padding to the body so the page doesn't shift
    // when we disable scrolling
    let scrollbarWidth = window.innerWidth - document.documentElement.clientWidth
    document.body.style.paddingRight = `${scrollbarWidth}px`

    // Set overflow hidden to prevent scrolling of background
    // This must happen after the scrollbar calculation
    document.body.style.overflow = 'hidden'

    // Unhide the modal
    this.containerTarget.classList.remove(this.toggleClass)
    document.body.innerHTML += this.modalBackground;
  }

  close(e) {
    e.preventDefault()

    // Remove tweaks for scrollbar
    document.body.style.paddingRight = null
    document.body.style.overflow = null

    // Hide the modal
    this.containerTarget.classList.add(this.toggleClass)
    const modalBackground = document.getElementById("modal-background")
    document.body.removeChild(modalBackground)
  }

  closeContainer(e) {
    if (e.target === this.containerTarget) {
      this.close(e)
    }
  }

  closeWithKeyboard(e) {
    if (e.keyCode == 27 && !this.containerTarget.classList.contains(this.toggleClass)) {
      this.close(e)
    }
  }
}

