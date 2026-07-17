---
id: ct.1.11
title: 과도현상
status: reviewed
summary: L은 전류를, C는 전압을 붙잡는다. 그 하나가 초기조건이고 시정수가 속도다.
covers:
  - ct.1.11.1
  - ct.1.11.2
  - ct.1.11.3
  - ct.1.11.4
  - ct.1.11.5
  - ct.1.11.6
  - ct.1.11.7
formulas:
  - label: RL 직렬 (직류 인가)
    tex: i(t) = \dfrac{E}{R}\left(1 - e^{-\frac{R}{L}t}\right), \qquad \tau = \dfrac{L}{R}
    note: '**전류가 0에서 시작**. L이 전류를 붙잡으니.'
  - label: RC 직렬 (직류 인가)
    tex: i(t) = \dfrac{E}{R}e^{-\frac{t}{RC}}, \qquad v_C = E\left(1-e^{-\frac{t}{RC}}\right), \qquad \tau = RC
    note: '**전류가 최대에서 시작**. C가 전압을 붙잡아 처음엔 단락처럼.'
  - label: 시정수
    tex: \tau = \dfrac{L}{R} \;(\text{RL}), \qquad \tau = RC \;(\text{RC})
    note: '$\tau$ 에서 **63.2%** 도달. $5\tau$ 면 사실상 끝.'
  - label: RLC 진동 조건
    tex: R < 2\sqrt{\dfrac{L}{C}} \;\Longrightarrow\; \text{\textbf{진동}}
    note: '$R = 2\sqrt{L/C}$ 가 **임계**. 그보다 크면 비진동.'
traps:
  - '**RL은 전류가 0에서, RC는 전류가 최대에서** 시작한다. 정반대.'
  - '**RL의 시정수는 L/R, RC는 RC**다. RL을 RC처럼 곱하면 틀린다.'
  - '**RLC 진동 조건은 $R < 2\sqrt{L/C}$**. 저항이 작아야 진동한다.'
  - '**시정수가 클수록 느리다.** L이 크거나 R이 작으면 RL이 느려진다.'
related:
  - ct.1.1
  - ct.1.9
  - ct.1.10
---

## 왜 과도현상인가

$$
\text{\textbf{스위치를 켠 직후}}\text{에 무슨 일이 나나}
$$

$$
\text{\textbf{정상상태}}\text{는 페이저로 풀린다}(\text{ct.1.3})
$$

$$
\boxed{\text{\textbf{그 사이}}\text{가 과도상태}}
$$

$$
\text{\textbf{L과 C가 있어야} 과도현상이 있다}
$$

$$
\text{\textbf{R만 있으면}} \;\Longrightarrow\; V = IR \;\Longrightarrow\; \text{\textbf{즉시}} \;-\; \text{과도가 없다}
$$

$$
\boxed{\text{\textbf{에너지를 저장하는 소자}}\text{가 시간을 만든다}}
$$

## 모든 것이 이 한 줄에서

$$
\boxed{\text{\textbf{L은 전류를, C는 전압을 붙잡는다}}}(\text{ct.1.1})
$$

$$
i_L(0^+) = i_L(0^-), \qquad v_C(0^+) = v_C(0^-)
$$

$$
\textbf{급변하면 } \dfrac{di}{dt} \to \infty \text{ 또는 } \dfrac{dv}{dt} \to \infty \;\Longrightarrow\; \text{\textbf{무한 전압・전류}}
$$

$$
\text{\textbf{물리적으로 불가능}} \;\Longrightarrow\; \text{\textbf{연속}}
$$

### 초기와 최종

| 소자 | $t = 0^+$ | $t = \infty$ |
|---|---|---|
| **L** (초기 전류 0) | **개방**처럼 | **단락**처럼 |
| **C** (초기 전압 0) | **단락**처럼 | **개방**처럼 |

$$
\boxed{\text{\textbf{L과 C가 정확히 반대}}}
$$

### 왜 그런가

$$
\text{\textbf{L}}: i(0) = 0 \text{ 을 유지하려 함} \;\Longrightarrow\; \text{\textbf{전류가 안 흐름}} \;\Longrightarrow\; \text{\textbf{개방}}
$$

$$
\text{시간이 지나면} \;\Longrightarrow\; \dfrac{di}{dt} \to 0 \;\Longrightarrow\; v_L = L\dfrac{di}{dt} \to 0 \;\Longrightarrow\; \text{\textbf{단락}}
$$

$$
\text{\textbf{C}}: v(0) = 0 \text{ 을 유지하려 함} \;\Longrightarrow\; \text{\textbf{전압이 0}} \;\Longrightarrow\; \text{\textbf{단락}}
$$

