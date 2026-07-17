---
id: kec.5.1
title: 통칙
status: reviewed
summary: 분산형 전원의 최대 숙제는 단독운전 방지다. 계통이 죽었는데 혼자 살아 있으면 위험하다.
covers:
  - kec.5.1.1
  - kec.5.1.2
  - kec.5.1.3
formulas:
  - label: 단독운전 방지 (KEC 503)
    tex: \text{계통 정전 시} \;\Longrightarrow\; \text{\textbf{분산형 전원도 분리}}
    note: 계통이 죽었는데 혼자 살면 작업자 감전·기기 손상.
  - label: 직류 검출 (KEC 503)
    tex: \text{인버터 교류출력에 \textbf{직류 검출}} \;-\; \text{최대 정격의 } \mathbf{0.5\%} \text{ 초과 시 차단}
    note: 인버터가 계통에 직류를 흘리면 변압기 포화.
  - label: MPPT (KEC 502)
    tex: \text{\textbf{최대전력점 추종}} \;-\; \text{현재 조건에서 가능한 최대 전력}
    note: 태양광·풍력의 출력을 최대로. 승압 초퍼(mc.3.3).
traps:
  - '**단독운전 방지가 최대 숙제**다. 계통이 죽으면 분산형 전원도 멈춰야 한다.'
  - '**인버터의 직류 유출은 0.5% 초과 시 차단**한다. 변압기가 포화하니.'
  - '**MPPT는 최대전력점 추종**이다. 태양광·풍력의 출력을 최대로.'
related:
  - mc.5.6
  - mc.3.3
  - pw.5.4
---

> KEC **500** (501 일반사항 · 502 용어 · 503 계통 연계설비의 시설) — 시행 2026. 1. 5. 기준

## 일반사항

> KEC **501**

$$
\boxed{\text{\textbf{분산형 전원}}(\text{DER})}
$$

$$
\text{\textbf{큰 발전소가 아니라 곳곳에 흩어진} 전원}
$$

| 종류 | |
|---|---|
| **태양광** | kec.5.3 |
| **풍력** | kec.5.4 |
| **연료전지** | kec.5.5 |
| **전기저장장치** | kec.5.2 |

$$
\text{\textbf{계통에 연계}}\text{하거나 \textbf{독립}}\text{으로}
$$

$$
\text{\textbf{재생에너지가 늘며 중요해진 단원}}
$$

## 용어 정의

> KEC **502**

| 용어 | 뜻 |
|---|---|
| **MPPT** | **최대전력점 추종** |
| **풍력터빈** | 바람 → 기계 에너지 |
| **나셀** | 풍력터빈의 발전기 집 |
| **자동정지** | 보호장치 작동 시 자동 정지 |
| **PCS** | 전력변환장치 (인버터) |

### MPPT

$$
\boxed{\text{\textbf{최대전력점 추종}} \;-\; \text{Maximum Power Point Tracking}}
$$

$$
\text{\textbf{태양광・풍력은 조건이 변한다}} \;-\; \text{일사량・풍속}
$$

$$
\text{\textbf{매 순간 최대 전력이 나오는 점}}\text{을 쫓는다}
$$

$$
\text{\textbf{승압 초퍼}}(\text{mc.3.3})\text{로 전압을 조절}
$$

$$
\text{\textbf{전압을 바꿔가며}} \;\Longrightarrow\; \text{\textbf{전력이 최대인 점}}\text{을 찾는다}
$$

$$
P = VI \;-\; V \text{ 를 바꾸면 } I \text{ 가 변하고 } P \text{ 가 봉우리}
$$

$$
\boxed{\text{\textbf{ct.1.2의 최대 전력 전달}}\text{과 발상이 통한다}}
$$

## 분산형전원 계통 연계설비의 시설

> KEC **503** — 핵심

$$
\boxed{\text{\textbf{단독운전 방지}}\text{가 최대 숙제}}
$$

### 단독운전이란

$$
\text{\textbf{계통이 정전}}\text{됐는데 \textbf{분산형 전원이 혼자 살아 있는} 상태}
$$

$$
\boxed{\text{\textbf{계통 정전} \;+\; \textbf{분산형 전원 가동} = \textbf{단독운전}}}
$$

### 왜 위험한가

| 위험 | |
|---|---|
| **작업자 감전** | 정전인 줄 알고 만졌는데 살아 있음 |
| **기기 손상** | 복전 시 위상 안 맞아 충격 |
| **화재** | |

