---
id: mc.5.4
title: 유도전동기제어
status: reviewed
summary: N = (1-s)·120f/P 의 세 인자가 세 가지 제어법이다. 인버터가 f를 잡으면서 판이 바뀌었다.
covers:
  - mc.5.4.1
  - mc.5.4.2
  - mc.5.4.3
formulas:
  - label: 속도의 세 인자
    tex: N = (1-s)\dfrac{120f}{P}
    note: '**$f$ · $P$ · $s$** — 세 인자가 곧 세 방법이다.'
  - label: V/f 일정 제어
    tex: \dfrac{V}{f} = \text{일정} \;\Longrightarrow\; \phi \text{ 일정} \;\Longrightarrow\; T \text{ 일정}
    note: 주파수만 낮추면 **포화**한다(mc.4.1). 그래서 전압도 같이.
  - label: 2차 저항 제어
    tex: s' = s\dfrac{r_2 + R}{r_2} \;-\; \text{\textbf{비례추이}}
    note: 권선형만. **슬립이 곧 손실**이라 효율이 나쁘다.
  - label: 2차 여자 제어
    tex: \text{2차에 \textbf{슬립 주파수 전압}} E_c \text{ 를 넣는다}
    note: 저항 제어의 손실을 **회수**한다. 크레머·셀비어스.
traps:
  - '**VVVF는 전압과 주파수를 함께** 바꾼다. 주파수만 바꾸면 자속이 포화한다.'
  - '**2차 저항 제어는 효율이 나쁘다.** η₂ = 1-s 라 슬립만큼 열이 된다.'
  - '**극수 변환은 계단식**이다. 연속 조절이 안 된다.'
  - '**셀비어스는 전기로, 크레머는 기계적으로** 회수한다. 이 구분이 시험에 나온다.'
related:
  - mc.5.2
  - mc.3.3
  - mc.4.1
---

## 세 인자, 세 방법

$$
\boxed{N = (1-s)\dfrac{120f}{P}}
$$

$$
\text{\textbf{식에 인자가 셋이니 방법도 셋}}
$$

| 인자 | 방법 | 특징 |
|---|---|---|
| **$f$** | **주파수 제어** | **연속 · 광범위 · 고효율** |
| **$P$** | **극수 제어** | **계단식** |
| **$s$** | **슬립 제어** | 효율 나쁨 |

$$
\text{mc.1.6의 } N = \dfrac{V - I_aR_a}{K\phi} \text{ 와 \textbf{같은 논법}}
$$

**직류기에서도 식의 인자가 곧 제어법이었다.** 전동기 제어의 일반 원리다.

## 주파수에 의한 제어

$$
\boxed{N \propto f \;-\; \text{\textbf{가장 좋은 방법}}}
$$

### V/f 일정이 핵심

$$
\text{주파수만 낮추면?}
$$

$$
\phi \propto \dfrac{V}{f} \;\Longrightarrow\; f \downarrow, V \text{ 고정} \;\Longrightarrow\; \phi \uparrow \;\Longrightarrow\; \text{\textbf{포화}}
$$

**mc.4.1의 변압기**에서 본 그것이다. $60\ \mathrm{Hz}$ 용을 $30\ \mathrm{Hz}$ 에
넣으면 자속이 2배가 되어 철심이 포화한다.

$$
\text{포화} \;\Longrightarrow\; \text{여자전류 폭증} \;\Longrightarrow\; \text{\textbf{과열 ・ 소손}}
$$

$$
\boxed{\dfrac{V}{f} = \text{일정}\text{하게} \;\Longrightarrow\; \phi \text{ 일정} \;\Longrightarrow\; T \text{ 일정}}
$$

$$
\text{\textbf{VVVF}}(\text{Variable Voltage Variable Frequency})
$$

$$
\text{\textbf{전압과 주파수를 같이} 바꾼다} \;-\; \text{이름 그대로}
$$

**$T \propto \phi I_2$ 인데 $\phi$ 가 일정하면 토크도 일정**하다.

$$
\boxed{\text{V/f 제어 = \textbf{정토크} 제어}}
$$

$$
V \propto f \;\Longrightarrow\; P = T\omega \propto f \;\Longrightarrow\; \boxed{P \propto f}
$$

