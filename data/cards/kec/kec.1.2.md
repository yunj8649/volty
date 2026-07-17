---
id: kec.1.2
title: 일반사항
status: reviewed
summary: 여섯 가지 보호가 서로 다른 사고를 막는다. 과전류와 고장전류가 왜 따로인지가 핵심이다.
covers:
  - kec.1.2.1
  - kec.1.2.2
formulas:
  - label: 여섯 가지 보호 (KEC 113)
    tex: \text{\textbf{감전} ・ \textbf{열} ・ \textbf{과전류} ・ \textbf{고장전류} ・ \textbf{전압외란} ・ \textbf{전원중단}}
    note: 113.2 ~ 113.7. 각각 다른 사고를 막는다.
  - label: 과전류 vs 고장전류
    tex: \text{\textbf{과전류}}(113.4) \to \text{\textbf{과부하} + 단락}, \qquad \text{\textbf{고장전류}}(113.5) \to \text{\textbf{허용온도}}
    note: 과전류는 **전류의 크기**, 고장전류는 **도체의 온도**가 관심.
  - label: 보호의 두 방법
    tex: \text{\textbf{크기를 제한}} \;\text{또는}\; \text{\textbf{지속시간을 제한}}
    note: '**전류 × 시간**이 위험을 정하니 둘 중 하나만 잡아도 된다.'
  - label: 적용범위 (KEC 111.1)
    tex: \text{\textbf{인축의 감전}} + \text{\textbf{설비의 안전}}\text{에 필요한 성능과 요구사항}
    note: 사람과 가축, 그리고 설비.
traps:
  - '**과전류(113.4)와 고장전류(113.5)는 다른 조**다. 과부하·단락 vs 허용온도 상승.'
  - '**보호 방법은 크기 제한 또는 시간 제한**이다. 둘 다 할 필요는 없다.'
  - '**전원공급 중단도 보호 대상**(113.7)이다. 정전이 위험한 곳이 있다.'
  - '**전자기 장애(EMC)도 규정**에 들어 있다(113.6). 옛 기준엔 없던 것.'
related:
  - kec.1.1
  - mc.7.4
  - kec.2.2
---

> KEC **110** (111 통칙 · 113 안전을 위한 보호) — 시행 2026. 1. 5. 기준
>
> **kec.1.1과 같은 조문**을 다룬다. 거기서 **감전 보호**를 봤으니 여기서는 **나머지
> 다섯**을 본다.

## 통칙

> KEC **111**

### 적용범위 (111.1)

$$
\boxed{\text{\textbf{인축의 감전}}\text{에 대한 보호} + \text{\textbf{설비의 안전}}}
$$

| 대상 | |
|---|---|
| **인축의 감전** | 사람과 **가축** |
| **전기설비 계통** | |
| **시설물** | |
| **발전용 수력설비** | |
| **발전용 화력설비** | |
| **발전설비 용접** | |

$$
\text{\textbf{안전에 필요한 성능과 기술적 요구사항}}
$$

$$
\text{\textbf{가축이 명시}}\text{된다} \;-\; \text{축사에 적용}(\text{kec.1.1의 113.1})
$$

$$
\text{\textbf{가축은 사람보다 감전에 약하다}} \;-\; \text{네 발이 땅에 닿아 있으니}
$$

**보폭전압**이 사람보다 위험하다. 앞발과 뒷발 사이가 멀어 전위차가 크다.

$$
\text{\textbf{그래서 축사는 등전위본딩}}\text{이 중요}(\text{kec.1.5})
$$

### 전압의 구분

$$
\text{\textbf{kec.1.1에서 다뤘다}} \;-\; \text{저압 교류 } 1\ \mathrm{kV} \cdot \text{직류 } 1.5\ \mathrm{kV}
$$

## 안전을 위한 보호

> KEC **113**

$$
\boxed{
\begin{array}{c|l}
\mathbf{113.2} & \textbf{감전} \\
\mathbf{113.3} & \textbf{열 영향} \\
\mathbf{113.4} & \textbf{과전류} \\
\mathbf{113.5} & \textbf{고장전류} \\
\mathbf{113.6} & \textbf{전압외란 ・ 전자기 장애} \\
\mathbf{113.7} & \textbf{전원공급 중단}
\end{array}
}
$$

