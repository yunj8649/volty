---
id: kec.4.2
title: 전기철도의 전기방식
status: reviewed
summary: 직류는 1500V, 교류는 25000V가 표준이다. 직류는 도시철도, 교류는 고속·간선이다.
covers:
  - kec.4.2.1
formulas:
  - label: 급전전압 공칭값 (KEC 표 411.2)
    tex: \text{\textbf{직류}} \; 750 \cdot \mathbf{1{,}500}\ \mathrm{V}, \qquad \text{\textbf{교류}} \; \mathbf{25{,}000} \cdot 50{,}000\ \mathrm{V}
    note: 직류 1500이 지하철, 교류 25000이 고속철도.
  - label: 수전전압 (KEC 표 411.1)
    tex: \text{교류 3상 } \mathbf{22.9} \cdot 154 \cdot 345\ \mathrm{kV}
    note: pw.1.2의 배전·송전 전압. 한전에서 받는다.
  - label: AT 급전 (표 411.2-2 각주)
    tex: \text{급전선~전차선 } \mathbf{50}\ \mathrm{kV}, \qquad \text{전차선~레일 } \mathbf{25}\ \mathrm{kV}
    note: 단권변압기(AT)로 전압을 두 배로. 유도장해 감소.
traps:
  - '**직류 공칭 1500V, 교류 공칭 25000V**다. 직류는 도시철도, 교류는 고속·간선.'
  - '**AT급전은 급전선-전차선 50kV, 전차선-레일 25kV**다. 전압을 두 배로 써 손실을 줄인다.'
  - '**수전은 22.9/154/345kV**로 pw.1.2의 계통 전압과 같다.'
  - '**교류는 단상**이다. 3상 부하를 단상으로 거니 불평형이 문제(kec.4.7).'
related:
  - pw.1.2
  - mc.4.5
  - kec.4.3
---

> KEC **410** (411 전기방식의 일반사항) — 시행 2026. 1. 5. 기준

## 전기방식의 일반사항

> KEC **411**

## 전력수급조건 (411.1)

$$
\boxed{\text{수전전압: 교류 3상 } \mathbf{22.9} \cdot \mathbf{154} \cdot \mathbf{345}\ \mathrm{kV}}
$$

$$
\text{\textbf{한전에서 받는 전압}}(\text{pw.1.2})
$$

$$
\text{\textbf{부하 크기・지리・전압강하}}\text{를 고려해 선정}
$$

$$
\text{\textbf{비상시 예비선로}}\text{를 확보}(\text{kec.1.2의 113.7})
$$

$$
\text{\textbf{철도는 정전이 곧 마비}} \;-\; \text{예비가 필수}
$$

### 계통에 주는 영향

$$
\text{\textbf{3상 단락전류・전압불평형・전압왜형율・플리커}}\text{를 고려}
$$

$$
\text{\textbf{철도는 나쁜 부하}} \;-\; \text{계통을 괴롭힌다}
$$

$$
\boxed{\text{\textbf{단상・급변・고조파}}} \;-\; \text{세 가지 문제}
$$

$$
\text{\textbf{기차가 가속하면}} \;\Longrightarrow\; \text{\textbf{전력이 급변}} \;\Longrightarrow\; \text{\textbf{플리커}}
$$

$$
\text{\textbf{인버터 제어}} \;\Longrightarrow\; \text{\textbf{고조파}}(\text{pw.7.3})
$$

## 전차선로의 전압 (411.2)

$$
\boxed{\text{\textbf{직류방식} 과 \textbf{교류방식}}}
$$

### 직류방식 (표 411.2-1)

$$
\boxed{
\begin{array}{l|c|c}
\text{구분} & \text{\textbf{공칭전압}} & \text{장기 과전압} \\ \hline
\text{직류 1} & \mathbf{750}\ \mathrm{V} & 1{,}269\ \mathrm{V} \\
\text{직류 2} & \mathbf{1{,}500}\ \mathrm{V} & 2{,}538\ \mathrm{V}
\end{array}
}
$$

