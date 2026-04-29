# Open Design Lab v2.0

오픈디자인랩 사이트 정적 미러 (Vite/React) — GitHub Pages 운영용.
원본: https://www.opendesignlab.com

## 폴더 구조

```
.
├── index.html              # 진입점 (Vite SPA shell)
├── 404.html                # SPA 라우팅 fallback (index.html 사본)
├── CNAME                   # www.opendesignlab.com
├── .nojekyll               # GitHub Pages Jekyll 비활성
├── assets/                 # Vite 번들 (CSS/JS)
├── fonts/                  # Hyundai Sans + TCCasablanco
├── images/                 # 로고, 아이콘, Vision/Map 이미지
├── icons/                  # UI 아이콘
└── contents/
    ├── images/             # 프로젝트/뉴스/어워드 이미지 (1019)
    └── videos/             # 프로젝트 영상 (6)
```

## 배포

GitHub Pages 가 `main` 브랜치 루트를 그대로 서빙합니다.
Settings → Pages → Branch: `main` / Folder: `/ (root)` → Save.
CNAME 이 들어 있으므로 커스텀 도메인 자동 인식.

## 로컬 미리보기

```
python3 -m http.server 8000
# http://localhost:8000
```

## 용량

총 약 1.2GB (이미지 814MB + 영상 369MB).
GitHub Pages 권장 한도(1GB) 초과하나 동작.
영상은 필요 시 외부 호스팅으로 분리 권장.
