import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'bookmark' ]
  
  static values = {
    admin: Boolean
  }

  bookmarkTargetConnected(element) {
    const actions = element.querySelector('.js-actions')

    if(actions && !this.adminValue) {
      actions.remove()
    }
  }
}