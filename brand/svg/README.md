# SVG Library

Volty 인스타툰은 SVG 우선으로 제작한다. SVG는 캐릭터 비율과 제작 속도를 유지하기 위한 기준 자산이다.

## 우선 제작 순서

1. `volty-base-front.svg`
2. `volty-base-3q-left.svg`
3. `volty-base-3q-right.svg`
4. `expressions/`
5. `poses/`
6. `props/`
7. `backgrounds/`
8. `icons/`

## 규칙

- Flat Design만 사용한다.
- 그라데이션을 사용하지 않는다.
- 실사 질감과 3D 효과를 사용하지 않는다.
- 외곽선 두께는 일관되게 유지한다.
- 캐릭터 비율은 `docs/character-guide.md`를 따른다.

## 권장 하위 폴더

```text
svg/
  expressions/
  poses/
  props/
  backgrounds/
  icons/
  layers/
```

## 제작 체크리스트

- 작은 크기에서도 Volty로 보이는가?
- 후드 실루엣이 유지되는가?
- 눈과 입 스타일이 바뀌지 않았는가?
- 손과 팔이 과하게 사람처럼 보이지 않는가?
- 기존 SVG와 조합 가능한가?

## Current Working Assets

현재 작업 기준 SVG는 `drafts/volty-base-front.svg`다.

이 파일은 사용자 제공 클린 스탠딩 Volty SVG에서 흰 배경을 제거한 투명 베이스다. 표정과 포즈는 이 베이스의 후드, 몸, 손발, 옷 비율을 유지한 상태에서 overlay 방식으로 확장한다.

현재 개별 SVG:

- `expressions/01-joy.svg` - `expressions/12-cheering.svg`
- `poses/01-standing.svg` - `poses/15-lightning-power.svg`

참고 작업판:

- `tracing/volty-canonical-trace-board.svg`: 1안 외형 reference와 2안 의상 reference를 함께 놓은 작업 보드
- `layers/volty-base-front-raster-layered.svg`: 원본 픽셀 레이어를 보존한 중간 작업판

제작 전 확인할 것:

- `docs/character-lock.md` 기준과 맞는지 검수한다.
- 실제 인스타툰 적용 전 `templates/character-asset-review.md`를 통과시킨다.
- 후드, 눈, 입, 몸 비율을 바꾸지 않는다.