$$
\boxed{\text{\textbf{정전인 줄 알았는데 전기가 있다}}}
$$

$$
\text{\textbf{한전이 선로를 죽였는데}} \;\Longrightarrow\; \text{\textbf{태양광이 거꾸로 전기를 보냄}}
$$

$$
\text{\textbf{작업자가 감전}} \;-\; \text{가장 무서운 시나리오}
$$

### 대책

$$
\text{\textbf{계통 정전 시}} \;\Longrightarrow\; \text{\textbf{분산형 전원도 즉시 분리}}
$$

$$
\text{\textbf{전압・주파수가 정상 범위에 들 때까지 분리 유지}}
$$

| 검출 방법 | |
|---|---|
| **수동적** | 전압·주파수 이상 감지 |
| **능동적** | 신호를 넣어 반응 관찰 |

$$
\boxed{\text{\textbf{mc.5.6의 유도발전기}}\text{는 저절로 방지}}
$$

$$
\text{\textbf{유도발전기}}\text{는 계통이 없으면 여자가 안 돼 \textbf{저절로 멈춘다}}(\text{mc.5.6})
$$

$$
\text{\textbf{그런데 인버터 전원은 스스로 돌 수 있다}} \;-\; \text{그래서 방지장치가 필요}
$$

$$
\text{\textbf{역전력계전기}}(\text{pw.1.6의 32번})\text{도}
$$

### 직류 유출 방지

$$
\boxed{\text{인버터 교류출력에 \textbf{직류 검출} — } \mathbf{0.5\%} \text{ 초과 시 차단}}
$$

$$
\text{\textbf{인버터가 계통에 직류를 흘리면}} \;\Longrightarrow\; \text{\textbf{변압기 포화}}(\text{mc.4.1})
$$

$$
\text{직류는 } \dfrac{d\phi}{dt} = 0 \;\Longrightarrow\; \text{한쪽으로 자화} \;\Longrightarrow\; \text{포화}
$$

$$
\textbf{최대 정격 출력전류의 } \text{ 0.5} \%\text{를 넘으면 차단}
$$

$$
\boxed{\text{\textbf{인버터의 불완전성}}\text{을 감시}}
$$

### 이상·고장 시 분리

$$
\text{\textbf{분산형 전원의 이상}} \;\text{또는}\; \text{\textbf{계통의 이상}} \;\Longrightarrow\; \text{분리}
$$

$$
\text{\textbf{양쪽을 다 감시}} \;-\; \text{어느 쪽이 잘못돼도}
$$

### 250kVA 이상

$$
\textbf{한 사업장 설비 용량 합계 } \text{ 250} \  \mathrm{kVA} \text{ 이상}\text{이면}
$$

$$
\text{\textbf{추가 보호장치}}\text{가 필요}
$$

$$
\text{\textbf{클수록 계통에 미치는 영향이 크니}}
$$

## 왜 분산형이 어려운가

$$
\text{\textbf{계통은 원래 한 방향}}\text{으로 설계됐다}
$$

$$
\textbf{발전소} \to \text{송전} \to \text{배전} \to \text{수용가}
$$

$$
\text{\textbf{분산형은 거꾸로}} \;-\; \text{수용가가 발전}
$$

$$
\boxed{\text{\textbf{역조류}} \;-\; \text{역방향 전력}}
$$

$$
\text{\textbf{전압이 거꾸로 오른다}} \;-\; \text{보호계전기가 헷갈린다}
$$

$$
\text{\textbf{pw.2.5의 페란티}}\text{처럼 전압 상승}
$$

$$
\boxed{\text{\textbf{계통이 양방향이 되며 규정이 복잡해졌다}}}
$$

## 정리

$$
\boxed{\text{\textbf{단독운전 방지}}\text{가 최대 숙제}}
$$

$$
\text{계통 정전} \;\Longrightarrow\; \text{분산형도 분리} \;-\; \text{작업자 감전 방지}
$$

$$
\boxed{\text{인버터 직류 유출 } \mathbf{0.5\%} \text{ 초과 시 차단}}
$$

$$
\boxed{\text{\textbf{MPPT}} = \text{최대전력점 추종}}(\text{mc.3.3 초퍼})
$$

$$
\text{\textbf{mc.5.6의 유도발전기}}\text{는 단독운전이 저절로 방지} \;-\; \text{계통이 없으면 못 도니}
$$
