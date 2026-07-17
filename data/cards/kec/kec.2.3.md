---
id: kec.2.3
title: 전선로
status: reviewed
summary: 높이 숫자를 외우는 단원이다. 도로 6, 철도 6.5, 횡단보도교 3.5, 기타 5.
covers:
  - kec.2.3.1
  - kec.2.3.2
  - kec.2.3.3
  - kec.2.3.4
formulas:
  - label: 저압 가공전선의 높이 (KEC 222.7)
    tex: \text{도로 } \mathbf{6}\ \mathrm{m} \;/\; \text{철도・궤도 } \mathbf{6.5}\ \mathrm{m} \;/\; \text{횡단보도교 } \mathbf{3.5}\ \mathrm{m} \;/\; \text{기타 } \mathbf{5}\ \mathrm{m}
    note: 도로·기타는 **지표상**, 철도는 **레일면상**, 횡단보도교는 **노면상**.
  - label: 저압 가공전선의 굵기 (KEC 222.5)
    tex: 400\mathrm{V} \text{ 이하} \to \mathbf{3.2}\ \mathrm{mm}(\text{절연전선 } \mathbf{2.6}\ \mathrm{mm}), \quad 400\mathrm{V} \text{ 초과} \to \text{시가지 } \mathbf{5}\ \mathrm{mm} \cdot \text{시가지 외 } \mathbf{4}\ \mathrm{mm}
    note: 인장강도 3.43 / 2.3 / 8.01 / 5.26 kN.
  - label: 지중 전선로 매설깊이 (KEC 223.1)
    tex: \text{차량 등 압력} \to \mathbf{1.0}\ \mathrm{m} \text{ 이상}, \qquad \text{기타} \to \mathbf{0.6}\ \mathrm{m} \text{ 이상}
    note: 직접매설식. **1.0 / 0.6** 이 핵심.
  - label: 옥상전선로 (KEC 221.3)
    tex: \text{조영재와 } \mathbf{2}\ \mathrm{m} \text{ 이상 이격}
    note: 전선은 절연전선·케이블.
traps:
  - '**도로 6m, 철도 6.5m**다. 기준면이 다르다 — 지표상 vs 레일면상.'
  - '**횡단보도교는 3.5m**(절연전선·케이블이면 3m)다. 사람만 지나가니 낮다.'
  - '**400V 초과는 인입용 비닐절연전선(DV)을 쓸 수 없다.**'
  - '**지중 매설은 차량 압력 1.0m, 기타 0.6m**다.'
related:
  - kec.2.4
  - kec.3.4
  - pw.2.1
---

> KEC **220** (221 구내·옥측·옥상·옥내 전선로 · 222 저압 가공전선로 · 223 지중 전선로
> · 224 특수장소) — 시행 2026. 1. 5. 기준

## 구내, 옥측, 옥상, 옥내 전선로의 시설

> KEC **221**

### 구내인입선 (221.1)

$$
\text{\textbf{저압 가공인입선}} \;-\; \text{지지물에서 \textbf{수용장소 붙임점}}\text{까지}(\text{kec.1.1의 용어})
$$

$$
\text{\textbf{222 및 332}}\text{의 규정에 준한다}
$$

### 옥상전선로 (221.3)

$$
\boxed{\text{조영재와 } \mathbf{2}\ \mathrm{m} \text{ 이상 이격}}
$$

$$
\text{전선은 \textbf{절연전선 또는 케이블}}
$$

$$
\text{\textbf{옥상은 사람이 올라간다}} \;-\; \text{그래서 멀리}
$$

$$
\text{\textbf{케이블이면 완화}}\text{되는 조건이 있다}
$$

## 저압 가공전선로

> KEC **222**

### 저압 가공전선의 굵기 및 종류 (222.5)

$$
\text{\textbf{쓸 수 있는 전선}}
$$

| 종류 | 조건 |
|---|---|
| **나전선** | **중성선 또는 다중접지된 접지측**에 **한한다** |
| **절연전선** | |
| **다심형 전선** | |
| **케이블** | |

$$
\boxed{\text{\textbf{나전선은 중성선・접지측만}}}
$$

$$
\text{\textbf{선도체에 나전선은 안 된다}} \;-\; \text{당연}
$$

$$
\text{\textbf{중성선은 전위가 낮으니}} \;-\; \text{kec.2.1의 다중접지}
$$

### 굵기

$$
\boxed{
\begin{array}{l|l}
\mathbf{400}\ \mathrm{V} \text{ \textbf{이하}} & \text{인장강도 } 3.43\ \mathrm{kN} \text{ 또는 지름 } \mathbf{3.2}\ \mathrm{mm} \\
& (\text{\textbf{절연전선}}: 2.3\ \mathrm{kN} \text{ 또는 지름 } \mathbf{2.6}\ \mathrm{mm} \text{ 경동선}) \\ \hline
\mathbf{400}\ \mathrm{V} \text{ \textbf{초과}} \cdot \text{\textbf{시가지}} & 8.01\ \mathrm{kN} \text{ 또는 지름 } \mathbf{5}\ \mathrm{mm} \text{ 경동선} \\
\mathbf{400}\ \mathrm{V} \text{ \textbf{초과}} \cdot \text{\textbf{시가지 외}} & 5.26\ \mathrm{kN} \text{ 또는 지름 } \mathbf{4}\ \mathrm{mm} \text{ 경동선}
\end{array}
}
$$

