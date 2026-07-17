---
id: kec.1.5
title: 접지시스템
status: reviewed
summary: 종별 접지공사가 폐지되고 계통·보호·피뢰 접지로 바뀌었다. 5과목에서 가장 크게 달라진 곳이다.
covers:
  - kec.1.5.1
  - kec.1.5.2
  - kec.1.5.3
formulas:
  - label: 접지시스템의 구분 (KEC 141-1)
    tex: \text{\textbf{계통접지} ・ \textbf{보호접지} ・ \textbf{피뢰시스템 접지}}
    note: '**목적**으로 나눈 것. 옛 제1종~특별 제3종은 **폐지**.'
  - label: 시설 종류 (KEC 141-2)
    tex: \text{\textbf{단독접지} ・ \textbf{공통접지} ・ \textbf{통합접지}}
    note: '**방식**으로 나눈 것. 구분과 종류는 다른 축이다.'
  - label: 구성요소 (KEC 142.1.1)
    tex: \text{\textbf{접지극} + \textbf{접지도체} + \textbf{보호도체}} + \text{기타 설비}
    note: 접지극은 **접지도체로 주접지단자에** 연결한다.
  - label: 접지도체 최소 단면적 (KEC 142.3.1)
    tex: \text{구리 저압 } \mathbf{6}\ \mathrm{mm^2}, \; \text{고압 이상 } \mathbf{16}\ \mathrm{mm^2}, \; \text{철 } \mathbf{50}\ \mathrm{mm^2}
    note: '**피뢰시스템이 접속되면** 구리 16㎟ 또는 철 50㎟ 이상.'
  - label: 중성점 접지용
    tex: \text{공칭단면적 } \mathbf{16}\ \mathrm{mm^2} \text{ 이상의 연동선}
    note: 조건에 따라 6㎟ 이상으로 완화되는 경우가 있다.
traps:
  - '**제1종~특별 제3종 접지공사는 폐지**되었다. 10Ω·100Ω 같은 종별 저항값은 이제 없다.'
  - '**구분(계통·보호·피뢰)과 종류(단독·공통·통합)는 다른 축**이다. 섞으면 안 된다.'
  - '**접지도체는 저압 6㎟, 고압 이상 16㎟**(구리). 피뢰시스템이 붙으면 저압도 16㎟.'
  - '**등전위본딩은 접지가 아니다.** 대지에 연결하는 게 아니라 서로 묶는 것.'
related:
  - kec.1.1
  - kec.1.6
  - pw.4.1
---

> KEC **140** (141 구분 및 종류 · 142 시설 · 143 등전위본딩) — 시행 2026. 1. 5. 기준
>
> **이 단원이 KEC에서 가장 크게 바뀌었다.** 옛 **제1종·제2종·제3종·특별 제3종
> 접지공사는 완전히 폐지**되었다. 그 체계로 공부한 자료는 **전부 무효**다.

## 무엇이 바뀌었나

| | **옛 판단기준** | **KEC** |
|---|---|---|
| **분류 기준** | **종별** (제1~3종, 특별 제3종) | **목적별** (계통·보호·피뢰) |
| **저항값** | **10Ω · 100Ω** 등 고정 | **조건에 따라 계산** |
| **체계** | 한국 고유 | **IEC 60364** |

$$
\boxed{\text{\textbf{종별 접지공사는 없어졌다}}}
$$

$$
\text{\textbf{"제3종 접지 100Ω"}}\text{ 같은 답은 \textbf{이제 오답}}
$$

### 왜 바꿨나

$$
\text{\textbf{종별은 "얼마나 위험한가"}}\text{로 나눴다} \;-\; \text{전압이 높으면 엄격하게}
$$

$$
\text{\textbf{목적별은 "무엇을 위한 접지인가"}}\text{로 나눈다}
$$

$$
\boxed{\text{\textbf{같은 접지극이라도 목적이 여럿}}}
$$

$$
\text{\textbf{하나의 접지극}}\text{이 계통접지도 보호접지도 될 수 있다}
$$

$$
\text{\textbf{종별로는 그걸 표현 못 한다}} \;-\; \text{그래서 축을 바꿨다}
$$

## 접지시스템의 구분 및 종류

> KEC **141**

$$
\boxed{\text{\textbf{두 개의 축}}\text{이 있다}}
$$

### 구분 — 목적으로 (141-1)

$$
\boxed{\text{\textbf{계통접지} ・ \textbf{보호접지} ・ \textbf{피뢰시스템 접지}}}
$$

| 구분 | 무엇을 | 왜 |
|---|---|---|
| **계통접지** | **전력계통의 한 점**을 대지에 | **계통의 안정** |
| **보호접지** | **노출도전부**를 대지에 | **감전 방지** |
| **피뢰시스템 접지** | 뇌전류를 대지로 | **뇌 보호** |

$$
\text{\textbf{목적이 다르니 요구도 다르다}}
$$

### 계통접지 vs 보호접지

$$
\text{\textbf{계통접지}}: \text{\textbf{중성점}}\text{을 접지} \;-\; \text{pw.4.1의 그것}
$$

