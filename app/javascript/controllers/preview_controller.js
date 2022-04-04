import { Controller } from "@hotwired/stimulus"
import { debounce } from 'throttle-debounce'

export default class extends Controller {
  static values = {
    url: String
  };

  initialize() {
    this.debounceRequest = debounce(200,
      false,
      () => {
        this._request();
      });
  }

  post() {
    this.debounceRequest();
  }

  async _request() {
    const form = new FormData(this.element);
    await fetch(this.urlValue, {
      method: 'POST',
      headers: {
        "X-CSRF-Token": document.querySelector('[name="csrf-token"]').content,
      },
      body: form
    });
  }
}
