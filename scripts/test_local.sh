#!/bin/zsh

#========== 引数チェック ==========#

# < 引数の数があっているかどうかの判定 >

if [ "$#" -ne "2" ]; then
    echo "引数の数が違います."
    echo "$(basename "$0") < 日付 > < 課題番号 (全ての場合: ALL) >"
    exit 1
fi

# < 日付が有効であるかどうかの判定 >

# ----- 数字のみであるかどうか -----
if [[ ! "$1" =~ "[0-9]+" ]]; then
    echo "日付は数字のみ有効です."
    exit 1
fi

# ----- 文字数があっているかどうか -----
if [ "${#1}" -ne "8" ]; then
    echo "日付は 'yyyymmdd' の形で入力してください."
    exit 1
fi

YEAR="${1:0:4}"
MONTH="${1:4:2}"
DAY="${1:6:2}"

# ----- うるう年であるかどうか -----
is_leap_year="0"        # うるう年である場合: 1, ない場合: 0
if [ "$(($YEAR % 4))" -eq "0" ] && { [ "$(($YEAR % 100))" -ne "0" ] || [ "$(($YEAR % 400))" -eq "0" ] }; then
    is_leap_year="1"
fi

# ----- 月があるかどうか -----
if [ "$MONTH" -lt "1" ] || [ "12" -lt "$MONTH" ]; then
    echo "月は 1 ~ 12 の間です."
    exit 1
fi

# ----- 日があるかどうか -----
is_day="0"              # 日がある場合: 1, ない場合: 0
if [ "$MONTH" -eq "2" ]; then
    if [ "$is_leap_year" -eq "1" ] && [ "1" -le "$DAY" ] && [ "$DAY" -le "29" ]; then
        is_day="1"

    elif [ "$is_leap_year" -ne "1" ] && [ "1" -le "$DAY" ] && [ "$DAY" -le "28" ]; then
        is_day="1"
    fi

elif [ "$MONTH" -eq "4" ] || [ "$MONTH" -eq "6" ] || [ "$MONTH" -eq "9" ] || [ "$MONTH" -eq "11" ]; then
    if [ "1" -le "$DAY" ] && [ "$DAY" -le "30" ]; then
        is_day="1"
    fi

else
    if [ "1" -le "$DAY" ] && [ "$DAY" -le "31" ]; then
        is_day="1"
    fi
fi

if [ "$is_day" -ne "1" ]; then
    echo "${YEAR}/${MONTH}/${DAY} は存在しません."
    exit 1
fi


#========== 必要な環境変数 ==========#

DATE="$1"                                                                                               # 日付
ASSIGNMENT="$2"                                                                                         # 課題番号 or 'ALL'
CURRENT_DIR="$(pwd)"                                                                                    # 現在のディレクトリ
ASSIGNMENTS="$(find "${CURRENT_DIR}/${DATE}/tests" -type d -name "Q*" | wc -l | tr -d " ")"             # 課題の総数
GITHUB_USERNAME="$(git config user.name)"                                                               # GitHub ユーザ名

status_list=""   # 課題ごとの終了ステータスを保存する文字列 (reporter.sh 用) [ 成功: success, 失敗: failure ]
for idx in $(seq 1 $ASSIGNMENTS)
do
    if [ "$ASSIGNMENT" = "ALL" ] || [ "$idx" -eq "$ASSIGNMENT" ]; then
        "${CURRENT_DIR}/${DATE}/tests/Q${idx}/test.sh" "$GITHUB_USERNAME"
        if [ "$?" -eq "0" ]; then
            status_list+="success"
        else
            status_list+="failure"
        fi
        # 最後以外はスペースを追加
        if [ "$idx" -ne "$ASSIGNMENTS" ]; then
            status_list+=" "
        fi
    fi
done