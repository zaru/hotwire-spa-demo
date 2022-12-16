import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['source'];

  change() {
    console.log('change');
    this.dispatch('change', { detail: { content: this.sourceTarget.value } });
    const controllerElement = document.querySelector('.js-dynamic-content');
    const dController = this.application.getControllerForElementAndIdentifier(controllerElement, 'dynamic-content');
    dController.render({ detail: { content: this.sourceTarget.value } });
  }
}