**토크가 일정하니 출력은 주파수에 비례**한다. 속도를 절반으로 낮추면 출력도 절반이다.

$$
\text{\textbf{선박 추진용, 인견・방직 공장의 포트 모터}} \;-\; \text{고전적 용도}
$$

### 정격 주파수 위로는

$$
f > f_n \;\Longrightarrow\; V \text{ 를 더 못 올린다}(\text{절연 한계})
$$

$$
\Longrightarrow \dfrac{V}{f} \downarrow \;\Longrightarrow\; \phi \downarrow \;\Longrightarrow\; T \downarrow
$$

$$
\text{\textbf{약계자 영역}} \;-\; \text{정출력}
$$

$$
\text{\textbf{mc.1.8의 직류기 계자 제어와 같다}}
$$

| 영역 | | |
|---|---|---|
| $f < f_n$ | **V/f 일정** | **정토크** |
| $f > f_n$ | **V 고정** | **정출력** (약계자) |

**두 영역의 구조가 직류기와 판박이**다. 전압 제어(정토크) → 계자 제어(정출력).

### 인버터

$$
\text{\textbf{IGBT}}\text{로 PWM}(\text{mc.3.3})
$$

| 장점 | 단점 |
|---|---|
| **연속 · 광범위** | **고조파** (pw.7.3) |
| **고효율** | 비쌈 |
| **정토크** | 서지 전압 (긴 케이블) |
| **소프트 기동 겸용** | 저속에서 냉각 부족 |

$$
\boxed{\text{\textbf{인버터가 판을 바꿨다}}}
$$

**pw.5.4·pw.7.4·mc.1.1에서 반복한 이야기**의 종착점이다.

$$
\text{옛날: 속도 제어 = \textbf{직류기}} \;\Longrightarrow\; \text{지금: \textbf{유도기 + 인버터}}
$$

$$
\text{\textbf{정류자의 대가}}(\text{mc.1.1})\text{를 안 치르고 속도 제어를 얻었다}
$$

**에너지 절감**이 실용적 이유다. 팬·펌프는 **상사법칙**으로 $P \propto N^3$ 이라
속도를 20% 낮추면 전력이 절반이 된다.

$$
\text{밸브로 조이던 것}(\text{저항 제어와 같은 낭비}) \;\Longrightarrow\; \text{\textbf{속도를 낮춤}}
$$

## 극수에 의한 제어

$$
\boxed{N_s = \dfrac{120f}{P} \;\Longrightarrow\; \text{\textbf{극수를 바꾸면 속도가 바뀐다}}}
$$

$$
\text{4극 } 1800 \;\longleftrightarrow\; \text{8극 } 900\ \mathrm{rpm}
$$

### 어떻게 바꾸나

$$
\text{\textbf{권선의 결선을 바꾼다}} \;-\; \text{탭이나 스위치로}
$$

$$
\text{\textbf{닐런드 결선}}(\text{Dahlander}) \;-\; \text{하나의 권선으로 } 2 : 1 \text{ 극수 변환}
$$

| 장점 | 단점 |
|---|---|
| **간단 · 싸다** | **계단식** (연속 불가) |
| **효율이 좋다** | 2~4단계뿐 |
| 손실 없음 | **회전자도 맞춰야** (권선형은 곤란) |

$$
\boxed{\text{\textbf{농형만 쉽다}}}
$$

**농형 회전자는 극수가 없다.** 고정자 극수에 저절로 맞춰지니 고정자만 바꾸면 된다.
권선형은 회전자 권선도 극수가 정해져 있어 같이 바꿔야 한다.

$$
\text{\textbf{농형의 숨은 장점}} \;-\; \text{회전자가 "극수를 모른다"}
$$

$$
\text{용도: \textbf{엘리베이터}}(\text{고속/저속}), \text{ 팬}(\text{강/약}), \text{ 공작기계}
$$

### 종속법 — 두 대를 묶어 극수를 바꾼다

$$
\boxed{\text{\textbf{권선형 2대}}\text{를 \textbf{같은 축}}\text{에 물려 극수를 합성}}
$$