$$
\text{\textbf{케이블은 제외}} \;-\; \text{케이블은 이 규정을 안 받는다}
$$

$$
\text{\textbf{"3.2 / 2.6 / 5 / 4"}}
$$

$$
\text{\textbf{절연전선이 더 가늘어도 된다}} \;-\; 3.2 \to 2.6
$$

$$
\text{\textbf{절연물이 보강}}\text{해 주니}
$$

$$
\text{\textbf{시가지가 더 굵어야}} \;-\; 5 > 4 \;-\; \text{\textbf{끊어지면 피해가 크니}}
$$

$$
\boxed{\text{\textbf{사람이 많은 곳일수록 튼튼하게}}}
$$

### 400V 초과의 금지

$$
\boxed{\text{\textbf{인입용 비닐절연전선}}(\text{DV})\text{을 \textbf{사용해서는 안 된다}}}
$$

$$
\text{\textbf{DV는 저압 인입선용}} \;-\; \text{절연이 얇다}
$$

$$
400\ \mathrm{V} \text{ 초과에는 부적합}
$$

### 저압 가공전선의 높이 (222.7)

$$
\boxed{
\begin{array}{l|c|l}
\text{\textbf{도로 횡단}} & \mathbf{6}\ \mathrm{m} & \text{\textbf{지표상}} \\
\text{\textbf{철도・궤도 횡단}} & \mathbf{6.5}\ \mathrm{m} & \text{\textbf{레일면상}} \\
\text{\textbf{횡단보도교 위}} & \mathbf{3.5}\ \mathrm{m} & \text{\textbf{노면상}} \\
\text{\textbf{기타}} & \mathbf{5}\ \mathrm{m} & \text{\textbf{지표상}}
\end{array}
}
$$

$$
\text{\textbf{"6 - 6.5 - 3.5 - 5"}}
$$

$$
\boxed{\text{\textbf{기준면이 다르다}}} \;-\; \text{지표상 ・ 레일면상 ・ 노면상}
$$

$$
\text{\textbf{시험 함정}}
$$

### 왜 이 순서인가

$$
\text{\textbf{철도}}\text{가 가장 높다}(6.5) \;-\; \text{\textbf{기차가 높으니}}
$$

$$
\text{\textbf{도로}}(6) \;-\; \text{\textbf{트럭}}\text{이 지나가니}
$$

$$
\text{\textbf{기타}}(5) \;-\; \text{차가 안 다니면 낮아도}
$$

$$
\text{\textbf{횡단보도교}}(3.5) \;-\; \text{\textbf{사람만} 지나가니 가장 낮다}
$$

$$
\boxed{\text{\textbf{무엇이 지나가느냐}}\text{가 높이를 정한다}}
$$

$$
\text{\textbf{규정의 숫자에 이유가 있다}} \;-\; \text{외우기 쉬워진다}
$$

### 완화 조건

$$
\text{\textbf{횡단보도교}}: \text{\textbf{절연전선・다심형・케이블}}\text{이면 } 3.5 \to \mathbf{3}\ \mathrm{m}
$$

$$
\text{\textbf{기타}}: \text{\textbf{도로 이외}}\text{의 곳 또는 \textbf{옥외 조명용}}(\text{절연전선・케이블})\text{이면 } 5 \to \mathbf{4}\ \mathrm{m}
$$

$$
\text{\textbf{다리 하부의 전기철도용 급전선}}: 5 \to \mathbf{3.5}\ \mathrm{m}
$$

$$
\text{\textbf{절연이 되어 있으면 완화}} \;-\; \text{닿아도 덜 위험하니}
$$

$$
\text{\textbf{수면 상}}: \text{\textbf{선박의 항해에 위험을 주지 않도록}} \;-\; \text{숫자가 없다}
$$

$$
\boxed{\text{\textbf{배 크기가 제각각이니 숫자를 못 정한다}}}
$$

### 안전율 (222.6)

$$
\text{\textbf{다심형 전선}} \text{ 또는 } \mathbf{400}\ \mathrm{V} \text{ \textbf{초과}}\text{면 } 332.4 \text{ 에 준한다}
$$

$$
\text{\textbf{경동선・내열동합금선}} \;\Longrightarrow\; \mathbf{2.2} \text{ 이상}
$$

$$
\text{\textbf{기타}}(\text{ACSR 등}) \;\Longrightarrow\; \mathbf{2.5} \text{ 이상}
$$

$$
\boxed{\text{\textbf{2.2와 2.5}}} \;-\; \text{pw.2.1의 이도 계산과 이어진다}
$$