$$
\text{\textbf{여섯 가지가 서로 다른 사고}}\text{를 막는다}
$$

### 일반 사항 (113.1)

$$
\text{\textbf{위험과 장애로부터 인축 및 재산}}\text{을 안전하게}
$$

$$
\text{\textbf{가축의 안전}}\text{을 위한 요구사항은 \textbf{가축을 사육하는 장소}}\text{에 적용}
$$

## 감전에 대한 보호 (113.2)

$$
\text{\textbf{kec.1.1에서 자세히}} \;-\; \text{\textbf{기본보호}}(\text{직접접촉}) + \text{\textbf{고장보호}}(\text{간접접촉})
$$

$$
\text{\textbf{여섯 중 가장 중요}} \;-\; \text{사람이 죽으니}
$$

$$
\text{\textbf{kec.2.2}}\text{에서 구체적 방법}(\text{TN・TT・IT, SELV・PELV})
$$

## 열 영향에 대한 보호 (113.3)

$$
\boxed{\text{\textbf{고온 또는 전기 아크}}\text{로 \textbf{가연물이 발화・손상}}\text{되지 않도록}}
$$

$$
\text{\textbf{정상 작동 시 인축이 화상을 입지 않도록}}
$$

$$
\text{\textbf{두 가지}}\text{를 막는다}
$$

| | 무엇 |
|---|---|
| **화재** | 가연물의 발화 |
| **화상** | 사람이 데는 것 |

$$
\text{\textbf{정상적으로 작동할 때도}} \;-\; \text{고장이 아니어도 뜨거우면 안 된다}
$$

$$
\text{\textbf{전기화재의 원인}}
$$

| 원인 | |
|---|---|
| **접속 불량** | 국부 발열 (kec.1.3의 123) |
| **과부하** | $I^2R$ |
| **단락** | 아크 |
| **누전** | 트래킹 |
| **아크** | mc.7.5의 그것 |

$$
\text{\textbf{kec.1.3의 "전기저항을 증가시키지 말 것"}}\text{이 이 보호를 위한 것}
$$

$$
\text{\textbf{접속 불량은 열동계전기가 못 잡는다}}(\text{mc.7.4}) \;-\; \text{전체 전류는 정상이니}
$$

$$
\boxed{\text{\textbf{그래서 시공 규정이 까다롭다}}}
$$

## 과전류에 대한 보호 (113.4)

$$
\boxed{\text{\textbf{과열 또는 전기・기계적 응력}}\text{에 의한 위험 방지}}
$$

$$
\text{\textbf{방법}}: \text{\textbf{과전류가 흐르는 것을 방지}} \;\text{또는}\; \text{\textbf{지속시간을 제한}}
$$

$$
\text{\textbf{과전류}} = \text{\textbf{과부하} + \textbf{단락}}
$$

| | 크기 | 시간 | 막는 것 |
|---|---|---|---|
| **과부하** | **작다** ($1.5 \sim 2$ 배) | **길다** | **THR · EOCR** |
| **단락** | **크다** (수십 배) | **짧다** | **퓨즈 · 차단기** |

$$
\text{\textbf{mc.7.4에서 본 그것}} \;-\; \text{시간 영역을 나눠 지킨다}
$$

$$
\text{\textbf{전기・기계적 응력}}\text{도 명시} \;-\; \text{큰 전류는 \textbf{전자력}}\text{을 만든다}
$$

$$
F = BIl \;\Longrightarrow\; I \text{ 가 크면 도체가 \textbf{휜다}}(\text{em.5})
$$

$$
\text{\textbf{단락 시 모선이 튕겨나간다}} \;-\; \text{전류의 제곱에 비례하는 힘}
$$

**pw.3.4의 단락전류**가 만드는 **전자력**이다. 수십 kA면 도체가 물리적으로 파괴된다.

## 고장전류에 대한 보호 (113.5)

