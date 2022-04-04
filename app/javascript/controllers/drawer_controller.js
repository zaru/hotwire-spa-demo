import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    listUrl: String
  };
  static targets = ['drawer'];

  close() {
    this.drawerTarget.remove();
    history.pushState({}, '', this.listUrlValue);
  }
}
