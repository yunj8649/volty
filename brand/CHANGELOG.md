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

## 2026-07-27 (충실 벡터 베이스 확정)

- 손으로 재작도한 baseline이 원본과 다른 off-model이라 폐기
- `vtracer`(venv)로 원본 레이어 합성본을 곡선 벡터화 → 원본 실루엣·불꽃 후드·교차한 손·표정·비율에 충실한 정면 베이스로 교체
- `svg/drafts/volty-base-front.svg` 확정. 반투명 회색 그림자 제거 + 최대 연결요소만 유지(누끼 잔여 제거), viewBox 추가
- 검증: cairosvg 래스터라이즈로 원본과 대조. `assets/reference/volty-base-front-proof.png` 첨부
- off-model 표정12·포즈15 SVG, 구 컨택트시트 삭제(다음 라운드에서 이 충실 베이스 기반으로 표정·포즈 재작업)
- 충실도 우선: 가장자리 소프트·파일 큼(약 800KB). 이 vtracer 빌드는 기본 파라미터만 안정적이라 소스 정리로만 개선

## 2026-07-27 (베이스 소스 교체: 2안 동글 클린 라인)

- 1안 합성본은 원본 라인이 물러 vtracer 결과가 소프트·대용량(누끼가 덜 된 느낌)이라 베이스 소스에서 제외
- 가장 깔끔하고 기획에 맞는 `assets/reference/volty-clothing-dongle-main.png`(2안 동글, 굵고 깨끗한 라인)로 베이스 재제작
- 처리: 흰 배경+헤일로 누끼 → 반짝이 제거(최대 연결요소) → 브랜드 팔레트 스냅 → 경계 정돈 → vtracer
- 결과 `svg/drafts/volty-base-front.svg`: 크리스프 외곽선·플랫 컬러, 약 42KB(기존 800KB 대비 경량), viewBox 포함
- 프루프 `assets/reference/volty-base-front-proof.png` 갱신
- 참고: 캐릭터 락 문서는 '1안 외형+2안 의상'이 기준이나, 라인 품질 우선으로 2안 동글을 베이스로 채택(문서 갱신 필요 시 반영)

## 2026-07-27 (클린 스탠딩 베이스 확정)

- 사용자 제공 클린 벡터 `볼티.svg`(스탠딩 전신, 크리스프 외곽선·플랫 컬러)를 정면 베이스로 채택
- 노란 불꽃 후드·둥근 흰 얼굴·검정 타원 눈·벌린 입(빨강 혀)·분홍 볼·검정 후드티+중앙 앰버 번개 엠블럼·흰 손발 — 캐릭터 락 준수, Flat/No-Gradient
- 원본에 박혀 있던 풀캔버스 흰 배경 사각형(`#FDFDFD`)을 제거해 투명 처리(로고 투명 규칙 준수). 나머지 15개 캐릭터 path는 픽셀 보존
- `svg/drafts/volty-base-front.svg` = 투명 클린본(26.5KB), `svg/drafts/volty-base-front-source.svg` = 흰 배경 포함 원본 아카이브
- 프루프 `assets/reference/volty-base-front-proof.png` 갱신(회색 배경 위 렌더로 투명·라인 검증)
- 기존 2안 동글 vtrace 베이스("선 딴 느낌 아님" 반려)를 대체

## 2026-07-27 (클린 베이스 기반 표정·포즈 개별 SVG)

- `assets/볼티_표정+포즈.png` reference sheet 추가
- `svg/drafts/volty-base-front.svg`에서 기존 눈·볼·입 path만 제거한 베이스를 공통으로 사용해 표정 12종 개별 SVG 생성
- `svg/expressions/01-joy.svg` - `svg/expressions/12-cheering.svg` 추가
- 같은 베이스 위에 소품, 손, 동작선을 얹어 기본 포즈 15종 개별 SVG 생성
- `svg/poses/01-standing.svg` - `svg/poses/15-lightning-power.svg` 추가
- 모든 신규 SVG는 독립 실행 가능한 파일이며 `xmllint` 검증과 Quick Look 렌더 검수를 통과
