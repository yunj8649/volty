# Brand Asset Registry

이 폴더는 Volty 인스타툰 브랜딩을 위한 원본 참고 자산을 보관한다.

## Canonical Assets

### `볼티_마스코트_3개_제안.png`

용도:

- 캐릭터 방향 선택 기록
- 1안 뽀짝 Volty는 외형 기준으로 사용
- 2안 동글 Volty는 의상 기준으로 사용
- 3안 미니 Volty는 변형 후보로만 보관

### `reference/volty-canonical-bbotjjak-panel.png`

용도:

- 1안 뽀짝 Volty 외형을 잘라낸 기준 패널
- 얼굴, 후드 실루엣, 비율 검수의 직접 기준
- 임의 재해석 없이 원본 비율을 확인하기 위한 reference

### `reference/volty-shape-bbotjjak-clean.png`

용도:

- 앱에서 사용 중인 단독 Volty 마스코트 reference
- 정면 기본형 SVG의 외형 underlay
- 얼굴, 후드, 손, 발 위치를 확인하기 위한 깨끗한 투명 PNG

### `reference/volty-shape-bbotjjak-main.png`

용도:

- `volty-canonical-bbotjjak-panel.png`의 큰 정면 Volty를 잘라낸 투명 PNG
- `layers/volty-base-front/`의 현재 직접 기준
- 앱용 PNG보다 시안 원본에 가까운 정면 비율 확인용

### `reference/volty-clothing-dongle-panel.png`

용도:

- 2안 동글 Volty 의상 기준 패널
- 검은 후드티, 중앙 노란 번개 심볼, 흰 후드끈/포인트 확인용

### `reference/volty-clothing-dongle-main.png`

용도:

- 2안 의상 디테일 crop
- SVG 트레이싱 시 옷 구조를 확인하기 위한 직접 기준

## Layer Assets

### `layers/volty-base-front/`

용도:

- 정면 Volty를 후드, 얼굴/손/발, 볼/입, 선/후드티, 숨길 1안 글자, 2안 의상 reference로 분해한 작업 레이어
- `svg/layers/volty-base-front-raster-layered.svg`의 직접 소스
- 최종 승인 SVG가 아니라 다음 순수 path SVG 제작 전 검수용

### `볼티_마스코트_예시.png`

용도:

- 인스타툰 표정, 포즈, 하루 구성 참고
- 말투와 컷 구성 참고
- 최종 SVG 제작 시 직접 복사하지 않고 재해석 기준으로 사용

### `볼티_표정+포즈.png`

용도:

- 표정 12종과 기본 포즈 15종 reference sheet
- `svg/expressions/`와 `svg/poses/` 개별 SVG 제작 기준
- 최종 SVG 검수 시 누락된 표정, 소품, 동작 확인용

### `crops/expressions/`

용도:

- `볼티_표정+포즈.png`에서 표정 12종만 분리한 투명 PNG crop
- `svg/expressions/` raster-backed SVG의 직접 소스
- path-only 벡터화 전 시안 고정용 기준

### `crops/poses/`

용도:

- `볼티_표정+포즈.png`에서 기본 포즈 15종만 분리한 투명 PNG crop
- `svg/poses/` raster-backed SVG의 직접 소스
- path-only 벡터화 전 시안 고정용 기준

### `reference/volty-expression-pose-crop-contact-sheet.png`

용도:

- 표정 12종과 포즈 15종 crop이 시트 기준과 맞는지 한 장에서 검수
- 옆 컷 잔상, 하단 라벨, 구분선 유입 여부 확인
- 개별 SVG 업데이트 후 전체 균형 확인

## Reference Assets

### `볼티_디자인.png`

용도:

- 워드마크, 앱 아이콘, 기본 컬러 참고
- 캐릭터보다 로고 시스템 참고에 가깝다

### `볼티_로고.png`

용도:

- 로고 아이디어 참고

주의:

- 글로우와 그라데이션이 포함되어 있어 인스타툰 SVG 규칙과 충돌한다.
- SVG 라이브러리 제작 시 그대로 따르지 않는다.

## Asset Rules

- 원본 PNG는 참고용으로 보관한다.
- 인스타툰 제작용 최종 자산은 `brand/svg/`에 SVG로 만든다.
- SVG는 기준 시안을 직접 트레이싱해서 만든다.
- 외형은 1안 reference, 의상은 2안 reference를 따른다.
- 새 PNG를 추가할 때는 어떤 용도인지 이 문서에 기록한다.
- 캐릭터 기준과 충돌하는 자산은 `reference only`로 분류한다.
