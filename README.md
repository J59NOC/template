> **このREADMEの内容は削除の上使用してください**

# J59NOC リポジトリテンプレート

J59NOCメンバが新しくリポジトリを作成する際に使用できるテンプレートです。

## リポジトリ作成方法

1. GitHub の [J59NOC/template](https://github.com/J59NOC/template) リポジトリを開きます。
2. 右上の **Use this template** をクリックします。
3. 作成するリポジトリのオーナー、名前、公開設定を入力します。
4. **Create repository** をクリックしてリポジトリを作成します。
5. 作成したリポジトリを対象に、下記の要領で設定してください。
- チームの設定
6. README.md をリポジトリに合わせて変更してください。

## GitHub CLI の準備

### GitHub CLI をインストール

```bash
brew install gh
```

参考: https://github.com/cli/cli#installation

### GitHub CLI にログイン

```bash
gh auth login
```

参考: https://cli.github.com/manual/gh_auth_login

## j59noc チームの追加

Private リポジトリを作成した場合は、チームを追加しないと誰も見ることができません。
リポジトリに `J59NOC/j59noc` チームを追加するやり方はこちらです。
このスクリプトで追加されるチームのリポジトリ権限は `Maintain` です。

### チームの追加

リポジトリ名を指定してスクリプトを実行します。

```bash
./add-j59noc-team.sh <リポジトリ名>
# 例: ./add-j59noc-team.sh template
```

- 確認方法

```bash
gh api \
	"/repos/J59NOC/<リポジトリ名>/teams" \
	--jq '.[] | select(.slug == "j59noc") | {team: .slug, permission: .permission}'
```

## issueテンプレート

issue 作成の時に使うテンプレートが [.github/ISSUE_TEMPLATE](.github/ISSUE_TEMPLATE) に定義されています

### テンプレート内容

| パス | 説明 |
|------|------|
| [.github/ISSUE_TEMPLATE/default.md](.github/ISSUE_TEMPLATE/default.md) | イシューのデフォルトテンプレート |
| [.github/ISSUE_TEMPLATE/config.yml](.github/ISSUE_TEMPLATE/config.yml) | ブランクイシューを非表示にする設定 |
