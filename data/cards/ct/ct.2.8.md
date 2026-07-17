---
id: ct.2.8
title: 시퀀스제어
status: reviewed
summary: 불대수가 접점 회로의 문법이다. 직렬이 AND, 병렬이 OR고 드모르간이 둘을 잇는다.
covers:
  - ct.2.8.1
  - ct.2.8.2
  - ct.2.8.3
  - ct.2.8.4
  - ct.2.8.5
  - ct.2.8.6
formulas:
  - label: 접점과 논리
    tex: \text{\textbf{직렬}} = \text{AND}(\cdot), \qquad \text{\textbf{병렬}} = \text{OR}(+)
    note: a접점이 변수 그대로, **b접점이 부정**.
  - label: 드모르간
    tex: \overline{A + B} = \bar{A}\cdot\bar{B}, \qquad \overline{A \cdot B} = \bar{A} + \bar{B}
    note: '**부정하면 AND와 OR가 뒤집힌다**. 불대수의 핵심.'
  - label: 흡수 법칙
    tex: A + AB = A, \qquad A(A+B) = A
    note: 회로를 줄이는 데 가장 많이 쓴다.
  - label: 자기유지
    tex: X = (\text{기동} + X)\cdot\overline{\text{정지}}
    note: '**X가 양변에 있다**. 그게 자기유지의 수식 표현.'
traps:
  - '**직렬이 AND, 병렬이 OR**다. b접점은 부정($\bar{A}$).'
  - '**드모르간은 부정하면 AND↔OR가 뒤집힌다.** 부호만 바꾸면 틀린다.'
  - '**NAND와 NOR만으로 모든 논리**를 만들 수 있다(완전 집합).'
  - '**자기유지 회로는 정전되면 풀린다**(mc.7.7). 페일세이프.'
related:
  - mc.7.7
  - ct.2.1
  - mc.7.4
---

## 시퀀스제어의 특징

$$
\boxed{\text{\textbf{정해진 순서}}\text{대로 진행}}
$$

$$
\text{\textbf{개루프}}(\text{ct.2.1}) \;-\; \text{되먹임이 없다}
$$

| 특징 | |
|---|---|
| **순서대로** | 조건이 맞으면 다음 |
| **개루프** | 결과를 확인 안 함 |
| **ON/OFF** | 연속량이 아님 |
| **논리 연산** | 불대수 |
| **안정도 걱정 없음** | 되먹임이 없으니 |

$$
\text{\textbf{세탁기 ・ 신호등 ・ 엘리베이터 ・ 전동기 기동}}
$$

$$
\boxed{\text{\textbf{산업 현장의 대부분이 시퀀스}}}
$$

**mc.7.7에서 물건으로 다뤘다면** 여기서는 **논리**로 다룬다.

## 제어요소의 동작과 표현

### 접점

$$
\boxed{\text{\textbf{a접점}}(\text{NO}) \;-\; \text{평소 \textbf{열림}}}
$$

$$
\boxed{\text{\textbf{b접점}}(\text{NC}) \;-\; \text{평소 \textbf{닫힘}}}
$$

$$
\text{\textbf{c접점}} \;-\; \text{전환}
$$

$$
\text{mc.7.7에서 본 그것}
$$

### 논리로 옮기면

$$
\boxed{\text{\textbf{a접점}} = A, \qquad \text{\textbf{b접점}} = \bar{A}}
$$

$$
\boxed{\text{\textbf{직렬}} = A \cdot B \;(\text{\textbf{AND}}), \qquad \text{\textbf{병렬}} = A + B \;(\text{\textbf{OR}})}
$$

$$
\text{\textbf{직렬은 둘 다 닫혀야 통한다}} \;\Longrightarrow\; \text{AND}
$$

$$
\text{\textbf{병렬은 하나만 닫혀도 통한다}} \;\Longrightarrow\; \text{OR}
$$

$$
\boxed{\text{\textbf{회로가 곧 논리식}}}
$$

$$
\text{\textbf{그림을 식으로, 식을 그림으로}} \;-\; \text{서로 옮길 수 있다}
$$

