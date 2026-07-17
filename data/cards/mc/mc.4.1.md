---
id: mc.4.1
title: 변압기의 구조 및 원리
status: reviewed
summary: 전자유도 하나로 도는 부품 없이 전압을 바꾼다. 그래서 효율이 99%다.
covers:
  - mc.4.1.1
  - mc.4.1.2
  - mc.4.1.3
  - mc.4.1.4
formulas:
  - label: 유기기전력
    tex: E_1 = 4.44 f \phi_m N_1\ \mathrm{[V]}, \qquad E_2 = 4.44 f \phi_m N_2\ \mathrm{[V]}
    note: 같은 자속을 공유하니 **권수만 다르다**. 이게 변압의 전부.
  - label: 권수비
    tex: a = \dfrac{N_1}{N_2} = \dfrac{E_1}{E_2} = \dfrac{V_1}{V_2} = \dfrac{I_2}{I_1} = \sqrt{\dfrac{Z_1}{Z_2}}
    note: '**전류는 반대**로 간다. 임피던스는 **제곱**.'
  - label: 4.44는 어디서
    tex: E = \dfrac{2\pi}{\sqrt{2}} f \phi_m N = 4.44 f\phi_m N
    note: $\frac{2\pi}{\sqrt{2}} = 4.44$. 실효값이라 $\sqrt{2}$ 로 나눈다.
  - label: 자속밀도
    tex: \phi_m = \dfrac{E}{4.44 f N} \;\Longrightarrow\; \phi_m \propto \dfrac{E}{f}
    note: '**E/f 가 일정해야** 포화를 안 한다. VVVF의 근거.'
traps:
  - '**변압기는 주파수를 안 바꾼다.** 전압·전류·임피던스만 바꾼다.'
  - '**$\phi \propto E/f$** — 주파수를 낮추면서 전압을 안 낮추면 **포화**한다. 60Hz용을
    50Hz에 쓰면 위험.'
  - '**권수비는 전류에 대해 역수**다. $a = I_2/I_1$. 뒤집으면 틀린다.'
  - '**임피던스는 권수비의 제곱**으로 환산된다. $Z_1 = a^2 Z_2$.'
related:
  - mc.4.2
  - pw.1.5
  - em.7.2
---

## 변압기의 동작원리

$$
\boxed{\text{\textbf{전자유도}} \;-\; \text{em.7.2의 상호 인덕턴스가 그대로}}
$$

$$
\text{1차에 교류} \to \text{\textbf{교번 자속}} \to \text{철심을 타고} \to \text{2차에서 기전력}
$$

$$
e = -N\dfrac{d\phi}{dt}
$$

**도는 부품이 하나도 없다.** 그래서

| 결과 | |
|---|---|
| **효율이 99%** | 기계손이 없다 |
| **수명이 길다** | 마모가 없다 |
| **보수가 적다** | |
| **소음이 작다** | 자왜뿐 (em.6.7) |

$$
\text{\textbf{전기기기 중 가장 효율이 높다}} \;-\; \text{회전기는 97} \% \text{ 언저리}
$$

### 유기기전력

$$
\boxed{E_1 = 4.44 f \phi_m N_1, \qquad E_2 = 4.44 f \phi_m N_2}
$$

$$
\textbf{같은 } \phi _m \text{ 과 같은 } \text{ f } \text{ 를 공유} \;\Longrightarrow\; \text{\textbf{권수만} 다르다}
$$

$$
\dfrac{E_1}{E_2} = \dfrac{N_1}{N_2}
$$

**이게 변압의 전부**다. 하나의 자속을 두 코일이 나눠 보는데, 감은 횟수가 다르니
기전력이 다르다.

### 4.44는 어디서 나오나

$$
\phi = \phi_m \sin\omega t \;\Longrightarrow\; e = -N\dfrac{d\phi}{dt} = -N\omega\phi_m\cos\omega t
$$

$$
\text{최대값} = N\omega\phi_m = 2\pi f N \phi_m
$$

