import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'message' ]

  static values = {
    user: Number
  }

  messageTargetConnected(element) {
    const actions = element.querySelector('.js-actions')
    const user = parseInt(element.dataset.user, 10)

    if(!actions || !user) return

    if(this.userValue === user) {
      actions.classList.remove('d-none')
    } else {
      actions.remove()
    }
  }
}
