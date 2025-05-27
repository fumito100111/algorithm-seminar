#!/bin/bash

CURRENT_DIR="$(pwd)"
GITHUB_USERNAME="$(git config user.name)"
DATE="$(date "+%Y%m%d")"

git add "${DATE}/${GITHUB_USERNAME}"
git commit -m "Algorithm-Seminar-$(date "+%Y-%m-%d") (${GITHUB_USERNAME})"
git stash -u &> /dev/null
git pull origin main
git push origin main
if [ "$(git stash list)" != "" ]; then
    git stash pop stash@{0}
fi