$$
\text{\textbf{실효값}} = \dfrac{\text{최대값}}{\sqrt{2}} = \dfrac{2\pi f N \phi_m}{\sqrt{2}} = 4.44 f\phi_m N
$$

$$
\boxed{\dfrac{2\pi}{\sqrt{2}} = \dfrac{6.28}{1.414} = 4.44}
$$

**$2\pi$ 를 $\sqrt{2}$ 로 나눈 것**이다. 미분해서 $\omega$ 가 나오고, 실효값이라
$\sqrt{2}$ 로 나눈다.

$$
\text{mc.2.1의 } E = 4.44K_wf\phi N \text{ 은 여기에 \textbf{권선계수}만 붙은 것}
$$

동기기는 권선이 분포·단절되어 있어 $K_w$ 가 붙는다. 변압기는 한 자리에 다 감으니
$K_w = 1$ 이다.

## 권수비

$$
\boxed{a = \dfrac{N_1}{N_2} = \dfrac{E_1}{E_2} = \dfrac{V_1}{V_2} = \dfrac{I_2}{I_1} = \sqrt{\dfrac{Z_1}{Z_2}}}
$$

**네 가지가 한 줄에 있는데 전류만 뒤집혀 있다.**

### 전류가 왜 반대인가

$$
\text{\textbf{에너지 보존}} \;-\; \text{변압기는 전력을 만들지 않는다}
$$

$$
V_1 I_1 = V_2 I_2 \;\Longrightarrow\; \dfrac{I_2}{I_1} = \dfrac{V_1}{V_2} = a
$$

$$
\text{전압을 \textbf{올리면} 전류가 \textbf{준다}}
$$

**공짜가 없다.** $154\ \mathrm{kV}$ 로 올리면 전류가 그만큼 줄고, 그래서 pw.2.1의
송전 손실이 준다.

### 기자력 평형으로 봐도 같다

$$
N_1 I_1 = N_2 I_2 \;\Longrightarrow\; \dfrac{I_2}{I_1} = \dfrac{N_1}{N_2} = a
$$

**2차에 전류가 흐르면 자속을 깎으려 한다**(렌츠). 그러면 $E_1$ 이 줄어 1차 전류가
늘고, **깎인 만큼 정확히 메운다.**

$$
\text{2차가 \textbf{끌어당기는 만큼} 1차가 \textbf{끌어온다}}
$$

$$
\phi_m \text{ 은 \textbf{언제나 일정}} \;-\; \text{부하가 변해도}
$$

**이게 변압기의 자기 조절**이다. mc.1.6의 역기전력과 같은 사고방식이다.

### 임피던스는 제곱

$$
\boxed{Z_1 = a^2 Z_2}
$$

$$
Z_1 = \dfrac{V_1}{I_1} = \dfrac{aV_2}{I_2/a} = a^2\dfrac{V_2}{I_2} = a^2 Z_2
$$

**전압은 $a$ 배, 전류는 $1/a$ 배**니 임피던스는 $a^2$ 배다.

$$
\text{\textbf{임피던스 정합}}(\text{매칭})\text{에 쓰인다}
$$

오디오 앰프와 스피커를 맞출 때, 변압기의 권수비로 임피던스를 맞춘다.

## 주파수를 못 바꾼다

$$
\boxed{\text{변압기는 \textbf{전압・전류・임피던스}만 바꾼다}}
$$

$$
\text{\textbf{주파수는 그대로}} \;-\; \text{자속의 변화 속도가 그대로니}
$$

**주파수를 바꾸려면 인버터가 필요하다**(mc.3.3). 변압기로는 안 된다.

$$
\text{그리고 \textbf{직류는 아예 못 바꾼다}}
$$

$$
\dfrac{d\phi}{dt} = 0 \;\Longrightarrow\; e = 0
$$

**직류를 넣으면 기전력이 0**이고, 권선 저항만 남아 **단락과 같아진다.** 타 버린다.

$$
\text{직류 승압은 \textbf{초퍼}로}(\text{mc.3.3})
$$

## $\phi \propto E/f$ — 중요한 관계

