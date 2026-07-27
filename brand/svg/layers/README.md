# Volty Layered SVG Workspace

이 폴더는 승인 SVG를 바로 보관하는 곳이 아니라, 기준 이미지를 깨지지 않게 레이어로 나누는 작업 공간이다.

## Files

- `volty-base-front-raster-layered.svg`: 1안 외형 기준 픽셀 레이어 위에 2안 의상 요소를 얹은 정면 작업판

## Current Rule

- 후드, 얼굴, 손, 발, 전체 비율은 `volty-shape-bbotjjak-main.png`를 따른다.
- 후드티 가슴의 `volty` 글자 레이어는 숨긴다.
- `hoodie-front-panel-2an` 레이어가 2안 검은 후드티 전면을 덮어 기준 의상으로 보이게 한다.
- 후드티 중앙에는 2안 기준의 노란 번개 심볼을 사용한다.
- 흰 후드끈은 2안 의상 기준 요소로만 사용한다.
- 이 파일은 최종 승인 벡터가 아니다.

## Layer Source

레이어 PNG는 `brand/assets/layers/volty-base-front/`에 있다.

```text
00-reference-source.png
01-hood-yellow.png
02-face-hands-feet-white.png
03-cheeks-mouth-pink.png
04-lineart-and-hoodie-source.png
05-source-wordmark-to-hide.png
06-source-antialias-shadow.png
07-hoodie-clean-wordmark-patch.png
08-clothing-2an-reference.png
09-default-stack-preview-without-vector-clothing.png
```

## Next

다음 단계에서 각 레이어를 검수한 뒤, 승인된 레이어만 순수 path SVG로 변환한다. 손으로 임의 재구성하지 않는다.
