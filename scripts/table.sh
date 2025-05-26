#!/bin/bash

RESULT="$1"         # ユーザの得点
MAX="$2"            # 最大得点

EXIT_STATUS="0"     # 終了ステータス
COLOR="31"          # 標準出力の色

if [ "$#" -ne "2" ] && [ "$#" -ne "3" ]; then
    echo "引数が違います."
    echo "$(basename "$0") < 得点 > < 最大得点 > < 失敗時の終了ステータス (デフォルトは 0) >"
fi

if [ "$#" -eq "3" ]; then
    EXIT_STATUS="$3"
fi

if [ "$RESULT" = "$MAX" ]; then
    EXIT_STATUS="0"
    COLOR="32"
fi

output="${RESULT} / ${MAX}"

TITLE=" RESULT "
TITLE_LENGTH="${#TITLE}"
n="10"

if [ "10" -lt "${#output}" ]; then
    n="$((${#output} + 2))"
fi
space="$((($n * 2 + $TITLE_LENGTH - ${#output}) / 2))"
pre_space="$space"
if [ "$((($n * 2 + $TITLE_LENGTH - ${#output}) % 2))" -ne "0" ]; then
    pre_space="$(($pre_space + 1))" # スペースの総数が奇数である場合, 前のスペースを +1 する
fi
post_space="$space"
output="\033[0;${COLOR}m${RESULT}\033[0;39m / ${MAX}"

echo -e "#$(printf "%${n}s\n" | tr " " "=")${TITLE}$(printf "%${n}s\n" | tr " " "=")#"
echo -e "#$(printf "%$(($n * 2 + $TITLE_LENGTH))s\n")#"
echo -e "#$(printf "%${pre_space}s\n")${output}$(printf "%${post_space}s\n")#"
echo -e "#$(printf "%$(($n * 2 + $TITLE_LENGTH))s\n")#"
echo -e "#$(printf "%$(($n * 2 + $TITLE_LENGTH))s\n" | tr " " "=")#"
echo -e ""

exit "$EXIT_STATUS"