---
id: kec.4.3
title: 전기철도의 변전방식
status: reviewed
summary: 단상 부하를 3상 계통에 걸어야 한다. 스코트 결선이 불평형을 줄인다.
covers:
  - kec.4.3.1
formulas:
  - label: 변전소의 요구 (KEC 421.1)
    tex: \text{\textbf{고장 범위 한정}} + \text{\textbf{구간별 분리}} + \text{\textbf{예비설비}}
    note: 사고가 나도 그 구간만, 예비로 계속 운행.
  - label: 3상 → 단상 (KEC 421)
    tex: \text{\textbf{스코트 결선}}\text{으로 3상을 2상으로}(\text{mc.4.5})
    note: 단상 철도 부하의 불평형을 완화.
traps:
  - '**철도는 단상 부하**라 3상 계통을 불평형하게 만든다. 스코트 결선으로 완화.'
  - '**변전소는 구간별로 분리**할 수 있어야 한다 — 사고 파급 방지.'
related:
  - mc.4.5
  - kec.4.2
  - kec.4.7
---

> KEC **420** (421 변전방식의 일반사항) — 시행 2026. 1. 5. 기준

## 변전방식의 일반사항

> KEC **421**

## 변전소의 구성 (421.1)

$$
\boxed{\text{\textbf{고장 범위 한정} + \textbf{구간별 분리} + \textbf{예비설비}}}
$$

$$
\text{\textbf{고장 시 그 구간만}} \;-\; \text{전 노선을 세우지 않게}
$$

$$
\text{\textbf{정상 부분으로 파급되지 않게 자동 분리}}
$$

$$
\text{\textbf{예비설비로 정상 운용}}
$$

$$
\boxed{\text{\textbf{mc.7.6의 보호협조}} \cdot \text{\textbf{kec.4.4의 SCADA}}}
$$

## 변전소의 계획 (421.2)

$$
\text{\textbf{수전선로 길이 최소화}}
$$

$$
\text{\textbf{절연구간}}\text{에서 \textbf{무동력}}(\text{타행})\text{ 운행 가능한 곳}
$$

$$
\text{\textbf{연장급전}}\text{을 고려} \;-\; \text{인접 변전소가 대신 급전}
$$

### 절연구간 (에어섹션)

$$
\text{\textbf{급전 구간의 경계}}
$$

$$
\text{\textbf{다른 변전소・다른 상}}\text{이 만나는 곳}
$$

$$
\text{\textbf{여기서 팬터그래프가 두 구간을 이으면}} \;\Longrightarrow\; \text{\textbf{단락}}
$$

$$
\boxed{\text{\textbf{절연구간에서는 타행}}} \;-\; \text{전기를 끊고 관성으로}
$$

$$
\text{\textbf{교류는 상이 다르면}} \;\Longrightarrow\; \text{위상차로 큰 전류}(\text{mc.2.6})
$$

## 3상 → 단상 변환 — 핵심

$$
\boxed{\text{\textbf{철도는 단상 부하}}}(\text{kec.4.2})
$$

$$
\text{\textbf{계통은 3상}}\text{인데 \textbf{전차는 단상}}
$$

$$
\text{\textbf{단상을 3상에 걸면}} \;\Longrightarrow\; \text{\textbf{불평형}}(\text{ct.1.6})
$$

### 스코트 결선

$$
\boxed{\text{\textbf{3상을 2상으로}}}(\text{mc.4.5})
$$

$$
\text{\textbf{두 개의 단상}}\text{으로 나눠 걸면} \;\Longrightarrow\; \text{불평형 완화}
$$

$$
\textbf{T좌 권수} \text{ = } \dfrac{\sqrt{3}}{2} \times \text{M좌}(\text{mc.4.5})
$$

$$
\text{\textbf{두 급전 구간}}\text{을 두 상에 나눠}
$$

$$
\boxed{\text{\textbf{한 구간은 M상, 한 구간은 T상}}}
$$

$$
\text{\textbf{두 구간의 부하가 비슷하면}} \;\Longrightarrow\; \text{3상이 평형에 가까워짐}
$$

$$
\text{\textbf{mc.4.5에서 "전기철도가 실용적 이유"}}\text{라고 한 것}
$$

### 왜 불평형이 문제인가

$$
\text{\textbf{역상분}}(\text{ct.1.6}) \;\Longrightarrow\; \text{\textbf{발전기・전동기 과열}}
$$

$$
\text{\textbf{계통의 다른 3상 기기}}\text{에 해롭다}
$$

$$
\text{\textbf{불평형률}} = \dfrac{V_2}{V_1}(\text{ct.1.6}) \;-\; \text{한도가 있다}
$$

$$
\boxed{\text{\textbf{철도가 계통을 괴롭힌다}}}(\text{kec.4.2})
$$

## 정리

$$
\boxed{\text{변전소: \textbf{고장 한정} ・ \textbf{구간 분리} ・ \textbf{예비}}}
$$

$$
\boxed{\text{\textbf{스코트 결선}}\text{으로 3상 → 2상}} \;-\; \text{단상 부하의 불평형 완화}
$$

$$
\text{\textbf{절연구간}}\text{에서는 \textbf{타행}} \;-\; \text{단락 방지}
$$

$$
\text{\textbf{mc.4.5의 스코트}} + \text{\textbf{ct.1.6의 대칭좌표}} \;-\; \text{철도 변전의 두 축}
$$
