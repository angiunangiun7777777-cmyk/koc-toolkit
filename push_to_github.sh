#!/bin/bash
# 用法：./push_to_github.sh 仓库名
# 前置：已在 GitHub 网页上建好同名空仓库，且不勾选任何初始化文件
set -e
REPO="${1:-koc-toolkit}"
OWNER="angiunangiun7777777-cmyk"
REMOTE="git@github.com:${OWNER}/${REPO}.git"
cd "$(dirname "$0")"
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE"
git branch -M main
git push -u origin main
echo ""
echo "推送完成：${REMOTE}"
echo "接着打开 https://github.com/${OWNER}/${REPO}/settings/pages"
echo "Source 选 Deploy from a branch，分支选 main，目录选 / (root)，保存。"
echo "站点地址通常是 https://${OWNER}.github.io/${REPO}/"
