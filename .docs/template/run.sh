#!bin/sh

# 引数から実行するファイル名を取得する (引数0: 実行中のスクリプト名, 引数1: 実行するファイル名)
FILE=$1
FILE_NAME=${FILE%.*}
FILE_EXT=${FILE##*.}

if [ $FILE_EXT == 'c' ]; then
    gcc $FILE -o $FILE_NAME
    ./$FILE_NAME

elif [ $FILE_EXT == 'cpp' ]; then
    g++ $FILE -o $FILE_NAME
    ./$FILE_NAME

elif [ $FILE_EXT == 'py' ]; then
    python3 $FILE

elif [ $FILE_EXT == 'java' ]; then
    javac $FILE
    cd $(dirname $FILE)
    java $(basename $FILE_NAME)

else
    echo "拡張子 '$FILE_EXT' は対応していません."
fi