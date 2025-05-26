#!/bin/bash
if [ "$#" -eq 0 ]; then
    echo "ファイルを指定してください."
    echo "$(basename "$0") < ファイルの絶対パス >"
    exit 1
fi

CURRENT_DIR="$(pwd)"                                        # 現在のディレクトリ
FILE="$(basename "$1")"                                     # ファイル名
EXE_FILE="${FILE%.*}"                                       # 実行ファイルの絶対パス
FILE_EXT="${FILE##*.}"                                      # ファイルの拡張子
INPUT_FILE="$2"                                             # 入力ファイルの絶対パス

# ファイルのあるディレクトリへ移動
cd "$(dirname "$1")"

# C
if [ "$FILE_EXT" = "c" ]; then
    gcc "./${FILE}" -o "${EXE_FILE}"
    if [ "$?" -ne "0" ]; then
        echo "コンパイルエラー"
        exit 1
    fi

    "./${EXE_FILE}"  < "${INPUT_FILE}"
    if [ "$?" -ne "0" ]; then
        echo "実行エラー"
        exit 1
    fi

    rm -rf "${EXE_FILE}"

# C++
elif [ "$FILE_EXT" = "cpp" ] || [ "$FILE_EXT" = "cc" ] || [ "$FILE_EXT" = "cxx" ]; then
    g++ "./${FILE}" -o "${EXE_FILE}"
    if [ "$?" -ne "0" ]; then
        echo "コンパイルエラー"
        exit 1
    fi

    "./${EXE_FILE}" < "${INPUT_FILE}"
    if [ "$?" -ne "0" ]; then
        echo "実行エラー"
        exit 1
    fi

    rm -rf "${EXE_FILE}"

# Python
elif [ "$FILE_EXT" = "py" ]; then
    python3 "./${FILE}" < "${INPUT_FILE}"
    if [ "$?" -ne "0" ]; then
        echo "実行エラー"
        exit 1
    fi

# Java
elif [ "$FILE_EXT" = "java" ]; then
    javac "./${FILE}"
    if [ "$?" -ne "0" ]; then
        echo "コンパイルエラー"
        exit 1
    fi

    java "$(basename "${EXE_FILE}")" < "${INPUT_FILE}"
    if [ "$?" -ne "0" ]; then
        echo "実行エラー"
        exit 1
    fi

    rm -rf "${EXE_FILE}.class"

# Rust
elif [ "$FILE_EXT" = "rs" ]; then
    rustc "./${FILE}"
    if [ "$?" -ne "0" ]; then
        echo "コンパイルエラー"
        exit 1
    fi

    "./${EXE_FILE}" < "${INPUT_FILE}"
    if [ "$?" -ne "0" ]; then
        echo "実行エラー"
        exit 1
    fi
    rm -rf "${EXE_FILE}"

# Ruby
elif [ "$FILE_EXT" = "rb" ]; then
    ruby "./${FILE}" < "${INPUT_FILE}"
    if [ "$?" -ne "0" ]; then
        echo "実行エラー"
        exit 1
    fi

# Go
elif [ "$FILE_EXT" = "go" ]; then
    go run "./${FILE}" < "${INPUT_FILE}"
    if [ "$?" -ne "0" ]; then
        echo "実行エラー"
        exit 1
    fi

else
    echo "拡張子が対応していません."
    exit 1
fi

# プログラム実行時のディレクトリへ戻る
cd "${CURRENT_DIR}"