$$
\text{시간이 지나면} \;\Longrightarrow\; \dfrac{dv}{dt} \to 0 \;\Longrightarrow\; i_C = C\dfrac{dv}{dt} \to 0 \;\Longrightarrow\; \text{\textbf{개방}}
$$

$$
\text{\textbf{이 표만 알면 초기값・최종값을 암산}}\text{할 수 있다}
$$

$$
\text{ct.1.9의 \textbf{초기값・최종값 정리}}\text{와 답이 맞아야 한다} \;-\; \text{검산}
$$

## R-L직렬의 직류회로

$$
E = Ri + L\dfrac{di}{dt}
$$

$$
\boxed{i(t) = \dfrac{E}{R}\left(1 - e^{-\frac{R}{L}t}\right)}
$$

$$
\boxed{\tau = \dfrac{L}{R}\ \mathrm{[s]}}
$$

$$
v_L = L\dfrac{di}{dt} = Ee^{-\frac{R}{L}t}
$$

### 모양

$$
i(0) = 0 \;-\; \text{\textbf{전류가 0에서 시작}}(\text{L이 붙잡으니})
$$

$$
i(\infty) = \dfrac{E}{R} \;-\; \text{\textbf{L이 단락처럼}}
$$

$$
v_L(0) = E \;-\; \text{\textbf{전압이 전부 L에}}
$$

$$
v_L(\infty) = 0 \;-\; \text{\textbf{L에 전압이 안 걸림}}
$$

$$
\boxed{\textbf{전류는 올라가고 } \text{ v} _L \text{ 은 내려간다}}
$$

### 스위치를 끊으면 — 위험하다

$$
\text{\textbf{L에 전류가 흐르는데 갑자기 끊으면}}
$$

$$
v_L = -L\dfrac{di}{dt} \;\Longrightarrow\; \dfrac{di}{dt} \to -\infty \;\Longrightarrow\; \text{\textbf{큰 역전압}}
$$

$$
\boxed{\text{\textbf{개폐 서지}}}
$$

**mc.3.1의 환류 다이오드**가 필요한 이유다. **mc.7.5의 전류 재단**도 이것이다.

$$
\text{\textbf{L이 전류를 유지하려는 고집}}\text{이 고전압을 만든다}
$$

$$
\text{\textbf{pw.4.2의 개폐 서지}}\text{도 같은 뿌리}
$$

## R-C직렬의 직류회로

$$
E = Ri + \dfrac{1}{C}\int i\,dt
$$

$$
\boxed{i(t) = \dfrac{E}{R}e^{-\frac{t}{RC}}}
$$

$$
\boxed{v_C(t) = E\left(1 - e^{-\frac{t}{RC}}\right)}
$$

$$
\boxed{\tau = RC\ \mathrm{[s]}}
$$

### RL과 정반대다

| | **RL** | **RC** |
|---|---|---|
| **전류 초기** | **0** | **$\frac{E}{R}$ (최대)** |
| **전류 최종** | **$\frac{E}{R}$** | **0** |
| **시정수** | **$\frac{L}{R}$** | **$RC$** |
| 초기 등가 | **개방** | **단락** |
| 최종 등가 | **단락** | **개방** |

$$
\boxed{\text{\textbf{전류의 모양이 정반대}}}
$$

$$
\text{\textbf{RL은 전류가 자라고, RC는 전류가 죽는다}}
$$

### 방전

$$
\text{충전된 C를 R로 방전하면}
$$

$$
i(t) = -\dfrac{V_0}{R}e^{-\frac{t}{RC}}, \qquad v_C(t) = V_0e^{-\frac{t}{RC}}
$$

$$
\text{\textbf{둘 다 지수 감쇠}}
$$

$$
\text{\textbf{시정수는 같다}} \;-\; \text{충전이든 방전이든 } RC
$$

## R-L병렬의 직류회로

$$
\text{\textbf{전류원}}\text{을 병렬 RL에}
$$

$$
i_L(t) = I\left(1 - e^{-\frac{R}{L}t}\right)
$$

$$
\tau = \dfrac{L}{R} \;-\; \text{\textbf{직렬과 같은 꼴}}
$$

$$
\text{\textbf{쌍대성}}(\text{duality}) \;-\; \text{전압↔전류, R↔G, L↔C 를 바꾸면 같은 식}
$$

| 직렬 RC | 병렬 RL |
|---|---|
| 전압원 | **전류원** |
| $v_C$ | **$i_L$** |
| $\tau = RC$ | $\tau = \frac{L}{R} = \frac{L}{R}$ |

$$
\text{\textbf{같은 수학을 다른 옷을 입혀}} \;-\; \text{하나만 풀면 둘을 안다}
$$

## R-L-C 직렬의 직류회로

$$
E = Ri + L\dfrac{di}{dt} + \dfrac{1}{C}\int i\,dt
$$