$$
\text{한 대의 \textbf{2차}를 다른 대의 \textbf{1차}}\text{에 넣는다}
$$

| 접속 | 속도 |
|---|---|
| **직렬 종속** | $N = \dfrac{120f}{P_1 + P_2}$ |
| **차동 종속** | $N = \dfrac{120f}{P_1 - P_2}$ |
| **병렬 종속** | $N = \dfrac{120f}{\frac{P_1+P_2}{2}} = \dfrac{240f}{P_1 + P_2}$ |

$$
\text{\textbf{극수가 더해지거나 빠지거나 평균}}\text{된다}
$$

$$
\text{\textbf{직렬은 느리고}}(\text{극수 합}), \text{ \textbf{차동은 더 빠르다}}(\text{극수 차 — 분모가 작으니})
$$

**주의**: 차동은 분모가 $P_1 - P_2$ 로 **작아지니 속도가 오른다.** 이름에 속으면
안 된다.

$$
\text{\textbf{병렬은 직렬의 정확히 2배}} \;-\; \text{분모가 절반이니}
$$

$$
\text{예: } P_1 = 4, P_2 = 2, f = 60
$$

| 접속 | 계산 | $N$ |
|---|---|---|
| **직렬** | $\frac{120 \times 60}{4+2}$ | $1200$ |
| **차동** | $\frac{120 \times 60}{4-2}$ | $\mathbf{3600}$ |
| **병렬** | $\frac{240 \times 60}{4+2}$ | $2400$ |

$$
\text{\textbf{차동이 가장 빠르다}}
$$

$$
\text{\textbf{극수 변환의 확장}} \;-\; \text{한 대로 못 만드는 극수를 두 대로}
$$

**권선형 2대가 필요**해서 비싸고 크다. 인버터가 나오면서 사라졌다. **시험에는 식이
나온다.**

## 슬립에 의한 제어

### ① 1차 전압 제어

$$
T \propto V^2 \;\Longrightarrow\; \text{전압을 낮추면 토크가 줄고} \;\Longrightarrow\; \text{슬립이 커짐} \;\Longrightarrow\; \text{감속}
$$

$$
\boxed{s \propto \dfrac{1}{V^2} \;\Longrightarrow\; \dfrac{s_2}{s_1} = \dfrac{V_1^2}{V_2^2}}
$$

**같은 토크를 내려면** 전압이 준 만큼 슬립이 제곱으로 커져야 한다.

$$
\text{전압을 } \dfrac{1}{2} \;\Longrightarrow\; \text{슬립이 \textbf{4배}}
$$

$$
\eta_2 = 1 - s \;\Longrightarrow\; \text{\textbf{효율이 급락}}(\text{mc.5.2})
$$

**슬립이 4배면 손실도 4배**다. 이게 전압 제어가 비효율적인 이유를 숫자로 보여준다.

| 장점 | 단점 |
|---|---|
| 간단 | **효율이 나쁘다** |
| | **토크가 제곱으로** 준다 |
| | 범위가 좁다 |

$$
\text{\textbf{선풍기}}\text{ 정도에만} \;-\; \text{팬은 저속에서 토크가 적게 드니}
$$

### ② 2차 저항 제어 (권선형)

$$
\boxed{\text{\textbf{비례추이}}(\text{mc.5.2})}
$$

$$
s' = s\dfrac{r_2 + R}{r_2}
$$

$$
\text{저항을 키우면} \;\Longrightarrow\; \text{같은 토크를 \textbf{더 큰 슬립}에서} \;\Longrightarrow\; \text{\textbf{감속}}
$$

| 장점 | 단점 |
|---|---|
| **구조 간단** | **효율이 나쁘다** |
| **기동토크 확보** | **속도변동률 커짐** |
| | **권선형만** |

$$
\boxed{\eta_2 = 1 - s \;-\; \text{\textbf{슬립이 곧 손실}}}
$$

$$
s = 0.5 \text{ 로 속도를 절반으로} \;\Longrightarrow\; \text{\textbf{입력의 절반이 저항에서 열}}
$$

**mc.1.8의 직류기 저항 제어와 똑같은 낭비**다. 속도를 낮춘 만큼 열로 버린다.

