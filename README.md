# アルゴリズム講習会

## 目次
- [アルゴリズム講習会](#アルゴリズム講習会)
  - [目次](#目次)
  - [目的](#目的)
  - [日程](#日程)
  - [使用可能な言語](#使用可能な言語)
  - [参加者](#参加者)
  - [講習会の流れ](#講習会の流れ)
    - [GitHub への提出方法](#github-への提出方法)
  - [ToDo リスト (出題者)](#todo-リスト-出題者)
    - [リポジトリを複製 (していない場合のみ)](#リポジトリを複製-していない場合のみ)
    - [ユーザ登録 (初回参加時のみ)](#ユーザ登録-初回参加時のみ)
    - [テンプレートを作成](#テンプレートを作成)
    - [問題を作成](#問題を作成)
      - [問題の参考になりそうなサイト](#問題の参考になりそうなサイト)
    - [問題の解答を作成](#問題の解答を作成)
    - [入力ケース \& 出力ケースの作成](#入力ケース--出力ケースの作成)
    - [GitHub への更新](#github-への更新)
  - [ToDo リスト (参加者)](#todo-リスト-参加者)
    - [リポジトリを Clone する (していない場合のみ)](#リポジトリを-clone-する-していない場合のみ)
    - [ユーザ登録 (初回参加時のみ)](#ユーザ登録-初回参加時のみ-1)
    - [使用言語を変更する場合 (必要な人のみ)](#使用言語を変更する場合-必要な人のみ)
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
    <th>yyyy / mm / dd (曜日)</th>
    <th>GitHub ユーザ名</th>
  </tr>
</table>

## 使用可能な言語
- C
- C++
- Python
- Java

※ 2025/5/18 現在

## 参加者
- [fumito100111](https://github.com/fumito100111)

## 講習会の流れ
1. 出題者による問題についての説明.
2. 問題の難易度により制限時間を決め, それぞれ問題を解く.
3. 時間になったら, それぞれ GitHub に提出する.
4. 全員提出が完了したら, 出題者による問題 & 解答例コードの解説
5. 分からないところやより良くできるところ (コードの効率化など)があれば議論する.

### GitHub への提出方法
```zsh
sh ./submit.sh
```

## ToDo リスト (出題者)
### リポジトリを複製 (していない場合のみ)
```zsh
git clone https://github.com/fumito100111/algorithm-seminar.git
```

### ユーザ登録 (初回参加時のみ)
```zsh
cd algorithm-seminar
make add_user USER=< GitHub のユーザ名> LANGUAGE=< 使用する言語の拡張子 >
sh ./update.sh
```

### テンプレートを作成
```zsh
make create_template DATE=< 開催する日付 (yyyymmdd) > NUM=< 問題の数 >

例 2025/1/1 (問題数 3) の場合)
    make create_template DATE=20250101 NUM=3
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
yyyymmdd/.tests/inputs の中に入力ケースの空ファイルが作成されている. (デフォルトは 5つのテストケースが用意されている)

同様に, yyyymmdd/.tests/outputs の中に出力ケースの空ファイルが作成されている.

実際に, 入力ケース & 出力ケースを作成し, txtファイルに書き込む.

> [!TIP]
> 問題に入力ケース & 出力ケースがある場合, それを使用することをお勧めする. (足りない場合は適宜作成する)

### GitHub への更新
```zsh
sh ./update.sh
```

## ToDo リスト (参加者)
### リポジトリを Clone する (していない場合のみ)
```zsh
git clone https://github.com/fumito100111/algorithm-seminar.git
```

### ユーザ登録 (初回参加時のみ)
```zsh
cd algorithm-seminar
make add_user USER=< GitHub のユーザ名> LANGUAGE=< 使用する言語の拡張子 >
sh ./update.sh
```

### 使用言語を変更する場合 (必要な人のみ)
```zsh
make delete_user USER=< GitHub のユーザ名>
make add_user USER=< GitHub のユーザ名> LANGUAGE=< 使用する言語 (変更後) の拡張子 >
sh ./update.sh
```

## 禁止事項
- ChatGPT や GitHub Copilot などの生成AIをコーディングに用いること.

> [!IMPORTANT]
> ただし, Web サイトで検索することは OK
