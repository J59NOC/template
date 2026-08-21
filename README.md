> **このREADMEの内容は削除の上使用してください**

# J59NOC リポジトリテンプレート

J59NOCメンバが新しくリポジトリを作成する際に使用できるテンプレートです。

## リポジトリ作成方法

1. GitHub の [J59NOC/template](https://github.com/J59NOC/template) リポジトリを開きます。
2. 右上の **Use this template** をクリックします。
3. 作成するリポジトリのオーナー、名前、公開設定を入力します。
4. **Create repository** をクリックしてリポジトリを作成します。
5. 作成したリポジトリを対象に、下記の要領で設定してください。
- ラベルの設定
- チームの設定
6. README.md をリポジトリに合わせて変更してください。

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

## j59noc チームの追加

Private リポジトリを作成した場合は、チームを追加しないと誰も見ることができません。
`J59NOC/j59noc` チームを追加するやり方はこちらです。
このスクリプトで追加されるチームのリポジトリ権限は `Maintain` です。

### GitHub CLI で追加する方法

GitHub CLI にログインし、リポジトリ名を指定してスクリプトを実行します。

```bash
gh auth login
./add-j59noc-team.sh <リポジトリ名>
# 例: ./add-j59noc-team.sh template
```

- 確認方法

```bash
gh api \
	"/repos/J59NOC/<リポジトリ名>/teams" \
	--jq '.[] | select(.slug == "j59noc") | {team: .slug, permission: .permission}'
```

## テンプレート内容

| パス | 説明 |
|------|------|
| [.github/ISSUE_TEMPLATE/default.md](.github/ISSUE_TEMPLATE/default.md) | イシューのデフォルトテンプレート |
| [.github/ISSUE_TEMPLATE/config.yml](.github/ISSUE_TEMPLATE/config.yml) | ブランクイシューを非表示にする設定 |
| [managing-labels/labels.json](managing-labels/labels.json) | 登録するラベルの定義ファイル |
| [managing-labels/create-labels.sh](managing-labels/create-labels.sh) | ラベルを一括作成するシェルスクリプト |
| [add-j59noc-team.sh](add-j59noc-team.sh) | `j59noc` チームを追加するシェルスクリプト |

## イシューテンプレート

`.github/ISSUE_TEMPLATE/default.md` に以下のセクションが定義されています。

- **概要/Overview** (必須)
- **完了条件/Completion condition** (必須) — チェックリスト形式
- **関連リンク/link** — Slack リンクなど
- **やらないこと** — スコープ外の明示