$$
\boxed{\phi_m = \dfrac{E}{4.44 f N} \;\Longrightarrow\; \phi_m \propto \dfrac{E}{f}}
$$

$$
\text{\textbf{E/f 가 자속을 정한다}}
$$

### 왜 중요한가

$$
f \downarrow \text{ 인데 } E \text{ 는 그대로} \;\Longrightarrow\; \phi_m \uparrow \;\Longrightarrow\; \text{\textbf{포화}}
$$

$$
\text{포화} \;\Longrightarrow\; \text{여자전류 급증} \;\Longrightarrow\; \text{과열 ・ 소손}
$$

**$60\ \mathrm{Hz}$ 용 변압기를 $50\ \mathrm{Hz}$ 에 쓰면 위험**하다. 자속이 1.2배가
되어 포화 영역에 들어간다.

$$
\text{반대로 } 50\ \mathrm{Hz} \text{ 용을 } 60\ \mathrm{Hz} \text{ 에 쓰는 건 \textbf{안전}}
$$

$\phi$ 가 줄어드니 포화에서 멀어진다. 다만 철손($P_h \propto f$)은 늘어난다.

### VVVF의 근거

$$
\text{인버터로 주파수를 낮출 때 \textbf{전압도 같이} 낮춰야 한다}
$$

$$
\boxed{\dfrac{V}{f} = \text{일정}}
$$

**pw.5.4의 VVVF**(가변전압 가변주파수)가 왜 전압까지 바꾸는지가 여기 있다. 주파수만
낮추면 전동기 철심이 포화한다.

$$
\text{VVVF} = \text{\textbf{V/f 일정 제어}}
$$

$$
\text{변압기의 } \phi \propto E/f \text{ 가 \textbf{전동기 제어의 원리}가 된다}
$$

## 변압기의 자기회로

$$
\text{\textbf{자속이 도는 길}} \;-\; \text{em.6.4의 자기회로}
$$

$$
\phi = \dfrac{F}{R_m} = \dfrac{NI}{\frac{l}{\mu A}}
$$

**전기회로와 대응**된다. 기자력이 전압, 자속이 전류, 자기저항이 저항이다.

| 전기회로 | 자기회로 |
|---|---|
| 기전력 $E$ | **기자력** $F = NI$ |
| 전류 $I$ | **자속** $\phi$ |
| 저항 $R = \frac{l}{\sigma A}$ | **자기저항** $R_m = \frac{l}{\mu A}$ |

$$
\text{\textbf{철심이 자속의 고속도로}} \;-\; \mu_s \text{ 가 수천이라 자기저항이 작다}
$$

### 누설자속

$$
\text{자속의 \textbf{일부는 철심을 벗어난다}}
$$

$$
\text{\textbf{누설자속}} \;\Longrightarrow\; \text{\textbf{누설 리액턴스}} \;\Longrightarrow\; \text{전압강하 ・ 전압변동률}
$$

**2차와 쇄교하지 않는 자속**이라 전력 전달에 기여하지 않는다. 그냥 방해만 한다.

$$
\text{누설자속을 줄이려면} \;\Longrightarrow\; \text{\textbf{1차와 2차를 가까이}}
$$

**교호배치**(sandwich winding)로 감으면 누설이 준다. mc.4.6의 병렬운전과 mc.4.3의
전압변동률이 다 이것과 얽혀 있다.

**누설변압기**(mc.4.11)는 **일부러 누설을 크게** 만든 것이다. 용접기처럼 전류를
제한해야 하는 곳에 쓴다.

## 변압기의 구조

### 철심 — 내철형과 외철형

| | **내철형** | **외철형** |
|---|---|---|
| 배치 | **철심이 안, 권선이 밖** | **권선이 안, 철심이 밖** |
| 자로 | 1개 | **2개** (분기) |
| 특징 | **구조 간단** | **기계적으로 튼튼** |
| 쓰임 | **대부분** | 대용량 |

$$
\text{\textbf{권선이 철심을 감싸면 내철형, 철심이 권선을 감싸면 외철형}}
$$

**이름이 헷갈린다.** "내철"은 **철심이 안쪽**이라는 뜻이다.

