---
id: kec.1.1
title: 기술기준 총칙 및 KEC 총칙에 관한 사항
status: reviewed
summary: KEC는 기술기준이 요구하는 것을 구체적으로 정한 규정이다. 전압 구분이 바뀐 게 가장 큰 변화다.
covers:
  - kec.1.1.1
  - kec.1.1.2
  - kec.1.1.3
formulas:
  - label: 전압의 구분 (KEC 111.1)
    tex: '\text{\textbf{저압}} \to \text{교류 } 1\ \mathrm{kV} \text{ 이하}, \text{ 직류 } 1.5\ \mathrm{kV} \text{ 이하}'
    note: '**옛 기준은 600V/750V**였다. KEC에서 올라갔다.'
  - label: 고압과 특고압
    tex: '\text{\textbf{고압}} \to 1(1.5)\ \mathrm{kV} \sim 7\ \mathrm{kV}, \qquad \text{\textbf{특고압}} \to 7\ \mathrm{kV} \text{ 초과}'
    note: '**7kV가 고압과 특고압의 경계**. 이건 안 바뀌었다.'
  - label: 안전을 위한 보호 (KEC 113)
    tex: \text{\textbf{감전} ・ \textbf{열} ・ \textbf{과전류} ・ \textbf{고장전류} ・ \textbf{전압외란} ・ \textbf{전원중단}}
    note: 여섯 가지. 113.2~113.7.
  - label: 기본보호와 고장보호
    tex: \text{\textbf{기본보호}} = \text{직접접촉 방지}, \qquad \text{\textbf{고장보호}} = \text{간접접촉 방지}
    note: 옛 이름은 직접접촉·간접접촉 보호였다.
traps:
  - '**저압은 교류 1kV, 직류 1.5kV 이하**다. 옛 600V/750V로 답하면 틀린다.'
  - '**기본보호=직접접촉, 고장보호=간접접촉**이다. 이름이 바뀌었다.'
  - '**7kV 초과가 특고압**이다. 이 경계는 안 바뀌었다.'
  - KEC는 **기술기준(고시)의 하위**다. 기술기준이 성능을, KEC가 방법을 정한다.
related:
  - kec.1.2
  - kec.1.5
  - kec.2.1
---

> **이 과목은 규정이다.** 물리 법칙과 달리 **바뀐다.** 이 카드는 **KEC 시행 2026.
> 1. 5.**(기후에너지환경부공고 제2025-227호) 원문을 보고 썼다. **2021년 KEC 시행
> 이전 자료(종별 접지공사 등)는 무효**다.

## 목적

> KEC **101**

$$
\boxed{\text{\textbf{기술기준}}\text{이 정하는 전기설비의 \textbf{안전성능과 기술적 요구사항}}\text{을 \textbf{구체적으로} 정함}}
$$

$$
\text{KEC} = \text{Korea Electro-technical Code}
$$

### 기술기준과 KEC의 관계

$$
\text{\textbf{전기사업법}} \to \text{\textbf{전기설비기술기준}}(\text{고시}) \to \text{\textbf{KEC}}(\text{공고})
$$

| | 무엇을 |
|---|---|
| **기술기준** (고시) | **무엇을 달성해야 하나** — **성능** |
| **KEC** (공고) | **어떻게 하면 되나** — **방법** |

$$
\boxed{\text{\textbf{기술기준이 목표를, KEC가 수단을}}}
$$

$$
\text{\textbf{기술기준은 짧고 KEC는 방대}}\text{하다}
$$

**성능 규정과 사양 규정**의 관계다. 기술기준은 "감전되면 안 된다"고 하고, KEC는
"그러려면 이렇게 하라"고 한다.

$$
\text{\textbf{KEC를 안 따라도 기술기준을 만족하면 된다}} \;-\; \text{원칙적으로는}
$$

$$
\text{\textbf{실무에서는 KEC를 따른다}} \;-\; \text{그게 안전한 길이니}
$$

### 적용범위 (102)

$$
\text{\textbf{여덟 가지}}
$$

| | |
|---|---|
| **1. 공통사항** | **kec.1** |
| **2. 저압전기설비** | **kec.2** |
| **3. 고압·특고압전기설비** | **kec.3** |
| **4. 전기철도설비** | **kec.4** |
| **5. 분산형전원설비** | **kec.5** |
| 6. 발전용 화력설비 | |
| 7. 발전용 수력설비 | |
| 8. 그 밖에 기술기준에서 정하는 것 | |

$$
\boxed{\text{\textbf{출제기준의 5개 항목이 KEC의 1~5와 정확히 대응}}}
$$

