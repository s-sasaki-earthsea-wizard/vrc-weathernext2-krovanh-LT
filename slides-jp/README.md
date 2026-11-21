# vrc-weathernext2-krovanh-LT

## 概要

VRChat 物理学集会「迷走台風を AI は予報できるか？」のスライド。構成と出典は `../docs/talk_outline.md`。

## 開発環境

[reveal.js](https://github.com/hakimel/reveal.js) によってスライドの作成をしています。
ビルド済みの `dist/` を同梱しているので、見るだけなら Node.js は要りません (Python 3 があれば足ります)。

## 使い方

### スライド作成

リポジトリ直下で、以下のコマンドでローカルサーバーを起動:

```bash
make serve
```

ブラウザで [http://localhost:8000](http://localhost:8000) にアクセスすると、スライドをプレビューできます。
reveal.js の `npm start` は Node.js 26 では起動しません (理由はリポジトリ直下の README)。

### スライドをpdfでエクスポート

`decktape`を使ってスライドをPDFにエクスポートできます。

1. `decktape`のインストール

```bash
npm install -g decktape
```

1. PDFエクスポート

以下のコマンドで`html`で書いたスライドをpdfにエクスポートできます:

``` bash
# 16:9のスライドの場合
decktape --size 1920x1080 index.html slides.pdf

# 4:3のスライドの場合
decktape --size 1600x1200 index.html slides.pdf
```

## 免責事項

- 本スライドの内容に従ったいかなる結果において著者は一切の責任を負いません

## LICENSE

Apache License 2.0 またはそれ以降の版。第三者の著作物 (reveal.js、KaTeX、フォント、図) の条件は、リポジトリ直下の [LICENSE](../LICENSE) と [NOTICE](../NOTICE) を参照。