$$
\boxed{\text{\textbf{허용온도 상승 한계}}\text{에 도달하지 않도록}}
$$

$$
\text{\textbf{고장전류가 흐르는 도체 및 다른 부분}}
$$

$$
\text{\textbf{보호장치}}\text{가 구비되어야}
$$

### 과전류와 뭐가 다른가

$$
\boxed{\text{\textbf{관심사가 다르다}}}
$$

| | **과전류 (113.4)** | **고장전류 (113.5)** |
|---|---|---|
| **관심** | **전류의 크기** | **도체의 온도** |
| **대상** | **부하 회로** | **보호도체 · 접지도체까지** |
| **목적** | 과부하·단락 방지 | **고장 시 견디게** |

$$
\text{\textbf{113.5는 "고장은 났는데 그때 견디나"}}
$$

$$
\text{\textbf{보호도체}}\text{도 대상} \;-\; \text{평소엔 전류가 안 흐르지만 \textbf{고장 시엔 흐른다}}
$$

$$
\boxed{\text{\textbf{그래서 보호도체의 굵기 규정}}\text{이 있다}(\text{kec.1.5})}
$$

$$
\text{\textbf{고장전류를 견디는 굵기}} \;-\; \text{녹으면 보호가 사라진다}
$$

$$
\text{\textbf{113.5-2}}: \text{도체는 \textbf{113.4에 따라}} \text{ 과전류에 대하여도 보호}
$$

$$
\text{\textbf{둘이 이어져 있다}} \;-\; \text{따로지만 함께}
$$

### 왜 따로 두나

$$
\text{\textbf{과전류 보호}}\text{는 \textbf{전류를 끊는} 것}
$$

$$
\text{\textbf{고장전류 보호}}\text{는 \textbf{끊을 때까지 버티는} 것}
$$

$$
\boxed{\text{\textbf{끊는 쪽과 버티는 쪽}}}
$$

$$
\text{\textbf{차단기가 } 0.1 \text{ 초에 끊어도}} \;\Longrightarrow\; \text{그 } 0.1 \text{ 초 동안 도체가 \textbf{녹으면} 안 된다}
$$

$$
\text{\textbf{열적 등가}}: I^2t \;-\; \text{도체가 견디는 값}
$$

$$
\textbf{차단기의 } \text{ I} ^2 \text{t < } \text{도체의 } \text{ I} ^2 \text{t} \;\Longrightarrow\; \text{안전}
$$

**mc.7.6의 협조 곡선**이 이것이다. 보호기기 곡선이 **도체의 열적 한계 곡선 아래**에
있어야 한다.

$$
\text{\textbf{규정이 실무 설계와 직결}}
$$

## 전압외란 및 전자기 장애에 대한 대책 (113.6)

$$
\text{\textbf{세 가지}}
$$

| | 무엇 |
|---|---|
| **1** | **충전부 사이의 결함**으로 발생한 전압 |
| **2** | **저전압과 이후 전압 회복** |
| **3** | **전자기 장애**(EMC) |

### 저전압과 전압 회복

$$
\text{\textbf{순간 정전 뒤 복전}}\text{이 위험할 수 있다}
$$

$$
\text{\textbf{mc.7.7의 자기유지}}\text{가 이걸 막는다} \;-\; \text{정전되면 풀리니}
$$

$$
\text{\textbf{복전과 함께 기계가 저절로 돌면}} \;\Longrightarrow\; \text{\textbf{사고}}
$$

$$
\boxed{\text{\textbf{페일세이프}}\text{가 규정에 근거}\text{를 둔다}}
$$

### 전자기 장애 (EMC)

$$
\text{\textbf{설비는 전자기 장애로부터 견디는 성질}}\text{을 가져야}
$$

$$
\text{\textbf{자기가 내는 전자기 방사}}\text{도 고려해야}
$$

$$
\boxed{\text{\textbf{받는 쪽과 주는 쪽 양쪽}}}
$$

$$
\text{\textbf{EMS}}(\text{내성}) + \text{\textbf{EMI}}(\text{방사}) = \text{\textbf{EMC}}
$$