### 시퀀스 표현법

| 방법 | |
|---|---|
| **회로도** | 접점을 그림으로 |
| **논리식** | 불대수 |
| **논리회로도** | 게이트 기호 |
| **타임차트** | 시간에 따른 ON/OFF |
| **플로차트** | 순서도 |
| **래더 다이어그램** | PLC (mc.7.7) |

$$
\text{\textbf{래더가 표준}} \;-\; \text{회로도를 그대로 흉내낸 언어}
$$

## 불대수의 기본정리

$$
\text{\textbf{0과 1만 있는 대수}}
$$

| 법칙 | 식 |
|---|---|
| **교환** | $A+B = B+A$, $AB = BA$ |
| **결합** | $(A+B)+C = A+(B+C)$ |
| **분배** | $A(B+C) = AB+AC$ |
| **항등** | $A+0 = A$, $A\cdot1 = A$ |
| **지배** | $A+1 = 1$, $A\cdot0 = 0$ |
| **멱등** | **$A+A = A$**, **$A\cdot A = A$** |
| **보원** | $A+\bar{A} = 1$, $A\bar{A} = 0$ |
| **이중부정** | $\bar{\bar{A}} = A$ |
| **흡수** | **$A+AB = A$**, **$A(A+B) = A$** |
| **드모르간** | **$\overline{A+B} = \bar{A}\bar{B}$** |

$$
\text{\textbf{보통 대수와 다른 것}}\text{에 주의}
$$

$$
\boxed{A + A = A \;-\; \text{\textbf{2A가 아니다}}}
$$

$$
\boxed{A + 1 = 1 \;-\; \text{\textbf{2가 아니다}}}
$$

$$
\text{\textbf{1보다 큰 수가 없다}} \;-\; \text{켜져 있거나 꺼져 있거나}
$$

### 흡수 법칙

$$
\boxed{A + AB = A}
$$

$$
A + AB = A(1 + B) = A \cdot 1 = A \;\checkmark
$$

$$
\text{\textbf{$1+B = 1$ 이 열쇠}} \;-\; \text{B가 뭐든 상관없다}
$$

$$
\text{\textbf{직관}}: A \text{ 가 켜지면 이미 통하니 } AB \text{ 는 볼 것도 없다}
$$

$$
\text{\textbf{회로를 줄이는 데 가장 많이 쓴다}}
$$

$$
A + \bar{A}B = A + B \;-\; \text{\textbf{변형}}\text{도 자주}
$$

### 드모르간 — 핵심

$$
\boxed{\overline{A + B} = \bar{A}\cdot\bar{B}, \qquad \overline{A \cdot B} = \bar{A} + \bar{B}}
$$

$$
\text{\textbf{부정하면 AND와 OR가 뒤집힌다}}
$$

$$
\text{\textbf{부호만 바꾸면 틀린다}} \;-\; \text{연산자도 바꿔야}
$$

$$
\text{\textbf{직관}}: \text{"\textbf{둘 다 아니다}" = "\textbf{하나도 없다}"}
$$

$$
\overline{A+B} \;-\; \text{\textbf{A도 B도 안 켜짐}} \;\Longleftrightarrow\; \bar{A}\text{ 이고 }\bar{B}
$$

$$
\boxed{\text{\textbf{불대수의 가장 중요한 정리}}}
$$

$$
\text{\textbf{NAND・NOR만으로 모든 걸 만드는} 근거}
$$

## 논리회로

| 게이트 | 식 | 회로 |
|---|---|---|
| **AND** | $A \cdot B$ | **직렬** |
| **OR** | $A + B$ | **병렬** |
| **NOT** | $\bar{A}$ | **b접점** |
| **NAND** | $\overline{A\cdot B}$ | AND + NOT |
| **NOR** | $\overline{A+B}$ | OR + NOT |
| **XOR** | $A\bar{B} + \bar{A}B$ | **다르면 1** |
| **XNOR** | $AB + \bar{A}\bar{B}$ | **같으면 1** |