$$
\text{\textbf{2차 미분방정식}} \;\Longrightarrow\; \text{\textbf{세 가지 답}}
$$

### 특성방정식

$$
Ls^2 + Rs + \dfrac{1}{C} = 0 \;\Longrightarrow\; s = -\dfrac{R}{2L} \pm \sqrt{\left(\dfrac{R}{2L}\right)^2 - \dfrac{1}{LC}}
$$

$$
\text{\textbf{판별식}}\text{이 답의 모양을 정한다}
$$

### 세 경우

$$
\boxed{
\begin{aligned}
R > 2\sqrt{\dfrac{L}{C}} &\;\Longrightarrow\; \text{\textbf{비진동}}(\text{과제동}) \\
R = 2\sqrt{\dfrac{L}{C}} &\;\Longrightarrow\; \text{\textbf{임계진동}} \\
R < 2\sqrt{\dfrac{L}{C}} &\;\Longrightarrow\; \text{\textbf{진동}}(\text{부족제동})
\end{aligned}
}
$$

$$
\boxed{\text{\textbf{저항이 작아야 진동}}}
$$

$$
\text{\textbf{저항이 에너지를 먹으니}} \;-\; \text{크면 진동할 힘이 없다}
$$

$$
\text{\textbf{L과 C가 에너지를 주고받는 게 진동}}(\text{ct.1.3의 공진})
$$

$$
\text{\textbf{R이 그 왕복을 방해}}\text{한다}
$$

### ct.1.10과 같은 이야기

$$
\zeta = \dfrac{R}{2}\sqrt{\dfrac{C}{L}} \quad(\text{ct.1.10})
$$

$$
R = 2\sqrt{\dfrac{L}{C}} \;\Longrightarrow\; \zeta = \dfrac{2\sqrt{L/C}}{2}\sqrt{\dfrac{C}{L}} = \mathbf{1} \;\checkmark
$$

$$
\boxed{\textbf{임계 조건이 } \zeta \text{ = 1} \;-\; \text{정확히 일치}}
$$

$$
\textbf{회로로 보면 } \text{ R = 2} \sqrt{L/C} \text{, } \text{ 제어로 보면 } \zeta \text{ = 1}
$$

**같은 것의 다른 이름**이다. ct.1.10의 2차 요소 분류가 여기서 회로가 된다.

## R-L-C 직렬의 교류회로

$$
\text{\textbf{과도항} + \textbf{정상항}}
$$

$$
i(t) = \underbrace{i_t(t)}_{\text{\textbf{과도}}} + \underbrace{i_s(t)}_{\text{\textbf{정상}}}
$$

$$
\text{\textbf{정상항}}\text{은 페이저로}(\text{ct.1.3}) \;-\; \text{이미 아는 것}
$$

$$
\text{\textbf{과도항}}\text{은 직류 때와 같은 꼴} \;-\; \text{지수 감쇠}
$$

$$
\text{\textbf{시간이 지나면 과도항이 사라지고}} \;\Longrightarrow\; \text{\textbf{페이저 답만 남는다}}
$$

$$
\boxed{\text{\textbf{페이저는 과도항을 무시한 것}}}
$$

$$
\text{\textbf{그래서 정상상태에서만 맞다}}(\text{ct.1.3의 한계})
$$

### 투입 위상이 중요하다

$$
\text{\textbf{전압이 0일 때 투입}} \;\Longrightarrow\; \text{\textbf{과도항이 최대}}
$$

$$
\text{\textbf{전압이 최대일 때 투입}} \;\Longrightarrow\; \text{\textbf{과도항이 0}}(\text{순 유도성이면})
$$

$$
\text{\textbf{언제 켜느냐}}\text{가 돌입전류를 정한다}
$$

**변압기 여자 돌입전류**(mc.4.1)가 이것이다. 자속이 0일 때 켜면 자속이 2배까지 올라
포화한다.

$$
\text{\textbf{동기 개폐}}(\text{synchronous switching}) \;-\; \text{좋은 순간에 켜는 기술}
$$

## 시정수와 상승시간

### 시정수

$$
\boxed{\tau = \dfrac{L}{R} \;(\text{RL}), \qquad \tau = RC \;(\text{RC})}
$$

$$
\textbf{63.2} \%\text{에 도달하는 시간}
$$

$$
1 - e^{-1} = 1 - 0.368 = \mathbf{0.632}
$$

| $t$ | 도달률 |
|---|---|
| **$\tau$** | **63.2%** |
| $2\tau$ | 86.5% |
| $3\tau$ | 95.0% |
| $4\tau$ | 98.2% |
| **$5\tau$** | **99.3%** |

$$
\boxed{5\tau \text{ 면 사실상 끝}}
$$