$$
\text{\textbf{6・7은 시험 범위 밖}}
$$

## 안전원칙

> KEC **111.1 · 113**

### 전압의 구분 — 가장 중요한 변화

$$
\boxed{
\begin{aligned}
\text{\textbf{저압}} &: \text{교류 } \mathbf{1\ kV} \text{ 이하}, \; \text{직류 } \mathbf{1.5\ kV} \text{ 이하} \\
\text{\textbf{고압}} &: \text{교류 } 1\ \mathrm{kV}, \text{ 직류 } 1.5\ \mathrm{kV} \text{ 초과} \sim \mathbf{7\ kV} \text{ 이하} \\
\text{\textbf{특고압}} &: \mathbf{7\ kV} \text{ 초과}
\end{aligned}
}
$$

### 옛 기준과 다르다

| | **옛 판단기준** | **KEC** |
|---|---|---|
| **저압 교류** | $600\ \mathrm{V}$ | **$1\ \mathrm{kV}$** |
| **저압 직류** | $750\ \mathrm{V}$ | **$1.5\ \mathrm{kV}$** |
| 고압/특고압 경계 | $7\ \mathrm{kV}$ | **$7\ \mathrm{kV}$** (같음) |

$$
\boxed{\text{\textbf{저압의 상한이 올라갔다}}}
$$

$$
\text{\textbf{IEC 기준에 맞춘 것}} \;-\; \text{KEC의 목적이 국제 표준화}
$$

$$
\text{\textbf{7kV 경계는 안 바뀌었다}} \;-\; \text{헷갈리지 말 것}
$$

$$
\text{\textbf{옛 자료로 공부하면 틀린다}} \;-\; 600\mathrm{V} \text{ 로 답하면 오답}
$$

### 직류가 왜 더 높나

$$
\text{\textbf{직류가 교류보다 덜 위험}}\text{하다}
$$

$$
\text{교류 } 1\ \mathrm{kV} \times 1.5 = 1.5\ \mathrm{kV}
$$

$$
\text{\textbf{실효값과 최대값}}\text{의 관계와도 얽힌다}(\text{ct.1.3})
$$

**심실세동**은 교류가 훨씬 잘 일으킨다. $50 \sim 60\ \mathrm{Hz}$ 가 하필 심장에 가장
위험한 주파수다.

$$
\text{\textbf{직류는 근육이 경직}}\text{되고, \textbf{교류는 심장이 세동}}
$$

### 안전을 위한 보호

$$
\boxed{\text{\textbf{여섯 가지}}}
$$

| 조 | 무엇으로부터 |
|---|---|
| **113.2** | **감전** |
| **113.3** | **열 영향** |
| **113.4** | **과전류** |
| **113.5** | **고장전류** |
| **113.6** | **전압외란 · 전자기 장애** |
| **113.7** | **전원공급 중단** |

$$
\text{\textbf{인축}}(\text{사람과 가축})\text{과 \textbf{재산}}\text{을 지킨다}
$$

$$
\text{\textbf{가축}}\text{도 명시된다} \;-\; \text{축사에 적용}
$$

### 감전에 대한 보호 (113.2)

$$
\boxed{\text{\textbf{기본보호}} + \text{\textbf{고장보호}}}
$$

| | 무엇을 막나 | 옛 이름 |
|---|---|---|
| **기본보호** | **직접접촉** | 직접접촉 보호 |
| **고장보호** | **간접접촉** (기본절연 고장 시) | 간접접촉 보호 |

$$
\boxed{\text{\textbf{이름이 바뀌었다}}} \;-\; \text{시험 함정}
$$

$$
\text{\textbf{기본보호}}: \text{\textbf{충전부에 직접} 닿는 것}
$$

$$
\text{\textbf{고장보호}}: \text{\textbf{평소엔 안전한 노출도전부}}\text{가 고장으로 충전되는 것}
$$

**전동기 프레임을 만졌는데 감전**되는 게 고장보호의 대상이다. 평소엔 안전한데 절연이
깨지면 충전된다.

### 방법

$$
\text{\textbf{기본보호}}:
$$

$$
\text{가. \textbf{전류가 흐르는 것을 방지}} \quad / \quad \text{나. \textbf{위험하지 않은 값 이하로 제한}}
$$

$$
\text{\textbf{고장보호}}:
$$

$$
\text{(1) \textbf{전류 방지}} \quad / \quad \text{(2) \textbf{값 제한}} \quad / \quad \text{(3) \textbf{지속시간 제한}}
$$

$$
\boxed{\text{\textbf{고장보호에만 "지속시간 제한"}}\text{이 있다}}
$$