$$
\boxed{\text{\textbf{XOR은 "다르면 1"}}} \;-\; \text{일치 검출의 반대}
$$

$$
\text{\textbf{XOR로 반가산기}}\text{를 만든다} \;-\; \text{합은 XOR, 자리올림은 AND}
$$

### NAND·NOR의 완전성

$$
\boxed{\text{\textbf{NAND만으로 모든 논리}}\text{를 만들 수 있다}}
$$

$$
\text{NOT} = \overline{A \cdot A} \;-\; \text{두 입력에 같은 걸}
$$

$$
\text{AND} = \overline{\overline{A\cdot B}} \;-\; \text{NAND 두 번}
$$

$$
\text{OR} = \overline{\bar{A}\cdot\bar{B}} \;-\; \text{드모르간}
$$

$$
\boxed{\text{\textbf{드모르간 덕분}}}
$$

$$
\text{\textbf{NOR도 마찬가지}}
$$

$$
\text{\textbf{실제 IC가 NAND 위주}}\text{인 이유} \;-\; \text{한 종류로 다 되니 싸다}
$$

$$
\text{\textbf{CMOS에서 NAND가 NOR보다 빠르다}} \;-\; \text{그래서 NAND가 표준}
$$

## 논리식의 간소화

$$
\text{\textbf{같은 동작을 더 적은 접점으로}}
$$

| 방법 | |
|---|---|
| **불대수** | 정리를 써서 |
| **카르노맵** | **그림으로** — 4변수까지 |
| 퀸-맥클러스키 | 컴퓨터용 |

$$
\text{\textbf{카르노맵}} \;-\; \text{인접한 1을 묶는다}
$$

$$
\text{\textbf{2의 거듭제곱}}\text{으로 묶어야} \;-\; 1, 2, 4, 8
$$

$$
\text{\textbf{크게 묶을수록 간단}}\text{해진다}
$$

$$
\text{\textbf{그레이 코드}}\text{로 배열} \;-\; \text{인접 칸이 한 비트만 다르게}
$$

$$
\text{\textbf{그래야 묶으면 변수가 사라진다}}
$$

$$
AB + A\bar{B} = A(B + \bar{B}) = A \;-\; \text{\textbf{B가 사라졌다}}
$$

$$
\boxed{\text{\textbf{두 칸을 묶으면 변수 하나가 사라진다}}}
$$

## 유접점회로

$$
\text{\textbf{릴레이 ・ 접촉기}}\text{로 구성}(\text{mc.7.7})
$$

| 장점 | 단점 |
|---|---|
| **큰 전류** | **접점 마모** |
| **완전 절연** | **느리다** ($\mathrm{ms}$) |
| **과부하에 강함** | **소음** |
| 회로가 직관적 | 크다 |

$$
\text{\textbf{주회로}}\text{에는 아직 유접점} \;-\; \text{큰 전류를 끊어야}
$$

### 자기유지 회로

$$
\boxed{X = (\text{\textbf{기동}} + X) \cdot \overline{\text{\textbf{정지}}}}
$$

$$
\text{\textbf{X가 양변에 있다}} \;-\; \text{그게 자기유지의 수식 표현}
$$

$$
\text{\textbf{자기 출력을 자기 입력으로}} \;-\; \text{되먹임}
$$

$$
\text{\textbf{기동을 놓아도}} \;\Longrightarrow\; X \text{ 가 } X \text{ 를 유지}
$$

$$
\text{\textbf{정지를 누르면}} \;\Longrightarrow\; \overline{\text{정지}} = 0 \;\Longrightarrow\; X = 0
$$

$$
\boxed{\text{\textbf{정지가 곱해져 있어서 우선}}}
$$

$$
\text{\textbf{AND라 하나만 0이어도 전체가 0}}
$$

$$
\text{\textbf{mc.7.7의 "정지가 우선"}}\text{이 식으로 설명된다}
$$

### 정전되면 풀린다

$$
\text{\textbf{전원이 없으면}} \;\Longrightarrow\; X = 0 \;\Longrightarrow\; \text{\textbf{자기유지 해제}}
$$