$$
\text{\textbf{750}}: \text{노면전차 ・ 경전철} \qquad \text{\textbf{1,500}}: \text{\textbf{지하철 ・ 도시철도}}
$$

$$
\textbf{회생제동 시 } \text{ 1{,}000} \  \mathrm{V} \text{ 의 최고 비영구 전압 허용}(750 \text{ 계통})
$$

$$
\text{\textbf{mc.5.3의 회생제동}} \;-\; \text{전차가 발전해서 전압이 오른다}
$$

### 교류방식 (표 411.2-2)

$$
\boxed{
\begin{array}{l|c|c}
\text{주파수} & \text{\textbf{공칭전압}} & \text{장기 과전압} \\ \hline
60\ \mathrm{Hz} & \mathbf{25{,}000}\ \mathrm{V} & 38{,}746\ \mathrm{V} \\
60\ \mathrm{Hz} & \mathbf{50{,}000}\ \mathrm{V} & 77{,}492\ \mathrm{V}
\end{array}
}
$$

$$
\text{\textbf{25,000}}: \text{\textbf{고속철도 ・ 간선}} \qquad \text{\textbf{50,000}}: \text{AT 급전}
$$

$$
\text{\textbf{단상 교류}} \;-\; \text{3상이 아니다}
$$

## AT 급전 — 50kV의 비밀

$$
\boxed{\text{급전선~전차선 } \mathbf{50}\ \mathrm{kV}, \qquad \text{전차선~레일 } \mathbf{25}\ \mathrm{kV}}
$$

$$
\text{\textbf{표 411.2-2의 각주}} \;-\; \text{공칭전압 } 50\ \mathrm{kV} \text{ 는 급전선-전차선 사이}
$$

### 왜 두 전압인가

$$
\text{\textbf{단권변압기}}(\text{AT}, \text{Auto Transformer})\text{를 쓴다}(\text{mc.4.11})
$$

$$
\textbf{급전선 } \text{ +25} \  \mathrm{kV} \text{, } \; \text{전차선 } \text{ -25} \  \mathrm{kV} \;\Longrightarrow\; \text{사이 } 50\ \mathrm{kV}
$$

$$
\textbf{전차는 전차선-레일 } \text{ 25} \  \mathrm{kV}\text{를 쓴다}
$$

$$
\boxed{\text{\textbf{전송은 50kV, 사용은 25kV}}}
$$

### 왜 좋은가

$$
\text{\textbf{높은 전압으로 전송}} \;\Longrightarrow\; \text{\textbf{전류가 작다}}(\text{pw.2.1})
$$

$$
P = VI \;\Longrightarrow\; V \uparrow \;\Longrightarrow\; I \downarrow \;\Longrightarrow\; \text{손실} \downarrow
$$

$$
\text{\textbf{전압강하 감소 ・ 급전거리 연장}}
$$

$$
\boxed{\text{\textbf{유도장해 감소}}} \;-\; \text{가장 큰 이점}
$$

$$
\text{\textbf{급전선과 전차선의 전류가 반대 방향}} \;\Longrightarrow\; \text{\textbf{자계가 상쇄}}
$$

$$
\text{\textbf{왕복 전류가 가까이}} \;\Longrightarrow\; \text{먼 곳의 통신선에 미치는 유도} \downarrow
$$

$$
\text{\textbf{mc.4.5의 스코트 결선}}\text{과 함께 철도 급전의 핵심}
$$

### 급전 방식 비교

| 방식 | |
|---|---|
| **직접급전** | 단순, 유도장해 큼 |
| **BT 급전** | **흡상변압기** — 유도 감소 |
| **AT 급전** | **단권변압기** — **표준** |

$$
\text{\textbf{AT가 현대 표준}} \;-\; \text{고속철도}
$$