$$
\text{\textbf{왜?}} \;-\; \text{고장은 \textbf{일어난 뒤 빨리 끊으면} 되니}
$$

$$
\text{\textbf{직접접촉은 미리 막아야}} \;-\; \text{닿고 나서 끊으면 늦다}
$$

**mc.7.4의 ELB**가 "지속시간 제한"을 구현한다. $30\ \mathrm{mA} \cdot 0.03$ 초.

$$
\text{\textbf{전류 × 시간}}\text{이 위험을 정한다} \;-\; \text{그래서 둘 다 제한}
$$

### 전기설비의 유지·보수 (114)

$$
\text{\textbf{점검과 정비}}\text{가 이루어져야}
$$

$$
\text{\textbf{설치만이 아니라 유지도}} \;-\; \text{규정의 대상}
$$

$$
\text{\textbf{mc.7.6에서 본 그것}} \;-\; \text{보호기기는 평소에 놀아서 정기 시험이 생명}
$$

## 정의

> KEC **112**

$$
\text{\textbf{KEC에서 새로 들어온 용어}}\text{가 많다}
$$

| 용어 | 뜻 |
|---|---|
| **계통접지** | **전력계통**의 한 점을 대지에 접속 |
| **보호접지** | **안전**을 위해 도전부를 대지에 접속 |
| **등전위본딩** | 도전부를 **서로 접속**해 전위를 같게 |
| **노출도전부** | **만질 수 있는** 도전부 (평소엔 충전 안 됨) |
| **계통외도전부** | 전기설비가 **아닌데** 전위를 옮길 수 있는 것 |
| **보호도체**(PE) | 안전을 위한 도체 |
| **PEN 도체** | **보호도체 + 중성선** 겸용 |
| **중성선**(N) | |
| **리플프리 직류** | 맥동이 작은 직류 |
| **특별저압** | **SELV · PELV · FELV** |

$$
\boxed{\text{\textbf{IEC 용어를 그대로 들여왔다}}}
$$

### 노출도전부 vs 계통외도전부

$$
\text{\textbf{노출도전부}}: \text{\textbf{전기설비의} 도전부} \;-\; \text{전동기 프레임, 배전반 외함}
$$

$$
\text{\textbf{계통외도전부}}: \text{\textbf{전기설비가 아닌} 도전부} \;-\; \text{수도관, 가스관, 철골}
$$

$$
\boxed{\text{\textbf{전기설비냐 아니냐}}\text{로 갈린다}}
$$

$$
\text{\textbf{둘 다 등전위본딩}}\text{의 대상}(\text{kec.1.5})
$$

**수도관이 왜 문제인가.** 다른 곳의 전위를 끌고 온다. 지락이 나면 수도관을 통해
전위가 옮겨져 엉뚱한 데서 감전될 수 있다.

$$
\text{\textbf{그래서 다 묶어서 같은 전위로}} \;-\; \text{등전위본딩}
$$

### PEN 도체

$$
\text{\textbf{P}}\text{rotective} + \text{\textbf{E}}\text{arth} + \text{\textbf{N}}\text{eutral}
$$

$$
\boxed{\text{\textbf{보호도체와 중성선을 겸한다}}}
$$

$$
\text{\textbf{TN-C 방식}}\text{에서 쓴다}(\text{kec.2.2})
$$

$$
\text{\textbf{하나로 두 일}} \;-\; \text{경제적이지만 \textbf{위험}}
$$

$$
\text{\textbf{PEN이 끊어지면}} \;\Longrightarrow\; \text{\textbf{보호도체도 같이 끊긴다}} \;\Longrightarrow\; \text{\textbf{감전}}
$$

## 정리

$$
\boxed{
\begin{aligned}
\text{\textbf{저압}} &: \text{교류 } \mathbf{1\ kV}, \text{ 직류 } \mathbf{1.5\ kV} \text{ 이하} \\
\text{\textbf{고압}} &: \sim \mathbf{7\ kV} \\
\text{\textbf{특고압}} &: \mathbf{7\ kV} \text{ 초과}
\end{aligned}
}
$$

| | 무엇 |
|---|---|
| **기술기준** | 성능 (목표) |
| **KEC** | 방법 (수단) |

$$
\boxed{\text{\textbf{기본보호} = 직접접촉}, \qquad \text{\textbf{고장보호} = 간접접촉}}
$$

$$
\text{\textbf{안전을 위한 보호 여섯}}: \text{감전 ・ 열 ・ 과전류 ・ 고장전류 ・ 전압외란 ・ 전원중단}
$$

$$
\text{\textbf{KEC의 정신}} \;-\; \text{\textbf{IEC 국제 표준}}\text{에 맞추기}
$$