### 철심의 재료

$$
\text{\textbf{규소강판}}(3 \sim 4\% \text{ Si})\text{을 \textbf{성층}}
$$

| 대책 | 줄이는 손실 |
|---|---|
| **규소강판** | **히스테리시스손** |
| **성층** ($0.35\ \mathrm{mm}$) | **와전류손** |

**mc.1.1과 같은 구분**이다. 회전기든 변압기든 규칙이 같다.

$$
\text{\textbf{방향성 규소강판}}\text{이 표준} \;-\; \text{압연 방향으로 자화가 쉽다}
$$

자속이 가는 방향을 미리 정해 두고 그 방향으로 성능을 몰아준 것이다. 철손이 확 준다.

**아몰퍼스**(비정질) 철심은 철손이 더 작다. 결정 구조가 없어 히스테리시스 손실이
$1/3$ 수준이다. 비싸서 배전용에만 쓴다.

## 변압기의 권선법

| 방법 | |
|---|---|
| **동심권** | 1차·2차를 **동심원**으로 (**대부분**) |
| **교호권** | 1차·2차를 **번갈아** 쌓음 (누설 적음) |
| 분할권 | 나눠 감아 누설 조절 |

$$
\text{\textbf{교호권}}(\text{샌드위치})\text{이 누설 리액턴스가 작다}
$$

1차와 2차가 가까울수록 누설이 적다. 다만 **절연이 어렵다** — 고압과 저압이 붙어
있으니.

$$
\text{누설 감소} \;\longleftrightarrow\; \text{절연의 어려움}
$$

**동심권**은 저압을 안쪽(철심 가까이), 고압을 바깥쪽에 놓는다. **절연이 쉬워서**다.
철심은 접지되어 있으니 저압을 가까이 두는 게 안전하다.

$$
\text{안쪽 = \textbf{저압}, 바깥쪽 = \textbf{고압}}
$$

### 냉각

| 방식 | 기호 | |
|---|---|---|
| 건식 자냉 | AN | 소형 |
| **유입 자냉** | **ONAN** | **가장 많이** |
| 유입 풍냉 | ONAF | 팬 추가 |
| **유입 수냉** | ONWF | 대용량 |
| 송유 풍냉 | OFAF | 펌프 + 팬 |

$$
\boxed{\text{\textbf{유입 자냉}}(\text{ONAN})\text{이 표준}}
$$

**절연유**가 두 가지 일을 한다.

$$
\text{\textbf{절연}} + \text{\textbf{냉각}}
$$

기름이 절연도 하고, 대류로 열도 나른다. pw.4.2에서 본 그 절연유다.

**콘서베이터**는 기름의 팽창·수축을 받아 주고 **공기와의 접촉을 막는다.** 기름이
공기와 닿으면 산화·흡습으로 열화한다.

$$
\text{\textbf{브리더}}\text{에 실리카겔} \;-\; \text{들어오는 공기의 \textbf{습기를 제거}}
$$

**부흐홀츠 계전기**는 콘서베이터와 본체 사이에 달아 **내부 고장 시 발생하는 가스**를
검출한다(pw.1.6).

$$
\text{내부 아크} \;\Longrightarrow\; \text{기름 분해} \;\Longrightarrow\; \text{\textbf{가스}} \;\Longrightarrow\; \text{부흐홀츠 동작}
$$

## 정리

$$
\boxed{E = 4.44f\phi_m N \qquad a = \dfrac{N_1}{N_2} = \dfrac{V_1}{V_2} = \dfrac{I_2}{I_1} = \sqrt{\dfrac{Z_1}{Z_2}}}
$$

| 바꾸는 것 | 안 바꾸는 것 |
|---|---|
| **전압** ($a$ 배) | **주파수** |
| **전류** ($1/a$ 배) | **전력** (손실 빼고) |
| **임피던스** ($a^2$ 배) | |

$$
\boxed{\phi \propto \dfrac{E}{f}} \;-\; \text{이 관계가 \textbf{VVVF}까지 이어진다}
$$
