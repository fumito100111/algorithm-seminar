#!bin/sh

make test DATE=$(date "+%Y%m%d")
git branch -M main
git pull origin main
git add $(date "+%Y%m%d")/$(git config user.name)
git commit -m "Submitted from $(git config user.name) ($(date '+%Y-%m-%d %H:%M:%S'))"
git push -u origin main
echo "提出完了しました."