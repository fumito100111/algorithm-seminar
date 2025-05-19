#!bin/sh

# 引数から実行するファイル名を取得する (引数0: 実行中のスクリプト名, 引数1: カレントディレクトリ, 引数3: テストするディレクトリの日付)
CURRENT_DIR=$1
DATE=$2

DATE_TRANSFORMED="$(python3 $CURRENT_DIR.docs/script/transform_date.py $DATE) 13:00 ~"
echo "$(sed "s/<-----DATE----->/$DATE/g" $CURRENT_DIR$DATE/README.md)" > $CURRENT_DIR$DATE/README.md
echo "$(sed "s/<-----DATE_TRANSFORMED----->/$DATE_TRANSFORMED/g" $CURRENT_DIR$DATE/README.md)" > $CURRENT_DIR$DATE/README.md
CREATOR=$(git config user.name)
EXTENSION=$(python3 $CURRENT_DIR.docs/script/user.py $CURRENT_DIR $CREATOR value)
LANGUAGE=$(sh $CURRENT_DIR.docs/script/extension_to_language.sh $EXTENSION)
echo "$(sed "s/<-----CREATOR----->/[$CREATOR]($CREATOR\/Main.$EXTENSION) ($LANGUAGE)/g" $CURRENT_DIR$DATE/README.md)" > $CURRENT_DIR$DATE/README.md

PARTICIPANTS=""
for item in $(python3 $CURRENT_DIR.docs/script/users.py $CURRENT_DIR items)
do
    USER=${item%,*}
    EXTENSION=${item##*,}
    if [ "$USER" != "$CREATOR" ]; then
        LANGUAGE=$(sh $CURRENT_DIR.docs/script/extension_to_language.sh $EXTENSION)
        PARTICIPANTS="$PARTICIPANTS- [$USER]($USER\/Main.$EXTENSION) ($LANGUAGE)\n"
    fi
done
echo "$(sed "s/<-----PARTICIPANTS----->/$PARTICIPANTS/g" $CURRENT_DIR$DATE/README.md)" > $CURRENT_DIR$DATE/README.md