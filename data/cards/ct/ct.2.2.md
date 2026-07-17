---
id: ct.2.2
title: 블록선도와 신호흐름선도
status: reviewed
summary: 되먹임 공식 하나면 대부분 풀린다. 분모의 부호가 되먹임의 극성이다.
covers:
  - ct.2.2.1
  - ct.2.2.2
  - ct.2.2.3
  - ct.2.2.4
formulas:
  - label: 궤환제어계의 표준형
    tex: \dfrac{C}{R} = \dfrac{G}{1 + GH}
    note: '**부궤환이면 +GH**. 이 공식 하나가 대부분을 푼다.'
  - label: 정궤환이면
    tex: \dfrac{C}{R} = \dfrac{G}{1 - GH}
    note: '**분모의 부호가 반대**. 1 = GH 면 발산.'
  - label: 메이슨 공식
    tex: G = \dfrac{1}{\Delta}\sum_k G_k\Delta_k, \qquad \Delta = 1 - \sum L_1 + \sum L_2 - \cdots
    note: 신호흐름선도용. 복잡한 것도 한 번에.
  - label: 특성방정식
    tex: 1 + GH = 0
    note: '**분모를 0으로**. 극이 여기서 나오고 안정도가 결정된다.'
traps:
  - '**부궤환이면 분모가 1+GH, 정궤환이면 1−GH**다. 부호를 뒤집으면 답이 달라진다.'
  - '**특성방정식은 1 + GH = 0**이다. 분모를 0으로 놓은 것. ct.2.5의 출발점.'
  - '**GH가 개루프 전달함수**다. G가 아니다.'
  - '**메이슨 공식의 Δ_k 는 그 경로에 닿지 않는 루프**만 남긴 것이다.'
related:
  - ct.1.10
  - ct.2.5
  - ct.2.4
---

## 블록선도의 개요

$$
\text{\textbf{전달함수}}(\text{ct.1.10})\text{를 \textbf{네모}}\text{로 그린다}
$$

| 기호 | 뜻 |
|---|---|
| **블록** | **전달함수** $G(s)$ |
| **화살표** | 신호의 방향 |
| **가합점**(⊕) | **더하거나 뺀다** |
| **인출점** | 신호를 **나눈다** |

$$
\text{\textbf{그림으로 회로를 대신}} \;-\; \text{복잡한 계를 한눈에}
$$

$$
\text{\textbf{인출점에서 신호가 나뉘어도 크기는 그대로}}
$$

$$
\text{\textbf{전기 회로가 아니다}} \;-\; \text{전류가 나뉘지 않는다}
$$

**중요한 차이**다. 회로도에서 선이 갈라지면 전류가 나뉘는데, 블록선도는 **정보의
흐름**이라 그냥 복제된다.

## 궤환제어계의 표준형

$$
\boxed{\dfrac{C}{R} = \dfrac{G}{1 + GH}}
$$

$$
\text{\textbf{이 공식 하나가 대부분을 푼다}}
$$

### 유도

$$
E = R - HC \;-\; \text{\textbf{편차}}(\text{부궤환})
$$

$$
C = GE = G(R - HC)
$$

$$
C = GR - GHC \;\Longrightarrow\; C(1 + GH) = GR
$$

$$
\boxed{\dfrac{C}{R} = \dfrac{G}{1+GH}}
$$

$$
\text{\textbf{세 줄이면 나온다}} \;-\; \text{외우지 말고 유도하는 게 안전}
$$

### 부호가 핵심

$$
\boxed{\text{\textbf{부궤환}}: \dfrac{G}{1 + GH} \qquad \text{\textbf{정궤환}}: \dfrac{G}{1 - GH}}
$$

$$
\text{\textbf{분모의 부호가 되먹임의 극성과 반대}}
$$

$$
\text{\textbf{빼면 더해지고, 더하면 빼진다}}
$$

$$
\text{\textbf{정궤환에서 } GH = 1} \;\Longrightarrow\; \dfrac{C}{R} = \infty \;\Longrightarrow\; \boxed{\text{\textbf{발산}}}
$$

$$
\text{\textbf{입력이 없어도 출력이 있다}} \;-\; \text{\textbf{발진}}
$$

**스피커의 삐- 소리**가 이것이다. 마이크가 스피커 소리를 다시 받아 $GH$ 가 1을 넘으면
발진한다.

