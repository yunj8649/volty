# Character Lock Prompt Guide

Volty 캐릭터를 AI로 생성하거나 보조 제작할 때 사용하는 고정 프롬프트다. 이 프롬프트는 새 캐릭터를 만들기 위한 것이 아니라, 기존 1안 뽀짝 Volty를 흔들리지 않게 유지하기 위한 것이다.

## Canonical Character Prompt

```text
Create Volty, the official flat vector mascot for a Korean electrician exam Instagram toon brand. Use the canonical "bbotjjak Volty" design: a small rounded study buddy with a yellow lightning-shaped hood, round white face, black hoodie, tiny black oval eyes, small simple mouth, soft pink cheeks, rounded paws and feet, thick clean black outline, cute friendly proportions, pastel minimal style. Volty should feel like a friend studying together, not a teacher.
```

## Required Lock

```text
Keep the exact same character identity and proportions: yellow lightning hood, round white face, black hoodie, tiny black oval eyes with no highlights, small simple mouth, pink cheeks, rounded hands and feet, thick rounded black outline, compact chubby body. Do not redesign Volty.
```

## Style Lock

```text
Flat design, vector friendly, rounded shapes, minimal details, clean outline, pastel educational toon style, transparent or simple paper background, no gradient, no realistic lighting, no 3D, no cinematic style.
```

## Negative Prompt

```text
realistic, 3D, cinematic, gradient, glow, heavy shadow, anime eyes, eyelashes, human body, long limbs, fingers, different outfit, different hood, metallic texture, furry texture, complex hair, scary face, angry teacher, textbook page, copied exam question, cluttered background
```

## Expression Prompt Pattern

```text
Create Volty in a [EXPRESSION] expression for an Instagram toon panel. Preserve the canonical character exactly: yellow lightning-shaped hood, round white face, black hoodie, tiny black oval eyes, small simple mouth, pink cheeks, rounded paws and feet, thick rounded black outline, flat vector style. The expression should be readable only through eyes, mouth, cheeks, and hand position. No redesign, no 3D, no gradient.
```

## Pose Prompt Pattern

```text
Create Volty in a [POSE] pose for an Instagram toon panel. Preserve the canonical character exactly: yellow lightning-shaped hood, round white face, black hoodie, tiny black oval eyes, small simple mouth, pink cheeks, rounded paws and feet, thick rounded black outline, compact chubby proportions, flat vector style. Keep the pose simple and readable at small size. No redesign, no 3D, no gradient.
```

## Review Rule

AI 결과물은 바로 사용하지 않는다. 항상 `templates/character-asset-review.md`로 검수한 뒤 SVG로 정리한다.
