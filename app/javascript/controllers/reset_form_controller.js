import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['submit'];

  reset() {
    this.element.reset();
    this.submitTarget.disabled = false;
  }
}