$$
\text{\textbf{저항 제어는 어디서나 낭비}} \;-\; \text{직류기든 유도기든}
$$

### ③ 2차 여자 제어 — 낭비를 회수한다

$$
\boxed{\text{2차에 \textbf{슬립 주파수의 전압} } E_c \text{ 를 넣는다}}
$$

$$
I_2 = \dfrac{sE_2 \pm E_c}{\sqrt{r_2^2 + (sx_2)^2}}
$$

$$
E_c \text{ 를 \textbf{같은 방향}} \;\Longrightarrow\; \text{슬립 감소}(\text{증속})
$$
$$
E_c \text{ 를 \textbf{반대 방향}} \;\Longrightarrow\; \text{슬립 증가}(\text{감속})
$$

**저항 대신 전압을 넣는다.** 저항은 열을 내지만 전압원은 **에너지를 주고받는다.**

$$
\boxed{\text{\textbf{슬립 전력을 버리지 않고 회수}}}
$$

### 크레머 vs 셀비어스

| 방식 | 회수 방법 |
|---|---|
| **크레머**(Kramer) | **기계적**으로 — 축에 되돌림 |
| **셀비어스**(Scherbius) | **전기적**으로 — 계통에 반환 |

$$
\text{\textbf{크레머: 기계}} \qquad / \qquad \text{\textbf{셀비어스: 전기}}
$$

**크레머**는 슬립 전력으로 직류전동기를 돌려 **같은 축에 붙인다.** 기계적으로 되돌린다.

**셀비어스**는 슬립 전력을 인버터로 **계통에 돌려보낸다.** 요즘 방식이다.

$$
\text{\textbf{정지 셀비어스}} \;-\; \text{회전기 없이 \textbf{반도체}로}(\text{mc.3.3})
$$

$$
\text{2차 슬립 전력} \to \text{정류} \to \text{인버터} \to \text{계통}
$$

$$
\text{\textbf{대형 펌프 ・ 송풍기}}\text{에 쓴다} \;-\; \text{좁은 범위 제어면 인버터보다 싸다}
$$

**슬립 전력만 처리하면 되니** 변환기 용량이 작다. 20% 감속이면 20% 용량의 인버터면
된다.

$$
\text{VVVF: \textbf{전 전력}을 변환} \qquad / \qquad \text{셀비어스: \textbf{슬립 전력}만}
$$

**이게 셀비어스가 아직 살아 있는 이유**다.

## 권선형전동기의 제어

$$
\text{\textbf{2차를 밖으로 뽑을 수 있다}}\text{는 게 전부}(\text{mc.5.1})
$$

| 방법 | |
|---|---|
| **2차 저항 제어** | 비례추이 — 간단하지만 낭비 |
| **2차 여자 제어** | 크레머 · 셀비어스 — 회수 |

$$
\text{\textbf{슬립링이 있어야} 가능} \;-\; \text{농형은 회전자가 닫혀 있어 불가}
$$

$$
\text{요즘은 \textbf{농형 + 인버터}}\text{가 이겼다} \;\Longrightarrow\; \text{권선형이 줄어드는 중}
$$

**권선형의 존재 이유가 사라지고 있다.** 인버터가 농형으로 다 해결하니, 슬립링을
관리할 이유가 없다.

## 정리

$$
\boxed{N = (1-s)\dfrac{120f}{P}}
$$

| 인자 | 방법 | 효율 | 연속성 |
|---|---|---|---|
| **$f$** | **VVVF 인버터** | **좋다** | **연속** |
| **$P$** | 극수 변환 | **좋다** | **계단** |
| **$s$** | 1차 전압 | **나쁘다** | 연속 |
| **$s$** | 2차 저항 | **나쁘다** | 계단 |
| **$s$** | **2차 여자** (셀비어스) | **좋다** | 연속 |

$$
\boxed{\dfrac{V}{f} = \text{일정}} \;-\; \text{mc.4.1의 } \phi \propto \dfrac{E}{f} \text{ 가 여기서 결실}
$$

**변압기의 자속 관계 하나가 현대 전동기 제어의 근본**이 되었다. 카드 하나가 다른
카드를 이렇게 멀리서 떠받친다.
