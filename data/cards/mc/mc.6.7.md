---
id: mc.6.7
title: 정류자형 주파수 변환기
status: reviewed
summary: 회전자를 돌려서 주파수를 바꾼다. 회전 속도가 곧 주파수 차이가 된다.
covers:
  - mc.6.7.1
  - mc.6.7.2
formulas:
  - label: 출력 주파수
    tex: f_2 = f_1 \pm \dfrac{P N}{120} \;-\; \text{회전 방향에 따라 } \pm
    note: '**돌리는 속도가 주파수 차이**를 만든다.'
  - label: 정지 시
    tex: N = 0 \;\Longrightarrow\; f_2 = f_1 \;-\; \text{\textbf{변압기}}
    note: 안 돌리면 그냥 변압기다.
  - label: 용도
    tex: \text{\textbf{권선형 유도전동기의 2차 여자}} \;-\; \text{셰르비우스}
    note: 슬립 주파수 전압을 만들어 공급한다.
traps:
  - '**회전 방향이 주파수를 올릴지 내릴지** 정한다. $f_2 = f_1 \pm \frac{PN}{120}$.'
  - '**안 돌리면 변압기**다. $N=0$ 이면 $f_2 = f_1$.'
  - '주된 용도는 **권선형 유도전동기의 2차 여자**다. 독립 주파수 변환기가 아니다.'
related:
  - mc.6.6
  - mc.5.4
  - mc.3.3
---

## 개요

$$
\boxed{\text{\textbf{회전자를 돌려서 주파수를 바꾼다}}}
$$

$$
\text{\textbf{정류자}}\text{가 있는 \textbf{회전기}}\text{인데 \textbf{전동기가 아니다}}
$$

$$
\text{\textbf{목적이 회전이 아니라 주파수 변환}}
$$

$$
\text{\textbf{외부에서 돌려 준다}} \;-\; \text{보통 유도전동기로}
$$

## 속도

$$
\boxed{f_2 = f_1 \pm \dfrac{P N}{120}}
$$

$$
\text{\textbf{돌리는 속도가 주파수 차이}}\text{를 만든다}
$$

### 왜 이렇게 되나

$$
\text{\textbf{동기속도}}: N_s = \dfrac{120 f_1}{P} \;\Longrightarrow\; f_1 = \dfrac{P N_s}{120} \quad(\text{mc.2.1})
$$

$$
\text{회전자를 } N \text{ 으로 돌리면} \;\Longrightarrow\; \text{\textbf{상대속도}}\text{가 } N_s \mp N
$$

$$
f_2 = \dfrac{P(N_s \mp N)}{120} = f_1 \mp \dfrac{PN}{120}
$$

$$
\boxed{\text{\textbf{mc.5.1의 슬립}}\text{과 같은 이야기}}
$$

$$
f_2 = s f_1 \quad\text{에서}\quad s = \dfrac{N_s - N}{N_s} \;\Longrightarrow\; f_2 = f_1\dfrac{N_s - N}{N_s} = f_1 - \dfrac{PN}{120}
$$

**유도전동기의 $f_2 = sf_1$** 을 다르게 쓴 것뿐이다(mc.5.2).

$$
\text{\textbf{유도기: 슬립이 주파수를 정한다}} \;\Longrightarrow\; \text{\textbf{여기: 속도로 주파수를 만든다}}
$$

**같은 물리를 목적만 바꿔 쓴다.** 유도기는 회전이 목적이고 주파수는 부산물인데,
여기서는 **주파수가 목적**이고 회전은 수단이다.

### 회전 방향이 부호를 정한다

$$
\text{\textbf{회전자계와 같은 방향}}\text{으로 돌리면} \;\Longrightarrow\; f_2 = f_1 - \dfrac{PN}{120} \;(\text{\textbf{주파수 감소}})
$$

$$
\text{\textbf{반대 방향}}\text{으로 돌리면} \;\Longrightarrow\; f_2 = f_1 + \dfrac{PN}{120} \;(\text{\textbf{주파수 증가}})
$$

$$
\boxed{\text{\textbf{방향이 올릴지 내릴지를 정한다}}}
$$

### 정지 시

$$
N = 0 \;\Longrightarrow\; f_2 = f_1
$$

$$
\boxed{\text{\textbf{안 돌리면 그냥 변압기}}}
$$

$$
s = 1 \;\Longrightarrow\; f_2 = f_1 \;-\; \text{mc.5.2의 "정지 시 유도기 = 변압기"}
$$