$$
\text{\textbf{안전율}} = \dfrac{\text{인장강도}}{\text{허용장력}}
$$

$$
\text{\textbf{경동선이 낮은 이유}} \;-\; \text{성질이 일정해 예측이 쉬우니}
$$

### 지지물의 강도 (222.8)

$$
\text{\textbf{목주}}: \text{풍압하중의 } \mathbf{1.2} \text{ 배}
$$

$$
\text{\textbf{기타}}: \text{풍압하중}
$$

$$
\text{\textbf{목주가 더 여유를}} \;-\; \text{썩고 갈라지니}
$$

## 지중 전선로

> KEC **223**

$$
\boxed{
\begin{array}{l|c}
\text{\textbf{차량 기타 중량물의 압력}}\text{을 받을 우려} & \mathbf{1.0}\ \mathrm{m} \text{ 이상} \\
\text{\textbf{기타}} & \mathbf{0.6}\ \mathrm{m} \text{ 이상}
\end{array}
}
$$

$$
\text{\textbf{직접매설식}}\text{의 매설깊이}
$$

$$
\boxed{\text{\textbf{"1.0 / 0.6"}}}
$$

### 세 가지 방식

| 방식 | |
|---|---|
| **직접매설식** | 땅에 직접 |
| **관로식** | 관을 묻고 그 안에 |
| **암거식** | 사람이 들어갈 수 있는 터널 |

$$
\text{\textbf{암거식}}\text{이 가장 좋다} \;-\; \text{점검・증설이 쉬우니}
$$

$$
\text{\textbf{비싸다}} \;-\; \text{그래서 도심 간선에만}
$$

### 지중 vs 가공

$$
\text{\textbf{pw.2.3에서 본 비교}}
$$

| | **가공** | **지중** |
|---|---|---|
| **값** | **싸다** | **비싸다** (10~20배) |
| **미관** | 나쁨 | **좋음** |
| **고장** | **많다** (뇌·바람) | **적다** |
| **고장 발견** | **쉽다** | **어렵다** |
| **복구** | **빠르다** | **느리다** |
| **정전용량** | 작다 | **크다** (페란티) |

$$
\text{\textbf{케이블은 } C \text{ 가 크다}}(\text{ct.1.8의 } Z_0 = \sqrt{L/C})
$$

$$
\text{\textbf{충전전류}}\text{가 크고 \textbf{페란티}}\text{가 심하다}(\text{pw.2.5})
$$

### 케이블 고장점 탐지

$$
\text{\textbf{머레이 루프법 ・ 펄스 레이더법 ・ 정전용량법}}
$$

$$
\text{\textbf{묻혀 있으니 눈으로 못 찾는다}} \;-\; \text{전기적으로 찾아야}
$$

$$
\text{\textbf{머레이 루프법}}\text{은 \textbf{휘트스톤 브리지}}(\text{ct.1.2})\text{의 응용}
$$

## 특수장소의 전선로

> KEC **224**

| 장소 | |
|---|---|
| **터널** | |
| **수상·수저** | |
| **교량** | |
| **급경사지** | |
| 지상 | |

$$
\text{\textbf{일반 규정으로 안 되는 곳}}
$$

$$
\text{\textbf{터널}}: \text{\textbf{사람이 상시 통행}}\text{하면 규정이 엄격}
$$

$$
\text{\textbf{수저}}(\text{水底}): \text{\textbf{물밑케이블}}(\text{kec.1.3의 122.4})
$$

## 정리

$$
\boxed{
\begin{array}{l|c|l}
\text{\textbf{도로}} & \mathbf{6}\ \mathrm{m} & \text{지표상} \\
\text{\textbf{철도・궤도}} & \mathbf{6.5}\ \mathrm{m} & \text{레일면상} \\
\text{\textbf{횡단보도교}} & \mathbf{3.5}\ \mathrm{m} & \text{노면상 (절연・케이블 } 3\mathrm{m}) \\
\text{\textbf{기타}} & \mathbf{5}\ \mathrm{m} & \text{지표상 (완화 } 4\mathrm{m})
\end{array}
}
$$

$$
\text{\textbf{무엇이 지나가느냐}} \;-\; \text{기차} > \text{트럭} > \text{차 없음} > \text{사람}
$$

$$
\boxed{
\begin{array}{l|c}
400\mathrm{V} \text{ 이하} & \mathbf{3.2}\ \mathrm{mm} \;(\text{절연 } \mathbf{2.6}) \\
400\mathrm{V} \text{ 초과 시가지} & \mathbf{5}\ \mathrm{mm} \\
400\mathrm{V} \text{ 초과 시가지 외} & \mathbf{4}\ \mathrm{mm}
\end{array}
}
$$

$$
\boxed{\text{지중 매설: 차량 압력 } \mathbf{1.0}\ \mathrm{m}, \text{ 기타 } \mathbf{0.6}\ \mathrm{m}}
$$

$$
\text{\textbf{나전선은 중성선・접지측만}}, \qquad 400\mathrm{V} \text{ 초과에 \textbf{DV 금지}}
$$