$$
\text{\textbf{BT는 흡상변압기}}(\text{Booster}) \;-\; \text{옛 방식}
$$

## 직류 vs 교류 — 철도의 선택

| | **직류** | **교류** |
|---|---|---|
| **공칭전압** | **1,500V** | **25,000V** |
| **전압** | 낮다 | **높다** |
| **전류** | **크다** | 작다 |
| **급전거리** | **짧다** (변전소 촘촘히) | 길다 |
| **차량** | **간단** (옛날) | 변압기 필요 |
| **유도장해** | 적다 | **크다** |
| **용도** | **지하철** | **고속·간선** |

$$
\boxed{\text{\textbf{직류는 도시, 교류는 장거리}}}
$$

### 왜 지하철은 직류인가

$$
\text{\textbf{직류는 유도장해가 적다}} \;-\; \text{지하는 통신선이 가까이}
$$

$$
\text{\textbf{교류는 변압기・정류}}\text{가 차량에} \;-\; \text{무겁고 복잡}
$$

$$
\text{\textbf{역이 촘촘}}\text{하니 급전거리가 짧아도 된다}
$$

$$
\boxed{\text{\textbf{직류의 단점}(\text{급전거리 짧음)}\text{이 지하철엔 문제 안 됨}}}
$$

### 왜 고속철도는 교류인가

$$
\text{\textbf{높은 전압}} \;\Longrightarrow\; \text{전류가 작아 \textbf{급전거리가 길다}}
$$

$$
\text{\textbf{변전소를 드물게}} \;-\; 50 \sim 100\ \mathrm{km} \text{ 마다}
$$

$$
\text{\textbf{장거리}}\text{에 유리}
$$

$$
\text{\textbf{인버터 제어}}(\text{VVVF}, \text{mc.5.4})\text{로 교류의 차량 복잡성을 극복}
$$

$$
\boxed{\text{\textbf{반도체가 교류 철도를 살렸다}}}
$$

**mc.5.4의 인버터**가 여기서도 판을 바꿨다. 옛날엔 교류 차량이 무거웠는데, 인버터로
유도전동기를 제어하니 가벼워졌다.

### 직류의 전식 문제

$$
\text{\textbf{직류 귀선전류}}\text{가 레일에서 땅으로 샌다}
$$

$$
\text{\textbf{전식}}(\text{電蝕}) \;-\; \text{금속 매설물이 녹는다}(\text{kec.2.5})
$$

$$
\text{\textbf{직류는 이온을 한 방향으로}} \;-\; \text{수도관・가스관이 부식}
$$

$$
\boxed{\text{\textbf{교류에는 없는 문제}}} \;-\; \text{방향이 바뀌니 상쇄}
$$

$$
\text{\textbf{배류법}}\text{으로 대책} \;-\; \text{샌 전류를 되돌린다}
$$

## 정리

$$
\boxed{\text{\textbf{직류} } 750 \cdot \mathbf{1{,}500}\ \mathrm{V}, \qquad \text{\textbf{교류} } \mathbf{25{,}000} \cdot 50{,}000\ \mathrm{V}}
$$

$$
\boxed{\text{수전 교류 3상 } 22.9 \cdot 154 \cdot 345\ \mathrm{kV}}(\text{pw.1.2})
$$

$$
\boxed{\text{\textbf{AT급전}}: \text{급전선~전차선 } 50\ \mathrm{kV}, \text{ 전차선~레일 } 25\ \mathrm{kV}}
$$

| | 직류 | 교류 |
|---|---|---|
| **전압** | 1,500V | 25,000V |
| **용도** | **지하철** | **고속·간선** |
| **약점** | 전식·급전거리 | 유도장해·단상 |

$$
\text{\textbf{직류는 도시, 교류는 장거리}} \;-\; \text{유도장해와 급전거리의 거래}
$$