$$
\text{\textbf{옛 기준엔 없던 것}} \;-\; \text{전자기기가 늘어나며 들어왔다}
$$

$$
\text{\textbf{pw.7.3의 고조파}} \cdot \text{\textbf{mc.3.3의 인버터}}\text{가 만드는 문제}
$$

**인버터가 늘면서 EMC가 중요해졌다.** PWM의 급격한 스위칭이 전자기 방사를 만든다.

$$
\dfrac{dv}{dt} \text{ 가 크면} \;\Longrightarrow\; \text{\textbf{전자기 방사}}
$$

$$
\text{\textbf{빠른 스위칭의 대가}} \;-\; \text{효율은 좋아지고 잡음은 늘어난다}
$$

## 전원공급 중단에 대한 보호 (113.7)

$$
\boxed{\text{\textbf{전원공급 중단으로 위험과 피해가 예상되면}} \;\Longrightarrow\; \text{\textbf{보호장치}}}
$$

$$
\text{\textbf{정전 자체가 위험}}\text{한 곳이 있다}
$$

| 어디 | 왜 |
|---|---|
| **병원 수술실** | 생명 |
| **데이터센터** | 데이터 손실 |
| **엘리베이터** | 갇힘 |
| **화학 플랜트** | 반응 폭주 |
| **소방설비** | 화재 시 필요 |

$$
\text{\textbf{UPS ・ 비상발전기 ・ 축전지}}
$$

$$
\text{\textbf{"전기가 없어서 위험"}}\text{도 규정의 대상}
$$

$$
\boxed{\text{\textbf{보호는 "전기로부터"만이 아니다}}}
$$

**흥미로운 조문**이다. 나머지 다섯은 전기가 **해를 끼치는** 걸 막는데, 이건 전기가
**없어서** 생기는 위험을 막는다.

$$
\text{\textbf{방향이 반대}}
$$

## 여섯 보호의 구조

$$
\text{\textbf{무엇을 막나}}\text{로 묶으면}
$$

| 묶음 | 조 |
|---|---|
| **사람** | **113.2 감전**, 113.3 화상 |
| **재산·설비** | **113.3 화재**, 113.4 과전류, **113.5 고장전류** |
| **기능** | 113.6 전압외란·EMC, **113.7 전원중단** |

$$
\boxed{\text{\textbf{사람 → 재산 → 기능}} \;-\; \text{중요도 순}}
$$

$$
\text{\textbf{보호의 두 방법}}\text{은 어디서나 같다}
$$

$$
\boxed{\text{\textbf{크기를 제한}} \;\text{또는}\; \text{\textbf{지속시간을 제한}}}
$$

$$
\text{\textbf{전류 × 시간}}\text{이 위험을 정하니} \;-\; \text{둘 중 하나만 잡아도 된다}
$$

$$
\text{\textbf{mc.7.4의 ELB}}: 30\ \mathrm{mA}(\text{크기}) \cdot 0.03\ \text{초}(\text{시간})
$$

$$
\text{\textbf{둘 다 잡으면 더 안전}}
$$

## 정리

$$
\boxed{
\begin{array}{c|l|l}
\mathbf{113.2} & \textbf{감전} & \text{기본보호 + 고장보호} \\
\mathbf{113.3} & \textbf{열} & \text{화재 + 화상} \\
\mathbf{113.4} & \textbf{과전류} & \text{과부하 + 단락} \\
\mathbf{113.5} & \textbf{고장전류} & \text{\textbf{허용온도}} \\
\mathbf{113.6} & \textbf{전압외란・EMC} & \text{저전압 ・ 복전 ・ 전자기} \\
\mathbf{113.7} & \textbf{전원중단} & \text{정전이 위험한 곳}
\end{array}
}
$$

$$
\boxed{\text{\textbf{과전류는 끊는 쪽, 고장전류는 버티는 쪽}}}
$$

$$
\text{\textbf{보호 = 크기 제한 또는 시간 제한}} \;-\; \text{전류 × 시간이 위험이니}
$$
