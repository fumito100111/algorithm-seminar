#!/bin/bash

#========== 引数チェック ==========#

# < 引数の数があっているかどうかの判定 >

if [ "$#" -ne "1" ]; then
    echo "引数の数が違います."
    echo "$(basename "$0") < GitHub ユーザ名>"
    exit 1
fi

#========== 必要な環境変数 ==========#

# < 以下はテンプレート作成時に置き換えられる >
# 日付
DATE="20250627"
# 課題番号
ASSIGNMENT="1"
# テストケースの数
TEST_CASES="5"

# < 以下はテスト実行時に定義される >
GITHUB_USERNAME="$1"                                                                        # 実行者の GitHub ユーザ名
CURRENT_DIR="$(pwd)"                                                                        # 現在のディレクトリ (リポジトリのディレクトリであることを想定)
ASSIGNMENTS_DIR="${CURRENT_DIR}/${DATE}"                                                    # 課題を作成するディレクトリ
RUN_SCRIPT="${CURRENT_DIR}/scripts/run.sh"                                                  # 実行用スクリプト
FILE="$(ls -AU "${ASSIGNMENTS_DIR}/${GITHUB_USERNAME}/Q${ASSIGNMENT}" | grep "Main.*")"
FILE="${ASSIGNMENTS_DIR}/${GITHUB_USERNAME}/Q${ASSIGNMENT}/${FILE}"                          # テストを行うファイル


#========== テストコード ==========#

echo -e "\n#=============== 課題 ${ASSIGNMENT} ===============#\n"

result=""

for case in $(seq 1 $TEST_CASES)
do
    input="$(cat "${ASSIGNMENTS_DIR}/tests/Q${ASSIGNMENT}/inputs/CASE${case}.txt")"
    answer="$(cat "${ASSIGNMENTS_DIR}/tests/Q${ASSIGNMENT}/outputs/CASE${case}.txt")"

    echo -e "\n<=== 実行時間 ===>\n"
    stdout="./temporary_stdout.txt"
    stderr="./temporary_stderr.txt"

    time -p {
        $RUN_SCRIPT "${FILE}" "${ASSIGNMENTS_DIR}/tests/Q${ASSIGNMENT}/inputs/CASE${case}.txt" 1> "$stdout" 2> "$stderr"
        status="$?"
    }
    sleep 0.01
    output="$(cat "$stdout")"
    echo -e ""

    if [ "${status}" -ne 0 ]; then
        echo -e "\033[0;31m< エラーメッセージ >\033[0;39m"
        echo -e "$(cat "$stderr")\n"
    fi
    # 入力, 出力, 正解の表示
    echo -e "< 入力 >\n\n${input}\n"
    if [ "${status}" -eq 0 ]; then
        echo -e "< 出力 >\n\n${output}\n"
    else
        echo -e "< 出力 >\n"
    fi
    echo -e "< 正解 >\n\n${answer}\n"

#    input="$(echo -e "${input}" | tr -d "\n\t")"
#    input="${input//" "/","}"
    answer="$(echo -e "${answer}" | tr -d "\n\t")"
    answer="${answer//" "/","}"
    # 実行自体は成功した場合
    if [ "${status}" -eq 0 ]; then
        output="$(echo -e "${output}" | tr -d "\n\t")"
        output="${output//" "/","}"
        # 正解の場合
        if [ "$output" == "$answer" ]; then
            result="${result}${case}"
            echo -e "\n\033[0;32m#===== テストケース ${case}: < 正解 > =====#\033[0;39m\n"

        # 不正解の場合
        else
            result="${result}0"
            echo -e "\n\033[0;31m#===== テストケース ${case}: < 不正解 > =====#\033[0;39m\n"
        fi

    # 実行自体が失敗した場合
    else
        result="${result}0"
        echo -e "\n\033[0;31m#===== テストケース ${case}: < ${output} > =====#\033[0;39m\n"
    fi
    rm -rf "$stdout" "$stderr"
done

echo -e "\n#=============== 結果 ===============#\n"
MAX="$(seq -s" " 1 $TEST_CASES | tr -d " ")"

"${CURRENT_DIR}/scripts/table.sh" "$result" "$MAX" "1"