$$
\text{\textbf{시정수가 클수록 느리다}}
$$

$$
\text{\textbf{RL}}: L \uparrow \text{ 이거나 } R \downarrow \;\Longrightarrow\; \text{느려진다}
$$

$$
\text{\textbf{RC}}: R \uparrow \text{ 이거나 } C \uparrow \;\Longrightarrow\; \text{느려진다}
$$

$$
\boxed{\text{\textbf{RL은 R이 분모, RC는 R이 분자}}} \;-\; \text{\textbf{반대}}
$$

$$
\text{\textbf{시험 함정}} \;-\; \text{RL의 시정수를 } RL \text{ 로 쓰면 틀린다}
$$

### 왜 반대인가

$$
\text{\textbf{RL}}: R \text{ 이 크면 전류가 빨리 정착} \;-\; \text{목표 } \frac{E}{R} \text{ 이 작아지니}
$$

$$
\text{\textbf{RC}}: R \text{ 이 크면 충전이 느림} \;-\; \text{전류가 적게 흐르니}
$$

$$
\text{\textbf{R의 역할이 다르다}} \;-\; \text{하나는 억제, 하나는 통로}
$$

### 상승시간

$$
\boxed{T_r = \textbf{10} \% \textbf{ → 90} \%\text{ 에 걸리는 시간}}
$$

$$
T_r \approx 2.2\tau \;-\; \text{1차 지연계}
$$

$$
\ln 9 = 2.197 \;-\; \text{계산해 보면 나온다}
$$

$$
\text{ct.2.4의 \textbf{과도응답 지표}}\text{와 같은 것}
$$

## 미분적분회로

$$
\text{\textbf{시정수와 입력 주기의 관계}}\text{가 정한다}
$$

| 회로 | 조건 | 하는 일 |
|---|---|---|
| **미분회로** | $\tau \lll T$ | **뾰족한 펄스** |
| **적분회로** | $\tau \ggg T$ | **매끄러운 파형** |

$$
\boxed{\text{\textbf{시정수가 짧으면 미분, 길면 적분}}}
$$

### 미분회로

$$
\text{\textbf{RC 회로에서 R 양단}}\text{을 출력으로}
$$

$$
\tau \lll T \;\Longrightarrow\; \text{\textbf{빨리 충전}} \;\Longrightarrow\; \text{\textbf{변화할 때만} 전류}
$$

$$
v_o = RC\dfrac{dv_i}{dt} \;-\; \text{\textbf{미분}}
$$

$$
\text{\textbf{구형파} → \textbf{뾰족한 펄스}}
$$

$$
\text{\textbf{에지 검출}}\text{에 쓴다} \;-\; \text{변화가 있을 때만 반응}
$$

### 적분회로

$$
\text{\textbf{RC 회로에서 C 양단}}\text{을 출력으로}
$$

$$
\tau \ggg T \;\Longrightarrow\; \text{\textbf{거의 충전 안 됨}} \;\Longrightarrow\; \text{\textbf{쌓이기만}}
$$

$$
v_o = \dfrac{1}{RC}\int v_i\,dt \;-\; \text{\textbf{적분}}
$$

$$
\text{\textbf{구형파} → \textbf{삼각파}}
$$

$$
\text{\textbf{평활}}\text{에 쓴다} \;-\; \text{mc.3.2의 그것}
$$

$$
\boxed{\textbf{같은 RC 회로인데 출력을 어디서 뽑고 } \tau \text{ 가 어떠냐} \text{로 갈린다}}
$$

$$
\text{\textbf{ct.1.10의 미분 요소}}(s)\text{와 \textbf{적분 요소}}(\tfrac{1}{s})\text{가 물건이 된 것}
$$

## 정리

$$
\boxed{\text{\textbf{L은 전류를, C는 전압을 붙잡는다}}} \;-\; \text{모든 초기조건}
$$

| | $t=0^+$ | $t=\infty$ |
|---|---|---|
| **L** | **개방** | **단락** |
| **C** | **단락** | **개방** |

$$
\boxed{\tau = \dfrac{L}{R} \;(\text{RL}), \qquad \tau = RC \;(\text{RC})}
$$

$$
\text{\textbf{$\tau$ 에서 63.2\%, $5\tau$ 면 끝}}
$$

$$
\boxed{R < 2\sqrt{\dfrac{L}{C}} \;\Longrightarrow\; \text{\textbf{진동}}} \;-\; \text{ct.1.10의 } \zeta < 1
$$

| $\tau$ vs $T$ | 회로 |
|---|---|
| $\tau \lll T$ | **미분** (뾰족) |
| $\tau \ggg T$ | **적분** (매끄러움) |

$$
\text{\textbf{ct.1.1의 한 줄이 이 카드 전체}}\text{를 낳았다}
$$
