> **このREADMEの内容は削除の上使用してください**

# J59NOC リポジトリテンプレート

J59NOCメンバが新しくリポジトリを作成する際に使用できるテンプレートです。

## テンプレートの利用方法

1. GitHub の [J59NOC/template](https://github.com/J59NOC/template) リポジトリを開きます。
2. **Use this template** をクリックし、**Create a new repository** を選択します。
3. 作成するリポジトリのオーナー、名前、公開設定を入力します。
4. **Create repository from template** をクリックしてリポジトリを作成します。
5. 作成したリポジトリで、この README の内容をプロジェクトに合わせて編集し、冒頭の注意書きを削除します。

## テンプレート内容

| パス | 説明 |
|------|------|
| [.github/ISSUE_TEMPLATE/default.md](.github/ISSUE_TEMPLATE/default.md) | イシューのデフォルトテンプレート |
| [.github/ISSUE_TEMPLATE/config.yml](.github/ISSUE_TEMPLATE/config.yml) | ブランクイシューを非表示にする設定 |
| [managing-labels/labels.json](managing-labels/labels.json) | 登録するラベルの定義ファイル |
| [managing-labels/create-labels.sh](managing-labels/create-labels.sh) | ラベルを一括作成するシェルスクリプト |

## イシューテンプレート

`.github/ISSUE_TEMPLATE/default.md` に以下のセクションが定義されています。

- **概要/Overview** (必須)
- **完了条件/Completion condition** (必須) — チェックリスト形式
- **関連リンク/link** — Slack リンクなど
- **やらないこと** — スコープ外の明示

## ラベル管理

### 定義済みラベル

[labels.json](managing-labels/labels.json) に以下のチーム別ラベルが定義されています。

| ラベル名 | 説明 |
|----------|------|
| Overall | 全体リーダーチームに関するタスク |
| Arrangement | アレンジメントチームに関するタスク |
| BB | BBチームに関するタスク |
| SV | SVチームに関するタスク |
| L2L3_P | L2L3_Pチームに関するタスク |
| L2L3_G | L2L3_Gチームに関するタスク |
| AP_P | AP_Pチームに関するタスク |
| AP_G | AP_Gチームに関するタスク |
| CB_P | CB_Pチームに関するタスク |
| CB_G | CB_Gチームに関するタスク |

### ラベルの一括作成手順

#### 1. GitHub CLI をインストール

```bash
brew install gh
```

参考: https://github.com/cli/cli#installation

#### 2. GitHub CLI にログイン

```bash
gh auth login
```

参考: https://cli.github.com/manual/gh_auth_login

#### 3. ラベルを追加

追加したいラベルの名前・色・説明を [labels.json](managing-labels/labels.json) に記入し、対象リポジトリ名を引数にしてスクリプトを実行します。

```bash
cd managing-labels
bash create-labels.sh <リポジトリ名>
# 例: bash create-labels.sh overall
```

スクリプトは `J59NOC/<リポジトリ名>` に対して GitHub CLI の `gh label create` を実行します。
