#!bin/sh

# 引数から実行するファイル名を取得する (引数0: 実行中のスクリプト名, 引数1: カレントディレクトリ, 引数2: ユーザ名, 引数3: テストするディレクトリの日付, 引数4: 課題番号 (全ては all))
CURRENT_DIR=$1
USER_NAME=$2
DATE=$3
QUESTION=$4
SUPPORTED_EXTENSIONS=("c" "cpp" "py" "java")

TEST_CASES=$(ls -1U $CURRENT_DIR$DATE/.tests/inputs/Q1/*.txt | wc -l)
NUM=$(find $CURRENT_DIR$DATE/.tests/inputs/Q? -type d | wc -l)

echo "----- $USER_NAME ($DATE) -----\n"

if [ "$QUESTION" == "all" ]; then
    for idx in $(seq 1 $NUM)
    do
        echo "\n#-----課題 ${idx}------#\n"
        SCORE=0
        SCORE_STRING=""
    
        FILES=$(ls $DATE/$USER_NAME/Q$idx/Main.*)
        FILES=($FILES)
        for file in "${FILES[@]}"
        do
            if printf '%s\n' "${SUPPORTED_EXTENSIONS[@]}" | grep -qx ${file##*.}; then
                FILE=$CURRENT_DIR$file
                break
            fi
        done
        if [ -z $FILE ]; then
            echo "拡張子は対応していません."
            exit 1
        fi

        for case in $(seq 1 $TEST_CASES)
        do
            echo "< 入力ケース $case >\n"
            echo "----- 実行時間 -----"
            time -p {
                RESULT=$(sh $CURRENT_DIR$DATE/.tests/run.sh $FILE < $CURRENT_DIR$DATE/.tests/inputs/$case.txt)
            }
            echo ""
            RESULT=$(echo $RESULT | tr -d "\n\t" | tr -d " ")
            if [ "$RESULT" = "$(cat $CURRENT_DIR$DATE/.tests/outputs/$case.txt | tr -d "\n\t" | tr -d " ")" ]; then
                SCORE=$(echo "$SCORE+1" | bc)
                echo "ooooo 正解 ooooo\n"
                SCORE_STRING=$SCORE_STRING" o"
            else
                echo "xxxxx 不正解 xxxxx\n"
                SCORE_STRING=$SCORE_STRING" x"
            fi
            echo "入力: $(cat $CURRENT_DIR$DATE/.tests/inputs/$case.txt)\n"
            echo "出力: $RESULT\n"
            echo "解答: $(cat $CURRENT_DIR$DATE/.tests/outputs/$case.txt)\n"
        done
        echo $SCORE / $TEST_CASES > $CURRENT_DIR$DATE/$USER_NAME/Q$idx/SCORE
        echo "< 採点結果 >\n"
        echo $SCORE / $TEST_CASES  \[ $SCORE_STRING \]
    done

else
    echo "#-----課題 ${QUESTION}------#"
    SCORE=0
    SCORE_STRING=""

    FILES=$(ls $DATE/$USER_NAME/Q$QUESTION/Main.*)
    FILES=($FILES)
    for file in "${FILES[@]}"
    do
        if printf '%s\n' "${SUPPORTED_EXTENSIONS[@]}" | grep -qx ${file##*.}; then
            FILE=$CURRENT_DIR$file
            break
        fi
    done
    if [ -z $FILE ]; then
        echo "拡張子は対応していません."
        exit 1
    fi

    for case in $(seq 1 $TEST_CASES)
    do
        echo "< 入力ケース $case >\n"
        echo "----- 実行時間 -----"
        time -p {
            RESULT=$(sh $CURRENT_DIR$DATE/.tests/run.sh $FILE < $CURRENT_DIR$DATE/.tests/inputs/$case.txt)
        }
        echo ""
        RESULT=$(echo $RESULT | tr -d "\n\t" | tr -d " ")
        if [ "$RESULT" = "$(cat $CURRENT_DIR$DATE/.tests/outputs/$case.txt | tr -d "\n\t" | tr -d " ")" ]; then
            SCORE=$(echo "$SCORE+1" | bc)
            echo "ooooo 正解 ooooo\n"
            SCORE_STRING=$SCORE_STRING" o"
        else
            echo "xxxxx 不正解 xxxxx\n"
            SCORE_STRING=$SCORE_STRING" x"
        fi
        echo "入力: $(cat $CURRENT_DIR$DATE/.tests/inputs/$case.txt)\n"
        echo "出力: $RESULT\n"
        echo "解答: $(cat $CURRENT_DIR$DATE/.tests/outputs/$case.txt)\n"
    done

    echo $SCORE / $TEST_CASES > $CURRENT_DIR$DATE/$USER_NAME/Q$QUESTION/SCORE
    echo "< 採点結果 >\n"
    echo $SCORE / $TEST_CASES  \[ $SCORE_STRING \]

fi
