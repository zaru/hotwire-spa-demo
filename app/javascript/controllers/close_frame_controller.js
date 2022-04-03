import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close() {
    // Rails link helper の :back を使っても良い
    history.back();
  }
}