$$
\boxed{\text{\textbf{페일세이프}}}
$$

$$
\text{\textbf{mc.7.7에서 본 네 곳}}\text{의 사상} \;-\; \text{전기가 끊기면 안전한 쪽으로}
$$

### 인터록

$$
\boxed{X = (\cdots) \cdot \bar{Y}, \qquad Y = (\cdots) \cdot \bar{X}}
$$

$$
\text{\textbf{서로의 부정을 곱한다}}
$$

$$
X = 1 \;\Longrightarrow\; \bar{X} = 0 \;\Longrightarrow\; Y = 0
$$

$$
\text{\textbf{동시에 1이 될 수 없다}}
$$

$$
\text{\textbf{mc.7.7의 b접점 인터록}}\text{이 이 식}
$$

## 무접점회로

$$
\text{\textbf{반도체}}\text{로 구성} \;-\; \text{IC ・ 트랜지스터}
$$

| 장점 | 단점 |
|---|---|
| **빠르다** ($\mu s$ 이하) | **작은 전류** |
| **수명이 길다** | **절연이 약함** |
| **작다** | **과부하에 약함** |
| **소음 없음** | 잡음에 민감 |
| **접점 마모 없음** | |

$$
\boxed{\text{\textbf{제어 회로는 무접점, 주회로는 유접점}}}
$$

$$
\text{\textbf{역할 분담}} \;-\; \text{PLC가 판단하고 접촉기가 끊는다}
$$

$$
\text{\textbf{mc.7.4의 계전기와 차단기}}\text{의 관계와 같다}
$$

$$
\text{\textbf{판단은 반도체, 차단은 기계}}
$$

### PLC

$$
\text{\textbf{배선 대신 프로그램}}(\text{mc.7.7})
$$

$$
\text{\textbf{래더 다이어그램}} \;-\; \text{유접점 회로도를 그대로}
$$

$$
\text{\textbf{스캔 방식}}\text{으로 동작} \;-\; \text{위에서 아래로 반복}
$$

$$
\text{\textbf{ct.2.7의 샘플링}}\text{과 같은 이야기} \;-\; \text{띄엄띄엄 본다}
$$

$$
\text{\textbf{스캔 타임}}\text{이 곧 샘플링 주기}
$$

$$
\text{\textbf{빠른 신호를 놓칠 수 있다}} \;-\; \text{인터럽트나 고속 카운터로 보완}
$$

**디지털의 대가**가 여기서도 나온다. 연속을 이산으로 보는 순간 놓치는 게 생긴다.

## 타임차트

$$
\text{\textbf{시간에 따른 ON/OFF}}\text{를 그린다}
$$

$$
\text{\textbf{순서와 타이밍}}\text{을 한눈에}
$$

$$
\text{\textbf{시퀀스 설계의 출발점}} \;-\; \text{원하는 동작을 먼저 그리고 회로를 짠다}
$$

## 정리

$$
\boxed{\text{\textbf{직렬} = AND}(\cdot), \qquad \text{\textbf{병렬} = OR}(+), \qquad \text{\textbf{b접점} = NOT}(\bar{\;})}
$$

$$
\boxed{\overline{A+B} = \bar{A}\bar{B}, \qquad \overline{AB} = \bar{A}+\bar{B}} \;-\; \text{\textbf{드모르간}}
$$

$$
\boxed{A + AB = A} \;-\; \text{\textbf{흡수}}, \text{ 회로 축약의 주력}
$$

$$
\boxed{X = (\text{기동} + X)\cdot\overline{\text{정지}}} \;-\; \text{\textbf{자기유지}}
$$

| | 유접점 | 무접점 |
|---|---|---|
| **속도** | 느림 | **빠름** |
| **전류** | **큼** | 작음 |
| **수명** | 마모 | **길다** |
| 자리 | **주회로** | **제어회로** |

$$
\text{\textbf{불대수가 접점 회로의 문법}} \;-\; \text{그림과 식이 같은 것}
$$
