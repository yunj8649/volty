---
id: mc.6.2
title: 단상직권 정류자 전동기
status: reviewed
summary: 교류정류자기 중 유일하게 살아남았다. 직류·교류 겸용이라 만능전동기라 부른다.
covers:
  - mc.6.2.1
  - mc.6.2.2
  - mc.6.2.3
  - mc.6.2.4
formulas:
  - label: 토크
    tex: T = K\phi I_a \;-\; \phi \propto I_a \;\Longrightarrow\; T \propto I_a^2
    note: 직류 직권(mc.1.7)과 같다. **교류에서도 제곱**.
  - label: 왜 교류로 도나
    tex: (-\phi)(-I_a) = \phi I_a \;-\; \text{\textbf{둘이 같이 뒤집힌다}}
    note: 직렬이라 자속과 전류가 동시에 방향을 바꾼다.
  - label: 교류에서 나빠지는 것
    tex: \text{\textbf{역률}} \downarrow, \quad \text{\textbf{정류}} \downarrow, \quad \text{\textbf{토크}} \downarrow
    note: 계자 인덕턴스와 변압기 기전력 때문.
  - label: 대책
    tex: \textbf{계자 권수 } \downarrow + \text{\textbf{보상권선}} + \text{\textbf{저항 리드}}
    note: 직류기와 반대로 계자를 약하게 한다.
traps:
  - '**만능전동기(universal motor)** — 교류·직류 겸용이다. 드릴·믹서·청소기에 지금도 쓴다.'
  - '**교류용은 계자 권수를 줄인다.** 직류기와 반대다. 인덕턴스를 줄여 역률을 지키려고.'
  - '**약계자로 만든 대신 전기자 반작용이 커져** 보상권선이 필수가 된다.'
  - '**무부하 위험**은 직류 직권과 같다. 벨트 운전 금지.'
related:
  - mc.1.7
  - mc.6.1
  - mc.6.3
---

## 개요

$$
\boxed{\text{\textbf{교류정류자기 중 유일하게 살아남은 기계}}}
$$

$$
\text{\textbf{만능전동기}}(\text{universal motor}) \;-\; \text{\textbf{교류・직류 겸용}}
$$

| 용도 | |
|---|---|
| **전동 드릴** | |
| **믹서 · 청소기** | |
| **헤어드라이어** | |
| 전기 재봉틀 | |
| (옛날) **전기 기관차** | |

$$
\text{\textbf{작고 ・ 가볍고 ・ 고속이고 ・ 기동토크가 큰} 곳}
$$

### 왜 살아남았나

$$
\text{\textbf{고속 회전}}\text{이 가능하다} \;-\; 10{,}000 \sim 30{,}000\ \mathrm{rpm}
$$

$$
\text{유도전동기는 } N_s = \dfrac{120f}{P} \leq 3600\ \mathrm{rpm}(\text{2극 } 60\ \mathrm{Hz})
$$

$$
\boxed{\text{\textbf{동기속도의 제약이 없다}}}
$$

**직권이라 무부하에서 속도가 폭주**하는데(mc.1.7), 그게 여기서는 **장점**이 된다.
드릴은 빨라야 좋다.

$$
\text{\textbf{같은 출력에 작고 가볍다}} \;-\; \text{손에 드는 공구에 결정적}
$$

$$
\text{\textbf{기동토크가 크다}}(T \propto I_a^2) \;-\; \text{드릴이 물리면 힘을 낸다}
$$

$$
\text{\textbf{인버터를 달면 비싸진다}} \;-\; \text{만 원짜리 드릴에 인버터를 넣겠나}
$$

**싸고 작아야 하는 곳**에서는 아직 이긴다. 그게 유일한 생존 영역이다.

## 원리

$$
\boxed{(-\phi)(-I_a) = \phi I_a \;-\; \text{\textbf{둘이 같이 뒤집힌다}}}
$$

$$
\text{계자와 전기자가 \textbf{직렬}} \;\Longrightarrow\; \text{같은 전류} \;\Longrightarrow\; \text{\textbf{항상 동시에} 방향 전환}
$$

