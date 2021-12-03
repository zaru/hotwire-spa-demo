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
```
