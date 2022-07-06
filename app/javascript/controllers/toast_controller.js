import { Controller } from "@hotwired/stimulus"
import { Toast } from 'bootstrap'

export default class extends Controller {
  connect() {
    this.toast = new Toast(
      document.getElementById('copyToast')
    )
  }

  show({ detail: { content }}) {
    this.toast._element.querySelector('.toast-body').innerText = content
    this.toast.show()
  }
}