**당연하다.** 상대속도가 동기속도 그대로면 주파수도 그대로다.

### 동기속도로 돌리면

$$
N = N_s \;\Longrightarrow\; f_2 = 0 \;-\; \text{\textbf{직류}}
$$

$$
s = 0 \;\Longrightarrow\; f_2 = 0
$$

**유도기가 동기속도에서 토크가 0인 이유**(mc.5.1)와 같은 지점이다. 자속을 안 끊으니
주파수가 0이다.

$$
\textbf{0에서 } \text{ f} _1 \text{ 까지 연속적}\text{으로 만들 수 있다}
$$

## 운전

$$
\text{\textbf{주된 용도}}: \text{\textbf{권선형 유도전동기의 2차 여자}}
$$

$$
\text{mc.5.4의 \textbf{셰르비우스}} \;\Longrightarrow\; \text{2차에 \textbf{슬립 주파수}}\text{ 전압을 넣어야}
$$

$$
\boxed{\text{\textbf{슬립 주파수는 계속 변한다}}} \;-\; \text{속도에 따라}
$$

$$
\text{\textbf{그 주파수를 어떻게 만드나?}}
$$

$$
\text{\textbf{같은 축에 물려 돌리면}} \;\Longrightarrow\; \text{\textbf{저절로 슬립 주파수}}\text{가 나온다}
$$

$$
\text{주 전동기의 속도} = N \;\Longrightarrow\; \text{주파수 변환기도 } N \text{ 으로 회전} \;\Longrightarrow\; f_2 = sf_1
$$

$$
\boxed{\text{\textbf{축을 물리기만 하면 주파수가 저절로 맞는다}}}
$$

**이게 우아한 지점**이다. 슬립이 변하면 주파수 변환기의 출력 주파수도 **저절로**
따라 변한다. 제어할 게 없다.

$$
\text{\textbf{같은 축 = 같은 슬립 = 같은 주파수}}
$$

### 다른 용도

| 용도 | |
|---|---|
| **2차 여자** (셰르비우스) | **주용도** |
| 저주파 전원 | 전기로 |
| 시험용 가변 주파수 전원 | |

$$
\text{\textbf{독립적인 주파수 변환기로는 잘 안 썼다}}
$$

**계통 연계용 주파수 변환**(60Hz ↔ 50Hz)에는 **회전 변류기**나 **모터-제너레이터
세트**를 썼다. 정류자형은 소용량 2차 여자용이다.

## 왜 사라졌나

$$
\text{\textbf{인버터}}\text{가 주파수를 \textbf{자유롭게} 만든다}(\text{mc.3.3})
$$

$$
\text{\textbf{돌아가는 부품 없이}} \;\Longrightarrow\; \text{정류자도 브러시도 축도 필요 없다}
$$

$$
\boxed{\text{\textbf{정지 셀비어스}}} \;-\; \text{mc.5.4에서 본 그것}
$$

$$
\text{2차 슬립 전력} \to \text{\textbf{정류}} \to \text{\textbf{인버터}} \to \text{계통}
$$

$$
\text{\textbf{"정지"}}\text{라는 말이 붙은 이유} \;-\; \text{도는 게 없다}
$$

**옛날 셰르비우스는 회전기(주파수 변환기 + 직류기)를 썼다.** 반도체가 그걸 다 없애서
**정지형**이 되었다.

$$
\text{\textbf{회전 셀비어스}} \to \text{\textbf{정지 셀비어스}}
$$

## 정리

$$
\boxed{f_2 = f_1 \pm \dfrac{PN}{120}}
$$

| 회전 | $f_2$ |
|---|---|
| **정지** ($N=0$) | $f_1$ — **변압기** |
| **자계와 같은 방향** | $f_1 - \frac{PN}{120}$ — **감소** |
| **반대 방향** | $f_1 + \frac{PN}{120}$ — **증가** |
| **동기속도** | **0** — 직류 |

$$
\boxed{\text{\textbf{용도: 권선형 유도전동기의 2차 여자}}(\text{셰르비우스})}
$$

$$
\text{\textbf{같은 축에 물리면 슬립 주파수가 저절로}}
$$

**mc.5.2의 $f_2 = sf_1$ 을 뒤집어 쓴 기계**다. 유도기에서는 슬립이 주파수를 만들었는데,
여기서는 **주파수를 얻으려고 슬립을 만든다.**

$$
\text{\textbf{같은 물리, 반대 목적}}
$$
