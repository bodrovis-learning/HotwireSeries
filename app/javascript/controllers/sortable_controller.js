import { Controller } from "@hotwired/stimulus"
import { patch } from '@rails/request.js'
import Sortable from 'sortablejs';

export default class extends Controller {
  static targets = [ 'position' ]
  connect() {
    this.sortable = new Sortable(this.element, {
      handle: '.js-sort-handle',
      onEnd: async (e) => {
        try {
          this.disable()

          const resp = await patch("/notes/reorder", {
            body: JSON.stringify({
              "new_position": e.newIndex + 1,
              "old_position": e.oldIndex + 1,
            })
          })

          if(!resp.ok) {
            throw new Error(`Cannot reorder: ${resp.statusCode}`)
          }

          this.updatePositions()
        } catch(e) {
          console.error(e)
        } finally {
          this.enable()
        }
      }
    })
  }

  disable() {
    this.sortable.option('disabled', true)
    this.sortable.el.classList.add('opacity-50')
  }

  enable() {
    this.sortable.option('disabled', false)
    this.sortable.el.classList.remove('opacity-50')
  }

  updatePositions() {
    this.positionTargets.forEach((position, index) => {
      position.innerText = index + 1
    })
  }
}