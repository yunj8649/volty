# Changelog

## 2026-07-24

- `brand/`를 인스타툰 중심의 캐릭터 브랜드 운영 폴더로 정의
- README에 폴더 목적, 문서 우선순위, 인스타툰 개발 방향 추가
- ROADMAP에 Phase 1-7 브랜드 개발 단계 추가
- Brand Bible에 Instagram First Strategy와 제작 판단 체크리스트 추가
- Character Guide에 인스타툰 컷별 캐릭터 사용 규칙 추가
- World Building에 인스타툰 세계관, 장소, 감정, 시즌 구조 추가
- Phase 1 Character Lock 시작
- 1안 뽀짝 Volty를 인스타툰 기준 캐릭터 방향으로 문서화
- `docs/character-lock.md`, `assets/README.md`, `templates/character-asset-review.md`, `prompts/character-lock.md` 추가
- 첫 정면 SVG 초안 `svg/volty-base-front.svg`는 시안과 맞지 않는 손그림식 초안이라 폐기
- 1안 기준 패널 crop `assets/reference/volty-canonical-bbotjjak-panel.png` 추가
- SVG 제작 규칙을 시안 기반 트레이싱으로 수정
- 의상 기준을 2안 동글 Volty 후드티로 정정
- 2안 의상 reference crop `assets/reference/volty-clothing-dongle-panel.png`, `assets/reference/volty-clothing-dongle-main.png` 추가
- SVG 트레이싱 작업 보드 `svg/tracing/volty-canonical-trace-board.svg` 추가
- 시안과 다르게 보이는 정면 레이어드 SVG 초안은 폐기
- 정면 기준을 새로 그리지 않고 픽셀 보존 방식으로 분해한 레이어 자산 `assets/layers/volty-base-front/` 추가
- 1안 외형 레이어 위에 2안 의상 요소를 분리한 작업판 `svg/layers/volty-base-front-raster-layered.svg` 추가
- 앱용 PNG 대신 1안 시안 패널의 큰 정면 crop `assets/reference/volty-shape-bbotjjak-main.png`를 레이어 기준으로 추가

## 2026-07-27

- `assets/layers/volty-base-front/`의 색상별 레이어를 합성해 최종 정면 시안을 만들고, 이를 브랜드 팔레트로 양자화한 뒤 색상별 컨투어 트레이싱으로 벡터화한 정면 SVG 초안 `svg/drafts/volty-base-front.svg` 추가
- 노란 번개 후드·둥근 흰 얼굴·검정 타원 눈·분홍 볼·작은 입·둥근 손발·2안 기준 검정 후드티 포함. `volty` 글자 없이 후드티 중앙에 앰버(#FFB300) 번개 엠블럼 배치
- Flat / No-Gradient 규칙 준수, 하단 그림자 잔여 제거. 시안을 새로 그리지 않고 레이어 트레이싱으로 제작
- 승인 전 초안이라 `svg/drafts/`에 위치. `templates/character-asset-review.md` 검수 통과 후 `svg/poses/`(기본 정면)로 승격 예정

## 2026-07-27 (표정·포즈 SVG)

- 정면 베이스(레이어 트레이싱)를 고정하고, 그 위에 눈·입·볼·소품만 얹는 방식으로 표정 12종·포즈 15종 SVG 생성
- 표정 `svg/expressions/volty-01-happy … 12-touched.svg`: 기본/활짝/같이틀림/당황/고민/이해/방전/졸림/응원/작은승리/긴장/감동
- 포즈 `svg/poses/volty-01-front … 15-victory.svg`: 정면/책/노트/계산기/연필/짚기/두손번쩍/충전/방전/커피/노트북/시험지/이불/하트/승리
- 캐릭터 락 준수: 노란 번개 후드·검정 후드티·중앙 번개 엠블럼·비율 고정, `volty` 글자 없음, Flat/No-Gradient
- 표정은 눈·입·볼만 교체(얼굴 구조 불변), 포즈는 소품·이펙트만 추가(몸 비율 불변)
- 승인 전 초안 성격. `templates/character-asset-review.md` 체크리스트 통과 후 기준 자산으로 확정 권장

## 2026-07-27 (클린 벡터 재작업)

- 래스터 트레이싱본이 가장자리 거칠고 빈 곳·누끼 잔여가 있어 폐기하고, 베지어 곡선 기반 **클린 벡터**로 캐릭터를 새로 그림
- 정면 베이스 `svg/drafts/volty-base-front.svg` 재작성(매끈한 외곽선, 닫힌 패스, 그림자 없음)
- 표정 12·포즈 15 SVG 전부 클린 벡터로 재생성(베이스 고정 + 눈·입·볼·소품 오버레이)
- 클라이언트 프루프용 컨택트시트 `assets/reference/volty-contact-sheet.png` 추가
