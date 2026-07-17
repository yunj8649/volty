---
id: mc.6.5
title: 3상 직권 정류자 전동기
status: reviewed
summary: 중간변압기로 전압을 낮춰 정류를 살리고 속도를 조절한다. 그 변압기가 핵심이다.
covers:
  - mc.6.5.1
  - mc.6.5.2
  - mc.6.5.3
  - mc.6.5.4
formulas:
  - label: 중간변압기의 역할
    tex: \text{\textbf{전기자 전압을 낮춤}} + \text{\textbf{권수비로 속도 조정}} + \text{\textbf{경부하 속도 억제}}
    note: 셋 다 한다. 이 기계의 핵심 부품.
  - label: 특성
    tex: T \propto I^2, \qquad N \propto \dfrac{1}{I} \;-\; \text{\textbf{직권 특성}}
    note: 직류 직권(mc.1.7)과 같다.
  - label: 속도 제어
    tex: \text{\textbf{브러시 이동}} \;\Longrightarrow\; \text{연속 조정}
    note: 동기속도 위아래로 자유롭게.
traps:
  - '**중간변압기가 세 가지 일**을 한다 — 전압 강하·속도 조정·경부하 속도 억제.'
  - '**경부하에서 속도가 폭주**하는 직권의 약점을, 중간변압기의 철심 포화로 막는다.'
  - '3상 직권은 **동기속도 위아래 모두** 운전할 수 있다.'
related:
  - mc.6.2
  - mc.6.6
  - mc.1.7
---

## 개요

$$
\boxed{\text{\textbf{3상 교류}}\text{로 도는 \textbf{직권 정류자 전동기}}}
$$

$$
\text{\textbf{단상 직권}}(\text{mc.6.2})\text{의 3상 판}
$$

$$
\text{\textbf{속도를 넓게 조절}}\text{할 수 있는 게 목적}
$$

$$
\text{유도전동기는 \textbf{동기속도 아래}}\text{에서만 도는데}(\text{mc.5.1})
$$

$$
\boxed{\text{\textbf{3상 직권은 동기속도 위아래 모두}}}
$$

**이게 매력이었다.** 인버터 이전에 넓은 속도 제어가 필요하면 이 기계였다.

## 구조

| 부분 | |
|---|---|
| **고정자** | 3상 권선 (계자) |
| **회전자** | 전기자 + **정류자** |
| **브러시** | 이동 가능 |
| **중간변압기** | **핵심 부품** |

$$
\boxed{\text{\textbf{중간변압기}}(\text{intermediate transformer})\text{가 이 기계의 정체}}
$$

## 중간변압기 — 세 가지 일을 한다

$$
\text{\textbf{전원과 전기자 사이}}\text{에 변압기를 넣는다}
$$

### ① 전기자 전압을 낮춘다

$$
\text{정류자에 걸리는 전압이 높으면} \;\Longrightarrow\; \text{\textbf{편간전압}} \uparrow \;\Longrightarrow\; \text{\textbf{섬락}}(\text{mc.1.1})
$$

$$
\text{\textbf{변압기로 낮춰서} 정류를 살린다}
$$

$$
\text{\textbf{계통 전압은 높고 정류자는 낮은 전압을 원한다}} \;\Longrightarrow\; \text{\textbf{그 사이를 잇는다}}
$$

### ② 권수비로 속도를 조정한다

$$
\text{\textbf{탭}}\text{을 바꾸면} \;\Longrightarrow\; \text{전기자 전압} \downarrow \;\Longrightarrow\; \text{\textbf{속도} } \downarrow
$$

$$
\text{\textbf{브러시 이동}}\text{과 함께 \textbf{두 가지 조절 수단}}
$$

### ③ 경부하 속도를 억제한다 — 가장 흥미롭다

$$
\text{\textbf{직권의 약점}}: \text{부하가 없으면 } I \to 0 \;\Longrightarrow\; \phi \to 0 \;\Longrightarrow\; N \to \infty \quad(\text{mc.1.7})
$$

$$
\boxed{\text{\textbf{중간변압기의 철심을 일부러 포화}}\text{시킨다}}
$$

$$
\text{경부하} \;\Longrightarrow\; \text{여자전류가 상대적으로 커짐} \;\Longrightarrow\; \text{\textbf{철심 포화}} \;\Longrightarrow\; \text{\textbf{자속이 안 줄어듦}}
$$

