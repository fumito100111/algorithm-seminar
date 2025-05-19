#!bin/sh

# 引数から実行するファイル名を取得する (引数0: 実行中のスクリプト名, 引数1: カレントディレクトリ, 引数2: ユーザ名, 引数3: テストするディレクトリの日付)
CURRENT_DIR=$1
USER_NAME=$2
DATE=$3
SUPPORTED_EXTENSIONS=("c" "cpp" "py" "java")


FILES=$(ls $DATE/$USER_NAME/Main.*)
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

TEST_CASES=$(ls -1U $CURRENT_DIR$DATE/.tests/inputs/*.txt | wc -l)

echo "----- $USER_NAME ($DATE) -----\n"
SCORE=0
SCORE_STRING=""
for index in $(seq 1 $TEST_CASES)
do
    echo "< 入力ケース $index >\n"
    echo "----- 実行時間 -----"
    time -p {
        RESULT=$(sh $CURRENT_DIR$DATE/.tests/run.sh $FILE < $CURRENT_DIR$DATE/.tests/inputs/$index.txt)
    }
    echo ""
    RESULT=$(echo $RESULT | tr -d "\n\t" | tr -d " ")
    if [ "$RESULT" = "$(cat $CURRENT_DIR$DATE/.tests/outputs/$index.txt | tr -d "\n\t" | tr -d " ")" ]; then
        SCORE=$(echo "$SCORE+1" | bc)
        echo "ooooo 正解 ooooo\n"
        SCORE_STRING=$SCORE_STRING" o"
    else
        echo "xxxxx 不正解 xxxxx\n"
        SCORE_STRING=$SCORE_STRING" x"
    fi
    echo "入力: $(cat $CURRENT_DIR$DATE/.tests/inputs/$index.txt)\n"
    echo "出力: $RESULT\n"
    echo "解答: $(cat $CURRENT_DIR$DATE/.tests/outputs/$index.txt)\n"
done

echo $SCORE / $TEST_CASES > $CURRENT_DIR$DATE/$USER_NAME/SCORE
echo "< 採点結果 >\n"
echo $SCORE / $TEST_CASES  \[ $SCORE_STRING \]