$$
\text{\textbf{토크 방향이 유지된다}} \;\Longrightarrow\; \text{교류에서도 한 방향으로 돈다}
$$

**mc.6.1에서 본 그것**이다. 음수 곱하기 음수는 양수다.

### 특성은 직류 직권과 같다

$$
\phi \propto I_a \;\Longrightarrow\; \boxed{T \propto I_a^2}
$$

$$
N \propto \dfrac{1}{I_a} \;\Longrightarrow\; \boxed{T \propto \dfrac{1}{N^2}}
$$

**mc.1.7의 직권전동기와 판박이**다. 저속에서 토크가 크고 무부하에서 폭주한다.

$$
\text{\textbf{무부하 운전 금지}} \;-\; \text{벨트 운전 금지}
$$

**드릴은 무부하로 돌려도 되나?** 된다. 팬과 기어의 마찰이 부하 역할을 하고, 애초에
그 속도를 견디게 설계했다.

## 교류에서 나빠지는 것

$$
\boxed{\text{\textbf{역률} ・ \textbf{정류} ・ \textbf{토크}} \;-\; \text{셋 다 나빠진다}}
$$

**직류로 돌릴 때가 더 좋다.** 교류는 감수하는 것이다.

### ① 역률이 나쁘다

$$
\text{계자 권선의 \textbf{인덕턴스}}\text{가 전류를 뒤지게 한다}
$$

$$
\text{직권이라 계자에 \textbf{큰 전류}}\text{가 흐름} \;\Longrightarrow\; \text{인덕턴스가 크게 설계됨} \;\Longrightarrow\; \text{\textbf{리액턴스 강하}}
$$

$$
\text{\textbf{역률} } \downarrow, \qquad \text{\textbf{전압강하} } \uparrow
$$

$$
\boxed{\text{\textbf{대책: 계자 권수를 줄인다}}}
$$

$$
\text{\textbf{직류기와 반대}} \;-\; \text{직류는 계자를 세게 하는 게 좋았다}
$$

**mc.1.8에서 "기동 시 계자저항 최소"** 라고 했는데, 여기서는 **계자를 약하게** 만든다.
인덕턴스를 줄여 역률을 지키는 게 우선이다.

$$
L \propto N^2 \;\Longrightarrow\; \text{권수를 줄이면 인덕턴스가 \textbf{제곱으로} 준다}
$$

### ② 약계자의 대가 — 전기자 반작용

$$
\text{계자를 약하게} \;\Longrightarrow\; \phi \downarrow \;\Longrightarrow\; \text{\textbf{전기자 기자력이 상대적으로 커짐}}
$$

$$
\text{\textbf{전기자 반작용이 심해진다}}(\text{mc.1.4})
$$

$$
\boxed{\text{\textbf{보상권선이 필수}}}
$$

$$
\text{보상권선을 \textbf{전기자와 직렬}}\text{로} \;\Longrightarrow\; \text{반대 방향 기자력} \;\Longrightarrow\; \text{반작용 상쇄}
$$

**mc.1.4의 보상권선**이 여기서는 선택이 아니라 필수다.

$$
\text{\textbf{역률을 지키려 계자를 줄였더니} 반작용이 커져 \textbf{보상권선이 필요해졌다}}
$$

**연쇄적인 대가**다. 하나를 고치면 다른 게 나빠진다.

### ③ 정류가 나쁘다 — 변압기 기전력

$$
\text{계자 자속이 \textbf{교번}} \;\Longrightarrow\; \text{정류 중인 코일에 } e = -N\dfrac{d\phi}{dt}
$$

$$
\text{\textbf{단락된 코일에 기전력}} \;\Longrightarrow\; \text{\textbf{큰 순환전류}} \;\Longrightarrow\; \text{\textbf{불꽃}}
$$

**mc.6.1에서 본 그것**이다. 직류기에는 없는 문제다.

