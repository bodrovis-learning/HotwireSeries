import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'widget', 'doLike', 'doUnlike' ]
  static outlets = [ "messages" ]
  static values = {
    liked: Boolean
  }

  widgetTargetConnected(element) {
    const initiator = parseInt(element.dataset.initiator, 10)

    if(initiator === this.messagesOutlet.userValue) {
      this.likedValue = !this.likedValue
    }

    if(this.likedValue) {
      this.showDislike()
    } else {
      this.showLike()
    }
  }

  showLike() {
    this.doUnlikeTarget.remove()
    this.doLikeTarget.classList.remove('d-none')
  }

  showDislike() {
    this.doLikeTarget.remove()
    this.doUnlikeTarget.classList.remove('d-none')
  }
}