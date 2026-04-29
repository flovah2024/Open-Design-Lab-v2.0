#!/usr/bin/env bash
# Open Design Lab v2.0 — 첫 GitHub 푸시 스크립트
# 사용법:
#   cd ~/Documents/Cowork/09_오픈디자인랩/mirror
#   chmod +x setup-and-push.sh
#   ./setup-and-push.sh

set -e
REMOTE="https://github.com/flovah2024/Open-Design-Lab-v2.0.git"

echo ""
echo "=== Open Design Lab v2.0 ==="
echo "리포: $REMOTE"
echo ""

# 1) sandbox 잔재 정리
if [ -d ".git-broken" ]; then
  echo "[1/6] 임시 .git-broken 정리..."
  rm -rf .git-broken
fi
if [ -d ".git" ]; then
  read -p "[!] .git 폴더가 이미 있습니다. 새로 시작할까요? (y/N) " yn
  case "$yn" in
    [Yy]*) rm -rf .git ;;
    *) echo "기존 .git 유지하고 진행합니다." ;;
  esac
fi

# 2) git init + main 브랜치
if [ ! -d ".git" ]; then
  echo "[2/6] git init..."
  git init -q
  git branch -M main
fi
git config user.email "flovah2024@gmail.com"
git config user.name "FLOVAH"

# 3) 모든 파일 add (1.2GB / 1062개) — 1~2분
echo "[3/6] 파일 add 중 (1.2GB) ..."
git add .

# 4) 커밋 (이미 있으면 건너뜀)
if git rev-parse HEAD >/dev/null 2>&1; then
  echo "[4/6] 이미 커밋이 있어 건너뜀."
else
  echo "[4/6] 첫 커밋..."
  git commit -q -m "Initial mirror of opendesignlab.com (v2.0)"
fi

# 5) 원격 등록
if git remote | grep -q origin; then
  echo "[5/6] origin 이미 등록됨 — URL 갱신"
  git remote set-url origin "$REMOTE"
else
  echo "[5/6] origin 등록"
  git remote add origin "$REMOTE"
fi

# 6) 푸시 (HTTPS — 처음이면 GitHub 토큰 또는 비밀번호 입력)
echo "[6/6] git push (1.2GB 업로드 — 5~15분 소요)"
git push -u origin main

echo ""
echo "✓ 푸시 완료!"
echo "  https://github.com/flovah2024/Open-Design-Lab-v2.0"
echo ""
echo "다음 단계:"
echo "  1) 브라우저에서 위 리포 → Settings → Pages"
echo "  2) Branch: main / Folder: / (root) → Save"
echo "  3) CNAME(www.opendesignlab.com)이 자동 인식됨"
echo ""