| 대책 | |
|---|---|
| **저항 리드**(탄소 브러시) | 단락 전류 제한 |
| **보극** | |
| **주파수를 낮춤** | $e \propto f$ |

$$
\text{\textbf{저항 정류}}(\text{mc.1.3})\text{가 여기서 더 중요해진다}
$$

### ④ 토크가 준다

$$
T \propto \phi I_a \cos\theta
$$

$$
\text{교류에서는 } \phi \text{ 와 } I_a \text{ 의 위상이 \textbf{완전히 같지 않다}} \;\Longrightarrow\; \cos\theta < 1
$$

**철손과 누설 때문**에 자속이 전류보다 조금 뒤진다. 그만큼 토크가 준다.

$$
\text{\textbf{같은 전류면 직류 쪽이 토크가 크다}}
$$

## 벡터도

$$
V = E + I(r_a + r_f) + jI(x_a + x_f)
$$

| 성분 | |
|---|---|
| $E$ | **회전 기전력** ($\propto N\phi$) |
| $I(r_a + r_f)$ | 저항 강하 |
| $jI(x_a + x_f)$ | **리액턴스 강하** — 역률을 망치는 주범 |

$$
\text{\textbf{리액턴스 강하가 크면}} \;\Longrightarrow\; V \text{ 와 } I \text{ 의 각도} \uparrow \;\Longrightarrow\; \text{\textbf{역률} } \downarrow
$$

$$
\boxed{\text{\textbf{계자 권수를 줄이는 게} } x_f \text{ 를 줄이는 것}}
$$

**벡터도가 대책을 설명한다.** 리액턴스 강하를 줄여야 역률이 산다.

$$
\text{\textbf{고속일수록 역률이 좋다}} \;-\; E \propto N \text{ 이 커져 상대적으로 강하가 작아짐}
$$

**만능전동기가 고속인 이유가 하나 더** 있다. 빨라야 역률이 산다.

## 특성

| 항목 | |
|---|---|
| **토크** | $T \propto I_a^2$ — **기동토크 큼** |
| **속도** | $N \propto \frac{1}{I_a}$ — **가변속도** |
| **무부하** | **폭주** (직류 직권과 같음) |
| **역률** | **나쁘다** (교류 시) |
| **정류** | **나쁘다** (변압기 기전력) |
| **고속** | **가능** ($N_s$ 제약 없음) |

$$
\boxed{\text{\textbf{교류 ・ 직류 겸용}} \;-\; \text{다만 \textbf{직류 쪽이 성능이 좋다}}}
$$

### 속도 제어

$$
\text{\textbf{전압}}\text{을 바꾼다} \;-\; \text{트라이액 위상제어}(\text{mc.3.1})
$$

$$
\text{드릴의 \textbf{방아쇠}}\text{가 그것} \;-\; \text{당기는 깊이로 } \alpha \text{ 를 바꾼다}
$$

**mc.3.1의 트라이액**이 만능전동기와 짝을 이룬다. 싸고 간단한 조합이다.

$$
\text{\textbf{인버터 없이 속도 제어}} \;-\; \text{그래서 살아남았다}
$$

## 정리

$$
\boxed{T \propto I_a^2, \quad N \propto \dfrac{1}{I_a} \;-\; \text{\textbf{직류 직권과 같다}}}
$$

| 교류에서 | 대책 |
|---|---|
| **역률 나쁨** | **계자 권수 감소** (직류기와 반대) |
| **반작용 커짐** (약계자의 대가) | **보상권선** |
| **정류 나쁨** (변압기 기전력) | **저항 리드** · 보극 · 저주파 |
| 토크 감소 | — |

$$
\boxed{\text{\textbf{만능전동기}} \;-\; \text{작고 고속이고 싸야 하는 곳에서 아직 이긴다}}
$$

**mc.6의 다른 기계들은 다 사라졌는데** 이것만 남은 이유는, **인버터를 달 수 없을
만큼 싼 제품**이 있기 때문이다. 기술이 아니라 **값이 지켜 준 자리**다.
