# fantasy.riya.work

[fantasy.riya.work](https://fantasy.riya.work) で Fantasy Zone (アーケード版) をブラウザで遊ぶための静的サイトです。
エミュレータは [EmulatorJS](https://github.com/EmulatorJS/EmulatorJS) の FBNeo コアを使います。

## ROM について

ROM はこのリポジトリにもイメージにも入っていません。ページで手元の MAME / FBNeo 用 `fantzone.zip` (16 ファイル、`epr-7382a.26` など) を選ぶと、ブラウザの IndexedDB に保存されて次からはそのまま起動します。ROM がサーバーに送られることはありません。

## 操作

| キー | 動作 |
| --- | --- |
| ←↑↓→ | 移動 |
| Z | ショット |
| X | ボム |
| V | コイン |
| Enter | スタート |

スマホでは画面上のパッドで操作できます。キー設定はエミュレータのメニューから変えられます。

## 手元で動かす

```sh
docker build -t fantasy.riya.work . && docker run --rm -p 8080:8080 fantasy.riya.work
```

http://localhost:8080 を開きます。

## リリース

main に push するたびに GitHub Actions が `ghcr.io/tsuji-riya/fantasy.riya.work:1.0.<実行番号>` (amd64 / arm64) を作ります。
デプロイは [tsuji-riya/lab](https://github.com/tsuji-riya/lab) の `apps/fantasy/` で行い、新しいタグは lab の Dependabot が更新 PR にします。

## ライセンス

このリポジトリのコードは GPL-3.0 です。イメージに含まれる EmulatorJS は GPL-3.0、FBNeo は非商用ライセンスです。