$$
\text{\textbf{발진기}}\text{는 이걸 \textbf{일부러} 만든다} \;-\; \text{바르크하우젠 조건}
$$

### 용어

| | 뜻 |
|---|---|
| **$G$** | **순방향** 전달함수 |
| **$H$** | **되먹임** 전달함수 |
| **$GH$** | **개루프 전달함수** |
| $\frac{G}{1+GH}$ | **폐루프 전달함수** |

$$
\boxed{\text{\textbf{개루프 전달함수는 } GH}} \;-\; G \text{ 가 아니다}
$$

$$
\text{\textbf{루프를 한 바퀴 돈 것}} \;-\; \text{그래서 개루프}
$$

$$
\text{\textbf{시험 함정}} \;-\; \text{ct.2.5의 나이퀴스트가 } GH \text{ 를 본다}
$$

### 단위 궤환

$$
H = 1 \;\Longrightarrow\; \dfrac{C}{R} = \dfrac{G}{1+G}
$$

$$
\text{\textbf{출력을 그대로 되먹임}} \;-\; \text{가장 흔한 꼴}
$$

$$
\text{\textbf{H가 1이 아니면}} \;-\; \text{센서에 이득이나 지연이 있는 것}
$$

## 특성방정식

$$
\boxed{1 + GH = 0}
$$

$$
\text{\textbf{폐루프 전달함수의 분모를 0으로}}
$$

$$
\text{\textbf{극}}\text{이 여기서 나온다}(\text{ct.1.10})
$$

$$
\boxed{\text{\textbf{극의 위치가 안정도}}} \;-\; \text{ct.2.5의 전부}
$$

$$
\text{\textbf{특성방정식의 근 = 폐루프의 극}}
$$

$$
\text{\textbf{좌반면에 있으면 안정}}
$$

**ct.2.5(안정도)와 ct.2.6(근궤적)이 전부 이 식을 다룬다.** $1 + GH = 0$ 의 근이
어디 있느냐가 제어공학의 중심 문제다.

$$
\text{\textbf{되먹임이 극을 옮긴다}} \;-\; \text{그게 제어의 힘이자 위험}
$$

$$
G \text{ 만 있으면 극이 } G \text{ 의 극} \;\Longrightarrow\; \text{되먹임을 걸면 } 1+GH=0 \text{ 의 근으로 \textbf{이동}}
$$

$$
\boxed{\text{\textbf{원래 안정하던 게 불안정해질 수 있다}}}
$$

## 블록선도의 변환

| 변환 | 규칙 |
|---|---|
| **직렬** | **곱한다** $G_1G_2$ |
| **병렬** | **더한다** $G_1 \pm G_2$ |
| **되먹임** | $\frac{G}{1\pm GH}$ |
| **가합점 이동** | 앞으로 가면 $\frac{1}{G}$, 뒤로 가면 $G$ |
| **인출점 이동** | 앞으로 가면 $G$, 뒤로 가면 $\frac{1}{G}$ |

$$
\boxed{\text{\textbf{가합점과 인출점이 반대}}}
$$

### 왜 반대인가

$$
\text{\textbf{신호가 같아야}} \text{ 한다} \;-\; \text{옮겨도 결과가 안 변해야}
$$

$$
\text{\textbf{가합점을 블록 뒤로}}: (R \pm X)G = RG \pm XG \;\Longrightarrow\; X \text{ 에 } G \text{ 를 곱해야}
$$

$$
\text{\textbf{인출점을 블록 뒤로}}: \text{뽑는 신호가 } RG \text{ 가 됨} \;\Longrightarrow\; \dfrac{1}{G} \text{ 를 곱해 되돌려야}
$$

$$
\text{\textbf{보상해 주는 것}} \;-\; \text{옮긴 만큼 되돌린다}
$$

$$
\text{\textbf{외우지 말고 신호를 따라가면}} \text{ 된다}
$$

## 신호흐름선도

$$
\text{\textbf{블록선도를 점과 선}}\text{으로}
$$

| 용어 | 뜻 |
|---|---|
| **마디**(node) | 신호 |
| **가지**(branch) | 전달함수 |
| **전향경로** | 입력 → 출력 (한 번씩만) |
| **루프** | **되돌아오는 닫힌 경로** |
| **비접촉 루프** | 마디를 공유하지 않는 루프들 |