$$
\text{\textbf{계통을 위한}} \;-\; \text{이상전압 억제, 보호계전기 동작}
$$

$$
\text{\textbf{보호접지}}: \text{\textbf{기기 외함}}\text{을 접지} \;-\; \text{사람을 위한}
$$

$$
\text{\textbf{고장보호}}(\text{kec.1.1의 113.2})\text{를 위한 것}
$$

$$
\boxed{\text{\textbf{계통접지는 계통을, 보호접지는 사람을}}}
$$

**pw.4.1의 중성점 접지방식**(직접·비접지·저항·소호리액터)이 **계통접지**다. 거기서
"지락전류를 얼마나 흘릴 것인가"를 다뤘다.

$$
\text{\textbf{보호접지는 다른 이야기}} \;-\; \text{만졌을 때 안 죽게}
$$

### 종류 — 방식으로 (141-2)

$$
\boxed{\text{\textbf{단독접지} ・ \textbf{공통접지} ・ \textbf{통합접지}}}
$$

| 종류 | 무엇 |
|---|---|
| **단독접지** | **따로따로** 접지극 |
| **공통접지** | **고압·특고압과 저압**의 접지극을 공용 |
| **통합접지** | **전기설비 + 통신 + 피뢰**까지 전부 공용 |

$$
\text{\textbf{공용하는 범위}}\text{가 넓어진다}
$$

$$
\text{단독} \to \text{공통} \to \text{통합}
$$

### 구분과 종류를 헷갈리지 마라

$$
\boxed{\text{\textbf{구분}}(\text{계통・보호・피뢰}) \;\neq\; \text{\textbf{종류}}(\text{단독・공통・통합})}
$$

$$
\text{\textbf{구분은 "왜"}}, \qquad \text{\textbf{종류는 "어떻게"}}
$$

$$
\text{\textbf{다른 축}}\text{이다} \;-\; \text{시험 함정}
$$

$$
\text{\textbf{보호접지를 통합접지로}} \text{ 할 수 있다} \;-\; \text{둘이 동시에 성립}
$$

### 왜 통합접지가 나왔나

$$
\text{\textbf{따로 접지하면}} \;\Longrightarrow\; \text{\textbf{접지극 사이에 전위차}}
$$

$$
\text{\textbf{한쪽에 지락}} \;\Longrightarrow\; \text{그 접지극의 전위가 뜸} \;\Longrightarrow\; \text{\textbf{다른 접지극과 전위차}}
$$

$$
\text{\textbf{두 접지에 동시에 닿으면}} \;\Longrightarrow\; \text{\textbf{감전}}
$$

$$
\boxed{\text{\textbf{따로 하는 게 오히려 위험}}}
$$

$$
\text{\textbf{다 묶으면}} \;\Longrightarrow\; \text{\textbf{전위가 같이 뜬다}} \;\Longrightarrow\; \text{\textbf{전위차가 없다}}
$$

$$
\text{\textbf{등전위}}\text{의 사상} \;-\; \text{143의 등전위본딩과 같은 생각}
$$

$$
\text{\textbf{대신 한쪽 사고가 전체에}} \;-\; \text{그래서 \textbf{서지보호장치}}(\text{SPD})\text{가 필요}
$$

**건물 안에서는 통합접지가 표준**이 되었다. 옛날엔 따로 하는 게 원칙이었는데 뒤집혔다.

## 접지시스템의 시설

> KEC **142**

### 구성요소 (142.1.1)

$$
\boxed{\text{\textbf{접지극} + \textbf{접지도체} + \textbf{보호도체}} + \text{기타 설비}}
$$

$$
\text{\textbf{접지극은 접지도체로 주접지단자에 연결}}
$$

$$
\text{KS C IEC 60364-5-54}\text{에 의한다} \;-\; \text{국제 표준}
$$

### 전류가 흐르는 길

$$
\text{\textbf{노출도전부}} \to \text{\textbf{보호도체}}(\text{PE}) \to \text{\textbf{주접지단자}} \to \text{\textbf{접지도체}} \to \text{\textbf{접지극}} \to \text{대지}
$$

$$
\boxed{\text{\textbf{주접지단자가 중심}}}
$$

$$
\text{\textbf{모든 게 여기 모인다}} \;-\; \text{보호도체 ・ 접지도체 ・ 등전위본딩도체}
$$

$$
\text{\textbf{한 점에서 만나야}} \;-\; \text{전위 기준점}
$$

### 접지도체의 최소 단면적 (142.3.1)

$$
\boxed{
\begin{array}{l|c}
\text{\textbf{구리} — 저압} & \mathbf{6}\ \mathrm{mm^2} \\
\text{\textbf{구리} — 고압 이상} & \mathbf{16}\ \mathrm{mm^2} \\
\text{\textbf{철}} & \mathbf{50}\ \mathrm{mm^2}
\end{array}
}
$$

$$
\text{\textbf{피뢰시스템이 접속되면}} \;\Longrightarrow\; \textbf{구리 } \text{ 16} \  \mathrm{mm^2} \text{ 또는 철 } \text{ 50} \  \mathrm{mm^2} \text{ 이상}
$$

