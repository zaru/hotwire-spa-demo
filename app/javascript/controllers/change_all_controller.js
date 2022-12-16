import { Controller } from "@hotwired/stimulus"

/**
 * 指定のセレクトリストを一括変更する
 */
export default class extends Controller {
  static targets = ['select'];

  changeAll({currentTarget}) {
    this.selectTargets.forEach((select) => {
      select.value = currentTarget.value;
      select.dispatchEvent(new Event('change')); // JS で状態操作するとイベント発火しない
    });
  }
}
