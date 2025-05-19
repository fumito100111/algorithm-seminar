#!bin/sh

git branch -M main
git pull origin main
git add .
git commit -m "Updated from $(git config user.name) ($(date '+%Y-%m-%d %H:%M:%S'))"
git push -u origin main
echo "更新完了しました."