$$
\text{\textbf{복잡한 계}}\text{에 유리} \;-\; \text{블록선도는 손으로 줄여야 하니}
$$

### 메이슨 공식

$$
\boxed{G = \dfrac{C}{R} = \dfrac{1}{\Delta}\sum_k G_k\Delta_k}
$$

$$
\Delta = 1 - \sum L_1 + \sum L_2 - \sum L_3 + \cdots
$$

| 기호 | 뜻 |
|---|---|
| $G_k$ | **$k$ 번째 전향경로**의 이득 |
| $\Delta$ | **특성식** |
| $\sum L_1$ | **모든 루프 이득의 합** |
| $\sum L_2$ | **2개씩 비접촉인 루프 곱의 합** |
| $\Delta_k$ | $G_k$ 에 **닿지 않는 루프**만으로 만든 $\Delta$ |

$$
\text{\textbf{부호가 번갈아}} \;-\; -, +, -, \cdots
$$

$$
\boxed{\Delta_k \text{ 는 그 경로에 안 닿는 루프만}}
$$

$$
\text{\textbf{경로가 지나는 마디를 쓰는 루프는 뺀다}}
$$

### 표준형과 맞춰 보면

$$
\text{단순 되먹임: 전향경로 } G, \text{ 루프 } -GH
$$

$$
\Delta = 1 - (-GH) = 1 + GH
$$

$$
\Delta_1 = 1 \;-\; \text{모든 루프가 경로에 닿으니}
$$

$$
G = \dfrac{G \times 1}{1+GH} = \dfrac{G}{1+GH} \;\checkmark
$$

$$
\boxed{\text{\textbf{표준형이 메이슨의 특수한 경우}}}
$$

$$
\text{\textbf{메이슨이 더 일반적}} \;-\; \text{루프가 여럿이어도 한 번에}
$$

## 아날로그계산기

$$
\text{\textbf{연산증폭기}}\text{로 미분방정식을 푼다}
$$

| 회로 | 하는 일 |
|---|---|
| **적분기** | $-\frac{1}{RC}\int$ |
| **가산기** | 더하기 |
| **부호변환기** | 곱하기 $-1$ |
| **계수기** | 상수배 |

$$
\text{\textbf{미분기는 잘 안 쓴다}} \;-\; \text{\textbf{잡음을 증폭}}\text{하니}
$$

$$
\dfrac{d}{dt} \;\Longrightarrow\; \text{\textbf{고주파를 키운다}} \;\Longrightarrow\; \text{잡음이 커짐}
$$

$$
\boxed{\text{\textbf{적분기로만} 구성한다}}
$$

$$
\ddot{y} = f \;\Longrightarrow\; \dot{y} = \int f \;\Longrightarrow\; y = \int\int f
$$

$$
\text{\textbf{미분방정식을 적분의 연쇄}}\text{로 바꿔 푼다}
$$

$$
\text{\textbf{디지털 컴퓨터 이전의 기술}} \;-\; \text{지금은 역사}
$$

$$
\text{\textbf{다만 미분이 잡음을 키운다는 사실}}\text{은 지금도 유효}(\text{ct.2.6의 D 동작})
$$

**PID의 D 동작이 잡음에 약한 이유**가 이것이다. 실무에서 미분 시간을 크게 못 잡는다.

## 정리

$$
\boxed{\dfrac{C}{R} = \dfrac{G}{1+GH} \;(\text{\textbf{부궤환}}), \qquad \dfrac{G}{1-GH} \;(\text{\textbf{정궤환}})}
$$

$$
\boxed{\text{특성방정식}: 1 + GH = 0}
$$

| 변환 | |
|---|---|
| **직렬** | 곱 |
| **병렬** | 합 |
| **가합점 뒤로** | $\times G$ |
| **인출점 뒤로** | $\times \frac{1}{G}$ |

$$
\boxed{\text{메이슨}: G = \dfrac{1}{\Delta}\sum G_k\Delta_k, \quad \Delta = 1 - \sum L_1 + \sum L_2 - \cdots}
$$

$$
\text{\textbf{$GH$ 가 개루프 전달함수}} \;-\; \text{ct.2.5가 이걸 본다}
$$

$$
\text{\textbf{되먹임이 극을 옮긴다}} \;-\; \text{ct.2.6의 근궤적이 그 자취}
$$
