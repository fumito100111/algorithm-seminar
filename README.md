# アルゴリズム勉強会

## 目次
- [アルゴリズム勉強会](#アルゴリズム勉強会)
  - [目次](#目次)
  - [目的](#目的)
  - [日程](#日程)
  - [対応言語](#対応言語)
  - [参加者](#参加者)
  - [講習会の流れ](#講習会の流れ)
  - [ToDo リスト (初回参加者 or ユーザ情報を変更したい方)](#todo-リスト-初回参加者-or-ユーザ情報を変更したい方)
    - [リポジトリを複製 (していない場合のみ)](#リポジトリを複製-していない場合のみ)
    - [git config user.name の設定](#git-config-username-の設定)
      - [もし, 設定されていない場合や違う名前の場合, 以下のコマンドで変更する.](#もし-設定されていない場合や違う名前の場合-以下のコマンドで変更する)
    - [ユーザ情報の登録 (初回参加時のみ)](#ユーザ情報の登録-初回参加時のみ)
    - [ユーザ情報の変更](#ユーザ情報の変更)
    - [ユーザ情報の削除](#ユーザ情報の削除)
  - [ToDo リスト (出題者)](#todo-リスト-出題者)
    - [テンプレートを作成](#テンプレートを作成)
    - [問題を作成](#問題を作成)
      - [問題の参考になりそうなサイト](#問題の参考になりそうなサイト)
    - [問題の解答を作成](#問題の解答を作成)
    - [入力ケース \& 出力ケースの作成](#入力ケース--出力ケースの作成)
    - [課題テンプレートの GitHub への更新](#課題テンプレートの-github-への更新)
  - [ToDo リスト (参加者)](#todo-リスト-参加者)
  - [禁止事項](#禁止事項)

## 目的
- コーディングの技術を高めたい.
- アルゴリズムを考える力をつけたい.
- 使用できる言語を増やしたい.

## 日程
<table align="center" border="1" width="400">
  <tr>
    <th>開催日時</th>
    <th>作成者</th>
  </tr>
  <tr>
    <th>2025 / 05 / 30 (金)</th>
    <th>fumito100111</th>
  </tr>
  <tr>
    <th>2025 / 06 / 06 (金)</th>
    <th>skyamat0</th>
  </tr>
  <tr>
    <th>2025 / 06 / 13 (金)</th>
    <th>kimotu4632uz</th>
  </tr>
  <tr>
    <th>2025 / 06 / 20 (金)</th>
    <th>fumito100111</th>
  </tr>
</table>

## 対応言語
- C
- C++
- Python
- Java
- Rust
- Ruby
- Go

※ 2025/5/30 現在

## 参加者
- [fumito100111](https://github.com/fumito100111)
- [skyamat0](https://github.com/skyamat0)
- [18TI021](https://github.com/18TI021)
- [kimotu4632uz](https://github.com/kimotu4632uz)
- [ichiro0709](https://github.com/ichiro0709)
- [buraito](https://github.com/buraito)
- [Sano-Teppei](https://github.com/Sano-Teppei)
- [arsk0202](https://github.com/arsk0202)
- [yushin-H](https://github.com/yushin-H)
- [Seiya-hub2003](https://github.com/Seiya-hub2003)

## 講習会の流れ
1. 出題者による問題についての説明.
2. 問題の難易度により制限時間を決め, それぞれ問題を解く.
3. 時間になったら, それぞれ GitHub に提出する.
4. 全員提出が完了したら, 出題者による問題 & 解答例コードの解説
5. 分からないところやより良くできるところ (コードの効率化など)があれば議論する.

## ToDo リスト (初回参加者 or ユーザ情報を変更したい方)
### リポジトリを複製 (していない場合のみ)
```zsh
git clone https://github.com/fumito100111/algorithm-seminar.git
cd algorithm-seminar (以降のコマンドはこのディレクトリをカレントディレクトリとする.)
```

### git config user.name の設定
```zsh
git config user.name

例) Github アカウントの識別名が fumito100111 の場合, 以下のように出力される.
    fumito100111
```

#### もし, 設定されていない場合や違う名前の場合, 以下のコマンドで変更する.
```zsh
git config --global user.name '<Github アカウントの識別名>'

例) Github アカウントの識別名が fumito100111 の場合
    git config --global user.name 'fumito100111'
```
> [!TIP]
> ```git config user.name``` で Github アカウントの識別名に変更されていることを確認する.

### ユーザ情報の登録 (初回参加時のみ)
```zsh
make add_user USER=< GitHub ユーザ名: デフォルトは自分のユーザ名 > EXT=< 使用言語の拡張子: デフォルトは Python >

例) 使用言語は C, 自分を追加する場合
    make add_user EXT="c"
```
> [!TIP]
> 登録されているユーザは ```make users_list``` コマンドで確認できる.

### ユーザ情報の変更
```zsh
make update_user USER=< GitHub ユーザ名: デフォルトは自分のユーザ名 > EXT=< 使用言語の拡張子: デフォルトは Python >

例) 自分の使用言語を C に変更する場合
    make update_user EXT="c"
```

### ユーザ情報の削除
```zsh
make delete_user USER=< GitHub ユーザ名: デフォルトは自分のユーザ名 >

例) 自分の情報を削除する場合
    make delete_user
```

## ToDo リスト (出題者)
ユーザ登録が終了していない場合や登録済みのユーザ情報を変更したい場合は,
[ToDo リスト (初回参加者 or ユーザ情報を変更したい方)](#todo-リスト-初回参加者-or-ユーザ情報を変更したい方) を参考に設定を行う.

### テンプレートを作成
```zsh
make create_template DATE=< 開催する日付 (yyyymmdd): デフォルトは今日の日付 > ASSIGNMENTS=< 課題の総数: デフォルトは 5>

例 2025/1/1 (問題数 5) の場合)
    make create_template DATE=20250101
```

### 問題を作成
問題を探し, 先ほど作成した yyyymmdd/README.md を更新する.

#### 問題の参考になりそうなサイト
- [AtCoder.jp](https://atcoder.jp/?lang=ja)
- [AtCoder.jp 過去のコンテスト](https://atcoder.jp/contests/archive?lang=ja)
- [AIZU ONLINE JUDGE](https://judge.u-aizu.ac.jp/onlinejudge/)

### 問題の解答を作成
実際に問題を解き, 解答例を作成する.

> [!IMPORTANT]
> アルゴリズム講習会までにどうしても分からない場合は模範解答を参考にしても良い.

### 入力ケース & 出力ケースの作成
yyyymmdd/tests/Q*/inputs の中に入力ケースの空ファイルが作成されている. (デフォルトは 課題ごとに5つのテストケースが用意されている)

同様に, yyyymmdd/tests/Q*/outputs/ の中に出力ケースの空ファイルが作成されている.

実際に, 入力ケース & 出力ケースを作成し, txtファイルに書き込む.

> [!TIP]
> 問題に入力ケース & 出力ケースがある場合, それを使用することをお勧めする. (足りない場合は適宜作成する)

> [!TIP]
> ```make create_answer DATE=< 開催する日付 (yyyymmdd): デフォルトは今日の日付 >``` コマンドで, 入力ケースから出力ケースを作成する. (./yyyymmdd/作成者/* にあるスクリプトの出力結果を正解として書き出す)

> [!IMPORTANT]
> ```make create_answer``` コマンドは, 自分の回答が正解であることを確認してから使用してください.

### 課題テンプレートの GitHub への更新
```zsh
make update_template DATE=< 開催する日付 (yyyymmdd): デフォルトは今日の日付 >

例 2025/1/1 (問題数 5) の場合)
    make update_template DATE=20250101
```

> [!TIP]
> ```make delete_template DATE=< 開催する日付 (yyyymmdd): デフォルトは今日の日付 >``` コマンドで作成した課題を削除できる. (課題作成コマンドで失敗した場合などに使用できる)

## ToDo リスト (参加者)
ユーザ登録が終了していない場合や登録済みのユーザ情報を変更したい場合は,
[ToDo リスト (初回参加者 or ユーザ情報を変更したい方)](#todo-リスト-初回参加者-or-ユーザ情報を変更したい方) を参考に設定を行う.

## 禁止事項
- ChatGPT や GitHub Copilot などの生成AIをコーディングに用いること.

> [!IMPORTANT]
> ただし, Web サイトで検索することは OK
