# Rails Hotwire(Turbo/Stimulus) demo app

Rails の Hotwire を使って SPA のような挙動をするアプリケーションを作れるかの検証リポジトリです。

- [Hotwire メモ](memo.md)

## 動作方法

```bash
$ docker-compose up
$ bundle
$ yarn
$ rails db:migrate
$ rails s -b 0.0.0.0

// Tailwind CSS のビルド
$ yarn build:css --watch

// JS のビルド
$ yarn watch:js
```

## デモページ

- [CRUD SPA 風味](http://localhost:3000/articles)
- [Tab 切り替え](http://localhost:3000/tabs)
- [ライブプレビュー](http://localhost:3000/pages/new)
- [accepts_nested_attributes_for な親子を一括で保存する](http://localhost:3000/products)
- [has_many なラベル付け](http://localhost:3000/items/1)
  - rails console で適当に Item 作ってください
  - `Item.create(name: 'foo')`
- [無限スクロールのページング](http://localhost:3000/infinite_scrolls)
- [多対多のリレーション設定するUI](http://localhost:3000/many_to_many_rels)
  - Rails 側は未実装
  - UI の挙動を Stimulus で実験実装
    - チェックボックス一括選択・解除
    - セレクトアイテム一括変更
    - インクリメンタルサーチ