$$
\phi \text{ 가 유지되면} \;\Longrightarrow\; N \text{ 이 \textbf{안 폭주한다}}
$$

$$
\text{\textbf{포화를 대책으로 쓴다}}
$$

**대부분의 기계에서 포화는 골칫거리**였다(mc.4.1의 변압기, mc.2.3의 동기기). 여기서는
**일부러 포화시켜** 속도를 잡는다.

$$
\text{\textbf{결점을 도구로}} \;-\; \text{mc.4.11의 누설변압기와 같은 발상}
$$

**누설변압기**도 누설이라는 결점을 수하특성으로 바꿨다. 여기서는 포화를 안전장치로
바꿨다.

## 원리

$$
\text{\textbf{3상 회전자계}}(\text{mc.5.1})\text{가 있는데 \textbf{정류자}}\text{도 있다}
$$

$$
\text{브러시 위치로 \textbf{전기자 기자력의 방향}}\text{을 정한다}
$$

$$
T \propto \phi I_a \;-\; \text{자속과 전류가 \textbf{직렬}이라 같이 뒤집힘}(\text{mc.6.1})
$$

$$
\boxed{T \propto I^2, \qquad N \propto \dfrac{1}{I}}
$$

**직류 직권과 같은 특성**이다. 3상이 되어도 직권은 직권이다.

## 벡터도

$$
V = E + I(r + jx)
$$

$$
\text{\textbf{리액턴스 강하}}\text{가 역률을 망친다} \;-\; \text{mc.6.2와 같은 문제}
$$

$$
\text{\textbf{속도가 오르면}} \;\Longrightarrow\; E \propto N\phi \text{ 가 커짐} \;\Longrightarrow\; \text{\textbf{역률 개선}}
$$

$$
\text{\textbf{고속에서 역률이 좋다}} \;-\; \text{만능전동기와 같은 이야기}
$$

**보상권선**을 달아 전기자 반작용을 없애면 역률이 더 좋아진다.

$$
\text{\textbf{동기속도 근처에서 역률이 최대}}
$$

## 종류

| 종류 | |
|---|---|
| **직접형** | 전원 → 전기자 직결 |
| **간접형** | **중간변압기** 경유 (**대부분**) |

$$
\text{\textbf{간접형이 실용}} \;-\; \text{중간변압기의 세 가지 이점 때문}
$$

## 특성

| 항목 | |
|---|---|
| **토크** | $T \propto I^2$ — **기동토크 큼** |
| **속도** | **동기속도 위아래 자유** |
| **속도 제어** | **브러시 이동** + **탭** — 연속 |
| **역률** | **고속에서 좋음** |
| **경부하** | 중간변압기 포화로 **억제** |

$$
\boxed{\text{\textbf{넓은 속도 제어 + 큰 기동토크}}}
$$

$$
\text{\textbf{용도}}: \text{인쇄기 ・ 압연기 ・ 송풍기}(\text{옛날})
$$

### 왜 사라졌나

$$
\text{\textbf{정류자}} + \text{\textbf{중간변압기}} \;\Longrightarrow\; \text{\textbf{크고 복잡하고 비싸다}}
$$

$$
\text{\textbf{인버터}}\text{가 같은 일을 \textbf{훨씬 싸고 작게}}
$$

$$
\boxed{\text{\textbf{농형 유도전동기 + 인버터}} \;-\; \text{정류자도 중간변압기도 필요 없다}}
$$

**mc.5.4의 VVVF**가 이 기계를 통째로 대체했다. 속도 제어 범위도 더 넓고, 보수도 없다.

$$
\text{\textbf{다섯 번째}}\text{다} \;-\; \text{정류자 ・ 권선형 ・ 특수 농형 ・ 교류정류자기 ・ 3상 직권}
$$

## 정리

$$
\boxed{\text{\textbf{중간변압기}}\text{가 \textbf{세 가지 일}}}
$$

| 일 | 왜 |
|---|---|
| **전압 강하** | 정류자 섬락 방지 |
| **속도 조정** | 탭으로 |
| **경부하 속도 억제** | **철심 포화**를 이용 |

$$
\boxed{T \propto I^2, \quad N \propto \dfrac{1}{I} \;-\; \text{직권 특성}}
$$

$$
\text{\textbf{동기속도 위아래 모두} 운전 가능} \;-\; \text{유도전동기가 못 하던 것}
$$

**포화를 일부러 일으켜 폭주를 막는 설계**가 이 기계에서 가장 볼 만한 대목이다.
