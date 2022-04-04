import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log('connect frame event controller');

    // Turbo のイベントは原則として document にイベントを発生させる
    // どの要素のイベントかは event.target で判定をする
    document.addEventListener('turbo:click', (event) => {
      console.log('turbo:click', { target: event.target, detail: event.detail });
    });
    document.addEventListener('turbo:before-visit', (event) => {
      console.log('turbo:before-visit', { target: event.target, detail: event.detail });
    });
    document.addEventListener('turbo:visit', (event) => {
      console.log('turbo:visit', { target: event.target, detail: event.detail });
    });
    document.addEventListener('turbo:submit-start', (event) => {
      console.log('turbo:submit-start', { target: event.target, detail: event.detail });
    });
    document.addEventListener('turbo:submit-end', (event) => {
      console.log('turbo:submit-end', { target: event.target, detail: event.detail });
    });
    document.addEventListener('turbo:before-cache', (event) => {
      console.log('turbo:before-cache', { target: event.target, detail: event.detail });
    });
    document.addEventListener('turbo:before-render', (event) => {
      console.log('turbo:before-render', { target: event.target, detail: event.detail });
    });

    // Turbo でリクエストは完了しているが、その後の描画前に発火する
    // 例えば削除ボタンであれば、サーバ側で削除自体は完了していて、View に反映する前のタイミング
    // document に対してイベント発火するので、自分自身が対象かどうかを確認をする必要がある
    // event.target には <turbo-stream action="append|remove" ...> のレスポンスされた要素が入っている
    //
    // 削除 (remove) の判定方法
    // - action === remove
    // - targetElements に自身の要素が含まれているか
    //
    // 追加 (append) の判定方法
    // - action === append
    // - firstElementChild が HTMLTemplateElement かどうか
    //
    // @Type は @hotwired/turbo/dist/types/elements の StreamElement
    document.addEventListener('turbo:before-stream-render', (event) => {
      if (event.target.action === 'remove' &&
        event.target.targetElements.includes(this.element)
      ) {
        console.log('turbo:before-stream-render', {
          target: event.target,
          detail: event.detail,
          action: event.target.action,
          targetElements: event.target.targetElements
        });
        // DOM を削除する処理を一時停止し、CSS アニメーションを完了してから処理を再開する
        event.preventDefault();
        this.element.classList.add('animation-remove');
        this.element.addEventListener('animationend', () => {
          event.target.performAction();
        });
      }

      if (event.target.action === 'prepend' &&
        event.target.firstElementChild instanceof HTMLTemplateElement
      ) {
        console.log('turbo:before-stream-render', {
          target: event.target,
          detail: event.detail,
          action: event.target.action,
          firstElementChild: event.target.firstElementChild,
          targetElements: event.target.targetElements
        });
        event.target.templateElement.content.firstElementChild.classList.add('animation-insert');
      }

      if (event.target.action === 'replace' &&
        event.target.targetElements.includes(this.element)
      ) {
        console.log('turbo:before-stream-render', {
          target: event.target,
          detail: event.detail,
          action: event.target.action,
          targetElements: event.target.targetElements
        });
        event.target.templateElement.content.firstElementChild.classList.add('animation-replace');
      }
    });

    document.addEventListener('turbo:render', (event) => {
      console.log('turbo:render', { target: event.target, detail: event.detail });
    });
    document.addEventListener('turbo:load', (event) => {
      console.log('turbo:load', { target: event.target, detail: event.detail });
    });








    // 以下、4つのイベントは TurboFrame 要素自体にイベントを発生させる
    this.element.addEventListener('turbo:before-fetch-request', (event) => {
      console.log('turbo:before-fetch-request', { target: event.target, detail: event.detail });
    });
    this.element.addEventListener('turbo:before-fetch-response', (event) => {
      console.log(`turbo:before-fetch-response`, { target: event.target, detail: event.detail });
    });
    this.element.addEventListener('turbo:frame-render', (event) => {
      console.log('turbo:frame-render', { target: event.target, detail: event.detail });
    });
    this.element.addEventListener('turbo:frame-load', (event) => {
      console.log('turbo:frame-load', { target: event.target, detail: event.detail });
    });
  }
}