$$
\boxed{\text{\textbf{저압이라도 피뢰가 붙으면 16㎟}}}
$$

$$
\text{\textbf{뇌전류가 크니}} \;-\; \text{수십 kA}(\text{kec.1.6})
$$

### 특고압·고압 전기설비용 (142.3.1-4)

$$
\text{단면적 } \mathbf{6}\ \mathrm{mm^2} \text{ 이상의 \textbf{연동선}}
$$

### 중성점 접지용

$$
\boxed{\text{공칭단면적 } \mathbf{16}\ \mathrm{mm^2} \text{ 이상의 연동선}}
$$

$$
\textbf{조건에 따라 } \text{ 6} \  \mathrm{mm^2} \text{ 이상으로 완화}\text{되는 경우가 있다}
$$

$$
\text{\textbf{중성점은 지락전류가 다 지나가는 길}} \;-\; \text{그래서 굵게}
$$

**pw.4.1의 직접접지**에서 지락전류가 크다고 했다. 그게 이 도체로 흐른다.

### 이동용

| | 단면적 |
|---|---|
| **캡타이어케이블 등** | $10\ \mathrm{mm^2}$ 이상 |
| **다심 코드·캡타이어 1개 도체** | $0.75\ \mathrm{mm^2}$ 이상 |
| 기타 유연성 연동연선 | $1.5\ \mathrm{mm^2}$ 이상 |

$$
\text{\textbf{이동용은 가늘어도} 된다} \;-\; \text{대신 유연해야}
$$

## 감전보호용 등전위본딩

> KEC **143**

$$
\boxed{\text{\textbf{도전부를 서로 접속}}\text{해 \textbf{전위를 같게}}}
$$

$$
\text{\textbf{접지가 아니다}} \;-\; \text{대지에 연결하는 게 아니라 \textbf{서로} 묶는 것}
$$

$$
\text{\textbf{시험 함정}}
$$

### 왜 필요한가

$$
\text{\textbf{전위차가 있어야 전류가 흐른다}} \;-\; \text{ct.1.1}
$$

$$
\text{\textbf{만지는 두 곳의 전위가 같으면}} \;\Longrightarrow\; \text{\textbf{전류가 안 흐른다}} \;\Longrightarrow\; \text{\textbf{안전}}
$$

$$
\boxed{\text{\textbf{전위를 0으로 만드는 게 아니라 같게 만드는 것}}}
$$

$$
\text{\textbf{전위가 같이 떠도 상관없다}} \;-\; \text{손과 발 사이에 차이가 없으면}
$$

**새가 전선에 앉아도 안 죽는 이유**와 같다. 두 발의 전위가 같다.

$$
\text{\textbf{접지는 전위를 낮추고}}, \qquad \text{\textbf{본딩은 전위를 같게}}
$$

$$
\text{\textbf{둘 다 필요}} \;-\; \text{목적이 다르다}
$$

### 무엇을 묶나

| 대상 | 예 |
|---|---|
| **노출도전부** | 기기 외함 (kec.1.1) |
| **계통외도전부** | **수도관 · 가스관 · 철골** |
| **주접지단자** | |

$$
\text{\textbf{계통외도전부가 핵심}} \;-\; \text{전기설비가 아닌데 전위를 옮긴다}
$$

$$
\text{\textbf{수도관을 통해 다른 건물의 전위}}\text{가 들어올 수 있다}
$$

$$
\text{\textbf{그래서 묶어야}}
$$

### 종류

| 종류 | 어디 |
|---|---|
| **보호등전위본딩** | **건물 인입구** — 주접지단자에 |
| **보조 보호등전위본딩** | **국부적으로** (욕실 등) |
| 비접지 국부등전위본딩 | 특수한 곳 |

$$
\text{\textbf{욕실}}\text{에 보조 본딩} \;-\; \text{물이 있어 위험하니}
$$

$$
\text{\textbf{인체 저항이 물에 젖으면 급감}}\text{한다} \;-\; \text{같은 전압에 더 위험}
$$

## 정리

$$
\boxed{\text{\textbf{구분}}: \text{계통접지 ・ 보호접지 ・ 피뢰시스템 접지} \;-\; \text{\textbf{목적}}}
$$

$$
\boxed{\text{\textbf{종류}}: \text{단독접지 ・ 공통접지 ・ 통합접지} \;-\; \text{\textbf{방식}}}
$$

$$
\boxed{\text{\textbf{구성}}: \text{접지극 + 접지도체 + 보호도체}}
$$

| 접지도체 | 최소 단면적 |
|---|---|
| **구리 · 저압** | **6㎟** |
| **구리 · 고압 이상** | **16㎟** |
| **철** | **50㎟** |
| **피뢰 접속 시** | **구리 16㎟ / 철 50㎟** |
| **중성점 접지용** | **16㎟** (조건부 6㎟) |

$$
\boxed{\text{\textbf{종별 접지공사는 폐지}}} \;-\; \text{10Ω ・ 100Ω 은 이제 없다}
$$

$$
\text{\textbf{등전위본딩은 접지가 아니다}} \;-\; \text{서로 묶어 \textbf{전위를 같게}}
$$
