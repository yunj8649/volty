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
```

## 제작 체크리스트

- 작은 크기에서도 Volty로 보이는가?
- 후드 실루엣이 유지되는가?
- 눈과 입 스타일이 바뀌지 않았는가?
- 손과 팔이 과하게 사람처럼 보이지 않는가?
- 기존 SVG와 조합 가능한가?
