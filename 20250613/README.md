# アルゴリズム勉強会
## 開催日時
### 2025 / 06 / 13: 13:00 ~

## 参加者
### 出題者
- [kimotu4632uz](kimotu4632uz/)

### 回答者
- [fumito100111](fumito100111)
- [skyamat0](skyamat0)
- [18TI021](18TI021)
- [ichiro0709](ichiro0709)
- [buraito](buraito)
- [Sano-Teppei](Sano-Teppei)
- [arsk0202](arsk0202)
- [yushin-H](yushin-H)
- [Seiya-hub2003](Seiya-hub2003)

## 問題
- 課題1 : [C - Skill Up](https://atcoder.jp/contests/abc167/tasks/abc167_c)
- 課題2 : [C - Snuke Festival](https://atcoder.jp/contests/abc077/tasks/arc084_a)
- 課題3 : [D - Grid Repainting](https://atcoder.jp/contests/abc088/tasks/abc088_d)

> [!TIP]
> 標準入力の方法が分からない場合, [Qiita (AtCoder+標準入力)](https://qiita.com/search?q=AtCoder+%E6%A8%99%E6%BA%96%E5%85%A5%E5%8A%9B) を参考になる.

## ローカル環境でのテスト方法
```zsh
make test DATE=< 課題の日付: デフォルトは今日 > ASSIGNMENT=< 課題番号 (全ての場合: ALL): デフォルトは ALL >

例) 課題の当日に全ての課題に関してテストを行う場合
    make test

例) 課題の当日に課題 1 だけテストを行う場合
    make test ASSIGNMENT=1
```

## 提出方法
```zsh
make submit
```

## 採点結果の確認方法
#### [GitHub Actions](https://github.com/fumito100111/algorithm-seminar/actions/) から提出した課題の採点結果を確認できる.

### GitHub Actions の確認方法
<img src="../assets/images/How-To-Use-GitHub-Actions-1.png" width="800" align="center">

1. [GitHub Actions](https://github.com/fumito100111/algorithm-seminar/actions/) を開く
2. 最新の Workflow「 Algorithm-Seminar-2025-06-13 (自分のユーザ名) 」を開く

<img src="../assets/images/How-To-Use-GitHub-Actions-2.png" width="800" align="center">

3. 採点結果の詳細を確認する場合は「 Algorithm-Seminar-2025-06-13 」を開く

> [!TIP]
> 全ての課題が正解の場合, Status が Success になる.

<img src="../assets/images/How-To-Use-GitHub-Actions-3.png" width="800" align="center">

4. それぞれの課題の実行結果を確認する場合は「 Test < 課題番号 > 」を開く

<img src="../assets/images/How-To-Use-GitHub-Actions-4.png" width="800" align="center">

5. それぞれの課題のテストケースごとに入出力や正解, 実行エラーの詳細などを確認できる

<img src="../assets/images/How-To-Use-GitHub-Actions-5.png" width="800" align="center">

6. 全ての課題の正解 or 不正解を確認する場合は「 Report Algorithm-Seminar-2025-06-13 」を開く

<img src="../assets/images/How-To-Use-GitHub-Actions-6.png" width="800" align="center">

7. 全ての課題の採点結果を確認できる


## 注意点
- 勉強会の目的のため, それぞれの言語の原則として標準ライブラリのみを使用すること.
- その他サイトから問題を持ってくる場合, 権利関連に注意すること.
- また, コンテストサイトなどから持ってくる場合, 開催中のコンテストからは持ってこないこと.
- 問題を解く際, ChatGPT や GitHub Copilot などの生成AI をコーディングに使用ないこと. (ただし, Web サイトで検索することは OK)