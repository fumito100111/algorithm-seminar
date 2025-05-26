#!/bin/bash

CURRENT_DIR="$(pwd)"
GITHUB_USERNAME="$(git config user.name)"
DATE="$(date "+%Y%m%d")"

git add "${DATE}/${GITHUB_USERNAME}"
git commit -m "Algorithm-Seminar-$(date "+%Y-%m-%d") (${GITHUB_USERNAME})"
git pull --rebase origin main
git push origin main