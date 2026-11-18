# vrc-weathernext2-krovanh-LT

VRChat 物理学集会の発表資料 — **迷走台風を AI は予報できるか？
〜WeatherNext 2 で台風 24 号クロヴァンを追う (中間報告)〜**

スライド本体は [reveal.js](https://github.com/hakimel/reveal.js) で構成し、
[lt-slide-template](https://github.com/s-sasaki-earthsea-wizard/lt-slide-template) をベースにしている。

## 概要

元プロジェクト [WeatherNext2-typhoon-Krovanh](https://github.com/s-sasaki-earthsea-wizard/WeatherNext2-typhoon-Krovanh) の
途中経過を、物理に興味のある一般の聴衆向けに紹介する。

- Google DeepMind の WeatherNext 2 を ERA5 から走らせ、台風 3 つ (主役のクロヴァン T2624 と、対照のドゥージェン T2625、ペイパー T2515)
  × 開始時刻 5 つ × 8 本 = 120 本の 10 日予報を、気象庁の経路と比べた
- 迷走したクロヴァンでは予報が北へ抜ける組と大陸へ向かう組に割れ、観測のループを再現したメンバーはいなかった
- 距離の誤差だけでは台風どうしを比べられない。道 (経路からの距離) と時計 (経路の上での早い遅い) に分けると、
  ドゥージェンは「正しい道を半日早く」、クロヴァンは「停滞で道が割れた」
- 停滞をドリフトと拡散の比 (Péclet 数のようなもの) で測ると、嵐が止まった日にメンバーは進み続け、動き出してから鈍っていた

**数字はすべて暫定値。** 2026 年の 2 つの台風は気象庁の速報値と比べている。

## 元プロジェクトの資料

| 資料 | 内容 |
|---|---|
| [Wiki: Analysis Results](https://github.com/s-sasaki-earthsea-wizard/WeatherNext2-typhoon-Krovanh/wiki/Analysis-Results) | 図つきの解析結果 (スライドの図の出典) |
| [docs/requirements.md](https://github.com/s-sasaki-earthsea-wizard/WeatherNext2-typhoon-Krovanh/blob/main/docs/requirements.md) | 実験の決定事項、台風の諸元 |
| [docs/design.md](https://github.com/s-sasaki-earthsea-wizard/WeatherNext2-typhoon-Krovanh/blob/main/docs/design.md) | 道と時計、Péclet 数、DTW を使わなかった理由など、指標の定義と所見 |

## ディレクトリ構成

```text
.
├── docs/
│   └── talk_outline.md    # 構成、各スライドの数字の出典、図の切り抜き方、未決事項
└── slides-jp/             # reveal.js スライド
    ├── index.html
    ├── styles/custom-style.css
    ├── vendor/katex/      # KaTeX 0.17.0 (オフラインで数式を描くため)
    └── assets/images/
        ├── krovanh-members-osm-init-2026-09-01T00.png  # 元プロジェクトの試作図
        └── wiki/          # 元プロジェクトの Wiki の図
```

## 開発環境

- Node.js 18 以上 (reveal.js 5.x の要求)
- 必要に応じて [decktape](https://github.com/astefanutti/decktape) (PDF エクスポート用)

## 使い方

### スライドのプレビュー

```bash
cd slides-jp
npm install
npm start
```

ブラウザで <http://localhost:8000> にアクセスする。

### スライドの PDF エクスポート

```bash
cd slides-jp
decktape --size 1920x1080 index.html slides.pdf
```

## クレジット

- 予報: WeatherNext 2, Google DeepMind (CC BY 4.0)
- 初期値: ERA5, Copernicus Climate Change Service
- 台風の経路: 気象庁 台風位置表 (速報値・確定値)
- 地図: Natural Earth、© OpenStreetMap contributors

## 免責事項

本スライドの内容に従ったいかなる結果においても著者は一切の責任を負いません。

本プロジェクトは [reveal.js](https://github.com/hakimel/reveal.js) (MIT License) と
[KaTeX](https://github.com/KaTeX/KaTeX) (MIT License、`slides-jp/vendor/katex` に同梱) を利用している。
