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

### `reference/volty-clothing-dongle-panel.png`

용도:

- 2안 동글 Volty 의상 기준 패널
- 검은 후드티, 중앙 노란 번개 심볼, 흰 후드끈/포인트 확인용

### `reference/volty-clothing-dongle-main.png`

용도:

- 2안 의상 디테일 crop
- SVG 트레이싱 시 옷 구조를 확인하기 위한 직접 기준

### `볼티_마스코트_예시.png`

용도:

- 인스타툰 표정, 포즈, 하루 구성 참고
- 말투와 컷 구성 참고
- 최종 SVG 제작 시 직접 복사하지 않고 재해석 기준으로 사용

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
