import { Controller } from "@hotwired/stimulus"

/**
 * 指定のチェックボックスを一括選択・解除する
 */
export default class extends Controller {
  static targets = ['checkbox'];

  toggle({currentTarget}) {
    (currentTarget.checked) ? this._selectAll() : this._clearAll();
  }

  _selectAll() {
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.checked = true;
      checkbox.dispatchEvent(new Event('input')); // JS でチェック状態操作するとイベント発火しない
    });
  }

  _clearAll() {
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.checked = false;
      checkbox.dispatchEvent(new Event('input'));
    });
  }
}
