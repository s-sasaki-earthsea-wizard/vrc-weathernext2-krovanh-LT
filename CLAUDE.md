# vrc-weathernext2-krovanh-LT

## プロジェクト概要

**VRChat 物理学集会の発表資料 (中間報告)**。
[WeatherNext2-typhoon-Krovanh](https://github.com/s-sasaki-earthsea-wizard/WeatherNext2-typhoon-Krovanh)
(Google DeepMind の WeatherNext 2 を ERA5 から走らせ、台風 24 号クロヴァンの経路を気象庁の経路と比べたプロジェクト)
の途中経過を発表する。

スライド本体は `slides-jp/index.html` (reveal.js)。構成と数字の出典は `docs/talk_outline.md` にまとめてある。

## 発表の主題 (この発表のスコープ)

- **対象集会**: VRChat 物理学集会 (2026-11-28 予定)。物理に興味のある一般の聴衆。気象学と機械学習の予備知識は仮定しない
- **切り口**: 「当たった / 外れた」ではなく、「どう外れたかを測る物差しを作った」
- **物理の聞きどころ**: カオスとアンサンブル、双峰分布の平均、ドリフトと拡散の比 (Péclet 数のようなもの)、スカログラム
- **一番の見せ場**: 見た目では対照の台風のほうがずっと良いのに、距離の誤差では易しくない (16–18 枚目)。
  道と時計に分けると外れ方の種類が見える (19–23 枚目)。停滞を Péclet 数で測ると、嵐が止まった日にメンバーは走っていた (25–31 枚目)
- **話さないこと**: モデルの中身 (ネットワークの構造)、気象庁の予報との優劣、クラウドの設定

## データの状況

- **予報の結果 (台風の周りの場と経路の表) は NAS とともに失われた** (2026-11 に判明)。再推論するかは未定
- 図は元プロジェクトの Wiki に貼ってあったもの (`slides-jp/assets/images/wiki/`) だけを使う。新しい集計はできない
- 手元に残っているのは ERA5 の入力と気象庁の経路表 (元プロジェクトの `data/`)。観測だけの図なら描ける

## 絶対に守る表現の約束

元プロジェクトの CLAUDE.md と docs/requirements.md の制約を引き継ぐ。

1. **実際の予報の成績として書かない。** 初期値は再解析 (ERA5) なので、これは予測可能性の実験
2. **「AI の台風予報は外れる / 当たる」と一般化しない。** モデル 1 つ、台風 3 つ、1 回 8 本。開始時刻 5 つは独立な標本ではない
3. **アンサンブル平均の経路を描かない。** 平均の誤差を出すときは、200 km 以内の本数か行き先を並べる
4. **台風どうしを距離の誤差だけで比べない。** 道 (経路からの距離) と時計を並べる。時計はクロヴァンではループの始まり (09-04 06Z) までしか読まない
5. **指向流の話は仮説として書く。** 予報の中の指向流はまだ測っていない
6. **Péclet 数は停滞とループを区別しない。** 「閉じ込め」「回転」を見分けたとは書かない。ランダムウォークの値を基準に使わない
7. **9 月の「発生後は素通りが消える」を所見として書かない。** Péclet 数では再現しなかった。「外れた仮説」としてだけ扱う
8. **ばらつき不足をモデルの欠陥として書かない。** 初期値に摂動を入れていない実験の作りによる
9. **追跡の寿命は渦の寿命。** 「モデルが台風を長生きさせる」と書くときは、消滅時刻と比べた結果も並べる
10. **数字は暫定値。** 2026 年の 2 つは気象庁の速報値と比べている
11. **図にはクレジットを付ける。** WeatherNext 2 (Google DeepMind、CC BY 4.0)、ERA5 (Copernicus)、気象庁、地図 (Natural Earth / OpenStreetMap)

## スライドに載せてよい情報

- 元プロジェクトで公開されているもの (リポジトリ、Wiki、issue) は書いてよい
- **NAS やマシンのパス、ホスト名、クラウドのアカウントや Pod の ID、メールアドレスは書かない**
- ローカルの参照先や作業メモは `.claude-notes/` (gitignore 対象) に置く

## 関連リンク

- 元プロジェクト: <https://github.com/s-sasaki-earthsea-wizard/WeatherNext2-typhoon-Krovanh>
- 元プロジェクトの Wiki: <https://github.com/s-sasaki-earthsea-wizard/WeatherNext2-typhoon-Krovanh/wiki/Analysis-Results>
- スライドテンプレート: <https://github.com/s-sasaki-earthsea-wizard/lt-slide-template>
- 参考フォーマット (姉妹リポ): <https://github.com/s-sasaki-earthsea-wizard/vrc-shor-braket-LT>

## 言語設定

ユーザへの応答は **日本語**。スライド本文は日本語。
コード内のコメント、ログメッセージ、エラーメッセージ、docstring は **英語**。

## 開発ルール

### スライド作成

- ベース: [reveal.js](https://github.com/hakimel/reveal.js) 5.1.0
- メインファイル: `slides-jp/index.html`
- カスタムスタイル: `slides-jp/styles/custom-style.css`
- 数式は KaTeX (`$...$` / `$$...$$`)。`slides-jp/vendor/katex` に同梱した版を読み込む
- スライドの区切りは「`---` だけの行」
- **見出しに数式や単位を入れない。** テーマが見出しを大文字化するので、Pe が PE に、km が KM になる
- **Markdown の中の数式で `\{`、`\,`、`\|` を使わない。** Markdown のエスケープとして消える (`\lbrace`、`\lvert` などで書く)
- **下付き文字 `_` を 2 つ以上含む数式は、空行を挟まない `<div>` で囲む。** Markdown が `_..._` を強調として食う。
  インライン数式では下付きを 1 つまでにする (上付きで書けるなら上付きにする)
- 太字の中身が `+` などの記号で始まるときは `**` ではなく `<b>` を使う
- 表は HTML の `<table>` で書き、`results-box` か `simple-box` に入れる。文字を詰めるときは `dense` クラス
- 1 枚の高さは 700 px。はみ出したら文を削るか図を小さくする (図のあるスライドは図を優先する)
- 図の一部だけを見せるときは、画像を編集せず `figure-crop` で切り抜く (`docs/talk_outline.md` の「図」)

### Git 運用

- ブランチ戦略: `feature/*`, `fix/*`, `refactor/*`
- コミットメッセージ: 英文を使用、動詞から始める
- PR は main ブランチへ

### コミットメッセージ規約

- **1 コミット = 1 つの主要な変更**

プレフィックスと絵文字:

- ✨ feat: 新機能
- 🐞 fix: バグ修正
- 📚 docs: ドキュメント
- 🎨 style: コードスタイル修正
- 🛠️ refactor: リファクタリング
- ⚡ perf: パフォーマンス改善
- ✅ test: テスト追加・修正
- 🏗️ chore: ビルド・補助ツール
- 🚀 deploy: デプロイ
- 🔒 security: セキュリティ修正
- 📝 update: 更新・改善
- 🗑️ remove: 削除

**重要**: Claude Code を使用してコミットする場合は、必ず以下の署名を含める:

```text
🤖 Assisted by [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## 現在の状態

- 2026-11-17: テンプレートから作成し、スライドのドラフト (本編 41 枚 + Appendix 9 枚) を作成。
  全スライドが 700 px に収まることを headless Chrome で確認済み。git 未初期化、未コミット
- 2026-11-18: 「話すこと・話さないこと」を削除 (Syota さん)。15 枚目に朝鮮半島へ向かったメンバーを追記。
  停滞の章に「窓の長さ」と「スカログラムの読み方」の 2 枚を追加し、本編 42 枚 + Appendix 9 枚になった。
  続けて Syota さんが「事故報告」と「次にやること」を削除し、「計算にかかった費用」を Appendix の「計算の中身」に統合して
  「計算の中身と費用」にした (Syota さんの指示)。本編 39 枚 + Appendix 9 枚
- 未決事項は `docs/talk_outline.md` の末尾
