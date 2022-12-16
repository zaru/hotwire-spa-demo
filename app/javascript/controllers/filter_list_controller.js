import { Controller } from "@hotwired/stimulus"

/**
 * リストを検索してフィルタする
 */
export default class extends Controller {
  static targets = ['search', 'item'];

  connect() {
    super.connect();
    this.itemTargets.forEach((item) => {
      item.dataset.display = item.style.display;
    });
  }

  search({currentTarget}) {
    const value = currentTarget.value;
    if (value === '') {
      this._clear();
    } else {
      this._filter(value);
    }
  }

  _clear() {
    this.itemTargets.forEach((item) => {
      item.style.display = item.dataset.display;
    });
  }

  _filter(word) {
    const notHits = this.itemTargets.filter((item) => !item.dataset.name.includes(word))
    notHits.forEach((item) => {
      item.style.display = 'none';
    });
  }
}
