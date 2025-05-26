#!/bin/zsh

#========== 引数チェック ==========#

# < 引数の数があっているかどうかの判定 >

if [ "$#" -ne "2" ]; then
    echo "引数の数が違います."
    echo "$(basename "$0") < 作成する日付 > < 課題の総数 >"
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

# < 課題の総数が自然数であるかどうかの判定 >
if [[ ! "$2" =~ "^[1-9][0-9]*$" ]]; then
    echo "課題の総数は 1 以上の数字を入力してください."
    exit 1
fi

#========== 必要な環境変数 ==========#

DATE="$1"                                                               # 作成する日付
ASSIGNMENTS="$2"                                                        # 課題の総数
TEST_CASES="5"                                                          # テストケースの数
CURRENT_DIR="$(pwd)"                                                    # 現在のディレクトリ
TEMPLATES_DIR="${CURRENT_DIR}/templates"                                # テンプレートのあるディレクトリ
ASSIGNMENTS_DIR="${CURRENT_DIR}/${DATE}"                                # 課題を作成するディレクトリ
TESTS_DIR="${ASSIGNMENTS_DIR}/tests"                                    # 課題のテストディレクトリ
GITHUB_ACTIONS_PATH="${CURRENT_DIR}/.github/workflows/actions.yml"      # GitHub Actions の actions.yml ファイルのパス
INFO_FILE_PATH="${CURRENT_DIR}/info.json"                               # info.json ファイルのパス


#========== ユーザごとのディレクトリ作成 ==========#

# < 登録済みの GitHub ユーザ名 & 使用言語を取得 >
API="${CURRENT_DIR}/scripts/api"
GITHUB_USERNAMES=($(python3 "${API}/users.py" "${CURRENT_DIR}/info.json" "keys"))
LANGUAGE_EXT_LIST=($(python3 "${API}/users.py" "${CURRENT_DIR}/info.json" "values"))

value=($(python3 "${API}/users.py" "${CURRENT_DIR}/info.json" "keys"))

if [ "${#GITHUB_USERNAMES[@]}" -ne "${#LANGUAGE_EXT_LIST[@]}" ]; then
    echo "登録されているユーザと使用言語の数が違います."
    echo "info.json ファイルを確認してください."
    exit 1
fi

#----- zsh の配列は 1から始まるのに注意 -----
for idx in $(seq 1 ${#GITHUB_USERNAMES[@]})
do
    username="${GITHUB_USERNAMES[$idx]}"
    ext="${LANGUAGE_EXT_LIST[$idx]}"
    #----- ユーザのディレクトリを作成 -----
    mkdir -p "${ASSIGNMENTS_DIR}/${username}"

    #----- 使用言語のテンプレートを複製 -----#
    for assignment in $(seq 1 $ASSIGNMENTS)
    do
        assignment_dir="${ASSIGNMENTS_DIR}/${username}/Q${assignment}"
        mkdir -p "$assignment_dir"
        cp "${TEMPLATES_DIR}/Main.${ext}" "${assignment_dir}/Main.${ext}"

    done

done


#========== テストケースの作成 ==========#

\cp -f "${TEMPLATES_DIR}/actions.yml" "$GITHUB_ACTIONS_PATH"

run_command=""
for assignment in $(seq 1 $ASSIGNMENTS)
do
    #----- 課題ごとに入力・出力ケースを作成 -----
    assignment_dir="${TESTS_DIR}/Q${assignment}"
    mkdir -p "$assignment_dir"
    assignment_inputs_dir="${assignment_dir}/inputs"
    mkdir -p "$assignment_inputs_dir"
    assignment_outputs_dir="${assignment_dir}/outputs"
    mkdir -p "$assignment_outputs_dir"
    for case in $(seq 1 $TEST_CASES)
    do
        touch "${assignment_inputs_dir}/CASE${case}.txt"
        touch "${assignment_outputs_dir}/CASE${case}.txt"
    done

    #----- テストを行うコマンドを作成 (actions.yml 用) -----
    run_command="${run_command}\n      - name: Test ${assignment}\n"
    run_command="${run_command}        id: test${assignment}\n"
    run_command="${run_command}        env:\n"
    run_command="${run_command}          TZ: \"Asia/Tokyo\"\n"
    run_command="${run_command}        run: |\n"
    run_command="${run_command}          ${assignment_dir/$CURRENT_DIR/.}/test.sh \${{ github.actor }}\n"
    run_command="${run_command}        timeout-minutes: 5\n"
    run_command="${run_command}        continue-on-error: true\n"

    #-----  -----
    cp "${TEMPLATES_DIR}/test.sh" "${assignment_dir}/test.sh"
    chmod +x "${assignment_dir}/test.sh"
    git update-index --add --chmod=+x "${assignment_dir}/test.sh"
    sed -i "" "s;<-----DATE----->;${DATE};g" "${assignment_dir}/test.sh"
    sed -i "" "s;<-----ASSIGNMENT----->;${assignment};g" "${assignment_dir}/test.sh"
    sed -i "" "s;<-----TEST_CASES----->;${TEST_CASES};g" "${assignment_dir}/test.sh"

done

#----- 採点結果のレポートを表示するためのコマンドを作成 (actions.yml 用) -----

outcome_list=""
for assignment in $(seq 1 $ASSIGNMENTS)
do
    if [ "$assignment" -eq "$ASSIGNMENTS" ]; then
        outcome_list="${outcome_list}\${{ steps.test${assignment}.outcome }}"  # 最後のみ後ろにスペースをつけない
    else
        outcome_list="${outcome_list}\${{ steps.test${assignment}.outcome }} "
    fi
done
run_command+="\n"
run_command+="      - name: Report Algorithm-Seminar-${YEAR}-${MONTH}-${DAY}\n"
run_command+="        env:\n"
run_command+="          TZ: \"Asia/Tokyo\"\n"
run_command+="        run: |\n"
run_command+="          ./scripts/reporter.sh ${outcome_list}\n"

echo "$run_command" >> "$GITHUB_ACTIONS_PATH"
JOBS="Algorithm-Seminar-${YEAR}-${MONTH}-${DAY}"
sed -i "" "s;<-----JOBS----->;${JOBS};g" "$GITHUB_ACTIONS_PATH"
sed -i "" "s;<-----DATE----->;${DATE};g" "$GITHUB_ACTIONS_PATH"
sed -i "" "s;<-----COMMIT_MESSAGE----->;${JOBS};g" "$GITHUB_ACTIONS_PATH"


#========== 課題用 README.md の更新 ==========#

cp "${TEMPLATES_DIR}/README.md" "${ASSIGNMENTS_DIR}/README.md"
sed -i "" "s;<-----DATE_TRANSFORMED----->;${YEAR} / ${MONTH} / ${DAY};g" "${ASSIGNMENTS_DIR}/README.md"


CREATOR="$(git config user.name)"
participants=""
for username in "${GITHUB_USERNAMES[@]}"
do
    if [ "$username" != "$CREATOR" ]; then
        participants+="- [${username}](${username})\n"
    fi
done

sed -i "" "s;<-----CREATOR----->;- [${CREATOR}](${CREATOR}/);g" "${ASSIGNMENTS_DIR}/README.md"
sed -i "" "s;<-----PARTICIPANTS----->;${participants};g" "${ASSIGNMENTS_DIR}/README.md"
sed -i "" "s;<-----ASSIGNMENTS----->;${ASSIGNMENTS};g" "${ASSIGNMENTS_DIR}/README.md"


#========== 作成が完了したメッセージ ==========#

echo "Created ./${DATE}/**/*"