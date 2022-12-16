import { Controller } from "@hotwired/stimulus"

/**
 * モーダル（ダイアログ）を開く
 */
export default class extends Controller {
  static targets = ['dialog'];

  open() {
    this.dialogTarget.showModal();
  }

  close() {
    this.dialogTarget.close();
  }
}
