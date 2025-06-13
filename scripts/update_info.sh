#!/bin/zsh

if [ "$#" -ne "2" ]; then
    echo "引数の数が違います."
    echo "$(basename "$0") < 変更したユーザ名 > < 更新ステータス: 追加: add, 更新: update, 削除: delete >"
    exit 1
fi

USER="$1"       # 変更したユーザ名
STATUS="$2"     # 更新ステータス [ 追加: add, 更新: update, 削除: delete ]

commit_message="'${USER}' の情報を"
if [ "$STATUS" = "add" ]; then
    commit_message+="登録しました."
elif [ "$STATUS" = "update" ]; then
    commit_message+="更新しました."
elif [ "$STATUS" = "delete" ]; then
    commit_message+="削除しました."
else
    echo "更新ステータスが違います."
    echo "[ 追加: add, 更新: update, 削除: delete ]"
    exit 1
fi

git add info.json
git commit -m "$commit_message"
git stash -u &> /dev/null
git pull --rebase origin main
git push origin main
if [ "$(git stash list)" != "" ]; then
    git stash pop stash@{0}
fi