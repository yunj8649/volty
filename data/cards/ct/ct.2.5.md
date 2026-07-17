---
id: ct.2.5
title: 안정도판별법
status: reviewed
summary: 극이 좌반면에 있으면 안정하다. 그걸 근을 안 구하고 판정하는 세 가지 방법이다.
covers:
  - ct.2.5.1
  - ct.2.5.2
  - ct.2.5.3
  - ct.2.5.4
formulas:
  - label: 안정의 정의
    tex: \text{\textbf{특성방정식의 근이 모두 \textbf{좌반면}}} \;\Longleftrightarrow\; \text{안정}
    note: '$1 + GH = 0$ 의 근. ct.2.2의 그 식.'
  - label: 후르비츠 필요조건
    tex: \text{\textbf{모든 계수가 존재}}\text{하고 \textbf{같은 부호}}
    note: '**필요조건일 뿐**. 만족해도 불안정할 수 있다.'
  - label: 나이퀴스트 판정
    tex: Z = P - N
    note: '$Z$ 우반면 폐루프 극, $P$ 우반면 개루프 극, $N$ **$-1$ 점을 감싼 횟수**.'
  - label: 이득여유와 위상여유
    tex: GM = -20\log|GH|_{\phi=-180°}, \qquad PM = 180° + \phi|_{|GH|=1}
    note: '**둘 다 양수여야 안정**. GM 4~12dB, PM 30~60°.'
traps:
  - '**후르비츠의 부호 조건은 필요조건**이다. 만족해도 라우스 표를 봐야 한다.'
  - '**나이퀴스트는 $-1$ 점**을 기준으로 본다. 원점이 아니다.'
  - '**나이퀴스트는 개루프($GH$)를 그려 폐루프의 안정을 판정**한다. 이게 핵심.'
  - '**이득여유와 위상여유가 둘 다 양수**여야 안정하다. 하나만 보면 안 된다.'
related:
  - ct.2.2
  - ct.2.4
  - ct.2.6
---

## 안정이란

$$
\boxed{\text{\textbf{특성방정식의 근이 모두 좌반면}}}
$$

$$
1 + GH = 0 \quad(\text{ct.2.2})
$$

$$
\text{\textbf{근 = 폐루프의 극}}(\text{ct.1.10})
$$

| 극의 위치 | 응답 | 판정 |
|---|---|---|
| **좌반면** | $e^{-\alpha t}$ — **감쇠** | **안정** |
| **허수축** | 지속 진동 | **임계** |
| **우반면** | $e^{+\alpha t}$ — **발산** | **불안정** |

$$
\text{\textbf{하나라도 우반면에 있으면}} \;\Longrightarrow\; \text{\textbf{불안정}}
$$

$$
e^{st} = e^{\sigma t}e^{j\omega t} \;-\; \sigma > 0 \;\Longrightarrow\; \text{\textbf{커진다}}
$$

### 근을 구하면 되지 않나

$$
\text{\textbf{3차 이상은 손으로 못 푼다}}
$$

$$
\text{5차 이상은 \textbf{일반해가 없다}}(\text{아벨의 정리})
$$

$$
\boxed{\text{\textbf{근을 안 구하고 판정}}\text{하는 방법이 필요}}
$$

$$
\text{\textbf{그게 이 단원}}
$$

| 방법 | 보는 것 |
|---|---|
| **라우스-후르비츠** | **계수**만 |
| **나이퀴스트** | **주파수 응답** |
| **근궤적** | 극의 **자취** (ct.2.6) |

## Routh-Hurwitz안정도판별법

$$
\text{\textbf{계수만 보고 판정}}
$$

$$
a_0s^n + a_1s^{n-1} + \cdots + a_n = 0
$$

### 후르비츠의 필요조건

$$
\boxed{\text{\textbf{모든 계수가 존재}}\text{하고 \textbf{부호가 같아야}}}
$$

$$
\text{\textbf{하나라도 0이거나 부호가 다르면}} \;\Longrightarrow\; \text{\textbf{불안정}}
$$

$$
\boxed{\text{\textbf{필요조건일 뿐}}}
$$

$$
\text{\textbf{만족해도 불안정할 수 있다}} \;-\; \text{시험 함정}
$$

$$
\text{예: } s^3 + s^2 + 2s + 8 = 0 \;-\; \text{계수가 다 양수인데 \textbf{불안정}}
$$

$$
\text{\textbf{그래서 라우스 표를 봐야}}
$$

### 라우스 표

$$
\begin{array}{c|cc}
s^n & a_0 & a_2 & a_4 \\
s^{n-1} & a_1 & a_3 & a_5 \\
s^{n-2} & b_1 & b_2 \\
s^{n-3} & c_1 & \cdots \\
\vdots
\end{array}
$$

$$
b_1 = \dfrac{a_1a_2 - a_0a_3}{a_1}, \qquad b_2 = \dfrac{a_1a_4 - a_0a_5}{a_1}
$$

$$
\boxed{\text{\textbf{제1열의 부호 변화 횟수} = \textbf{우반면 근의 개수}}}
$$

$$
\text{\textbf{부호 변화가 없으면}} \;\Longrightarrow\; \text{\textbf{안정}}
$$

$$
\text{\textbf{두 번 바뀌면}} \;\Longrightarrow\; \text{\textbf{우반면에 근이 2개}}
$$

$$
\text{\textbf{몇 개인지까지 알려준다}} \;-\; \text{그게 라우스의 힘}
$$

### 특수한 경우

| 경우 | 처리 |
|---|---|
| **제1열에 0** | **$\varepsilon$** (작은 양수)으로 놓고 계속 |
| **한 행이 전부 0** | **보조방정식**을 미분해서 채운다 |

$$
\text{\textbf{한 행이 전부 0}} \;\Longrightarrow\; \text{\textbf{허수축에 근}}\text{이 있다는 표지}
$$

$$
\text{\textbf{지속 진동}} \;-\; \text{임계 상태}
$$

$$
\text{\textbf{보조방정식의 근}}\text{이 그 진동 주파수}
$$

**ct.2.6의 근궤적이 허수축을 지나는 점**을 라우스로 구할 수 있다. $K$ 를 미지수로
두고 임계가 되는 값을 찾는다.

$$
\text{\textbf{안정 범위}}\text{를 구하는 문제} \;-\; \text{시험 단골}
$$

$$
\text{\textbf{K의 범위}}\text{를 라우스 표의 제1열이 양수가 되는 조건으로}
$$

## Nyquist안정도판별법

$$
\boxed{\text{\textbf{개루프}}(GH)\text{를 그려 \textbf{폐루프}}\text{의 안정을 판정}}
$$

$$
\text{\textbf{이게 핵심}} \;-\; \text{모르는 것을 아는 것으로 판정}
$$

$$
\text{\textbf{폐루프 극은 구하기 어려운데}} \;\Longrightarrow\; \text{\textbf{개루프는 안다}}
$$

### 판정식

$$
\boxed{Z = P - N}
$$

| 기호 | 뜻 |
|---|---|
| $Z$ | **우반면 폐루프 극**의 수 |
| $P$ | **우반면 개루프 극**의 수 |
| $N$ | **$-1$ 점을 반시계로 감싼** 횟수 |

$$
\boxed{Z = 0 \;\Longleftrightarrow\; \text{\textbf{안정}}}
$$

$$
\text{\textbf{개루프가 안정하면}}(P = 0) \;\Longrightarrow\; \boxed{N = 0 \;\text{이어야 안정}}
$$

$$
\text{\textbf{$-1$ 점을 안 감싸면 안정}}
$$

$$
\text{\textbf{대부분의 경우가 이것}} \;-\; \text{개루프는 보통 안정하니}
$$

### 왜 $-1$ 점인가

$$
1 + GH = 0 \;\Longrightarrow\; \boxed{GH = -1}
$$

$$
\text{\textbf{특성방정식이 } GH = -1 \text{ 이라는 뜻}}
$$

$$
\text{\textbf{$GH$ 궤적이 $-1$ 을 지나면}} \;\Longrightarrow\; \text{\textbf{임계}}
$$

$$
\text{\textbf{감싸면}} \;\Longrightarrow\; \text{\textbf{불안정}}
$$

$$
\boxed{\text{\textbf{원점이 아니라 } -1} } \;-\; \text{시험 함정}
$$

$$
GH = -1 \;\Longrightarrow\; |GH| = 1 \text{ 이고 } \angle GH = -180°
$$

$$
\text{\textbf{크기가 1이면서 위상이 } -180°} \;-\; \text{되먹임이 \textbf{정궤환}}\text{이 되는 순간}
$$

**직관적 설명**이다. 부궤환으로 설계했는데 **위상이 $180°$ 돌면 정궤환**이 된다.
그때 크기가 1 이상이면 **폭주**한다.

$$
\textbf{ct.2.2의 } \dfrac{G}{1-GH}\text{ 에서 } GH=1 \text{ 이면 발산} \;-\; \text{같은 이야기}
$$

$$
\text{\textbf{스피커의 삐- 소리}}\text{가 바로 이 조건}
$$

## Nyquist선도로부터의 이득과 위상여유

$$
\text{\textbf{$-1$ 에서 얼마나 떨어져 있나}}
$$

$$
\boxed{\text{\textbf{여유}}(\text{margin}) \;-\; \text{안정하되 \textbf{얼마나} 안정한가}}
$$

### 이득여유 (GM)

$$
\boxed{GM = -20\log_{10}|GH|_{\angle GH = -180°}\ \mathrm{[dB]}}
$$

$$
\text{\textbf{위상이 } -180° \text{ 일 때 이득이 1에서 얼마나 모자라나}}
$$

$$
\text{\textbf{이득을 몇 배 키우면 불안정해지나}}
$$

$$
GM = 20\ \mathrm{dB} \;\Longrightarrow\; \text{\textbf{이득을 10배}} \text{ 키우면 임계}
$$

### 위상여유 (PM)

$$
\boxed{PM = 180° + \angle GH\big|_{|GH|=1}}
$$

$$
\text{\textbf{이득이 1일 때 위상이 } -180° \text{ 에서 얼마나 모자라나}}
$$

$$
\text{\textbf{위상이 몇 도 더 늦으면 불안정해지나}}
$$

### 둘 다 양수여야

$$
\boxed{GM > 0 \;\text{그리고}\; PM > 0}
$$

$$
\text{\textbf{하나만 보면 안 된다}} \;-\; \text{시험 함정}
$$

| 실용 값 | |
|---|---|
| **이득여유** | **$4 \sim 12\ \mathrm{dB}$** |
| **위상여유** | **$30° \sim 60°$** |

$$
\text{\textbf{너무 크면}} \;\Longrightarrow\; \text{\textbf{느리다}}(\text{이득이 작으니})
$$

$$
\text{\textbf{너무 작으면}} \;\Longrightarrow\; \text{\textbf{진동}}
$$

$$
\boxed{\text{\textbf{또 그 거래}}} \;-\; \text{속응성 vs 안정도}
$$

### 위상여유와 감쇠비

$$
PM \approx 100\zeta \quad(\zeta < 0.7)
$$

$$
\zeta = 0.7 \;\Longrightarrow\; PM \approx 65° \;-\; \text{ct.2.4에서 본 그 값}
$$

$$
\boxed{\textbf{주파수 영역의 } \text{ PM } \text{ 이 시간 영역의 } \zeta}
$$

$$
\text{\textbf{같은 것을 다른 창으로}} \;-\; \text{ct.2.4의 } \zeta \text{ 와 여기의 } PM
$$

**보드선도에서 위상여유를 보면 오버슈트를 안다.** 두 영역이 이어져 있다.

## 특성방정식의 근

$$
\text{\textbf{근의 위치가 응답을 정한다}}(\text{ct.1.9})
$$

| 위치 | 응답 |
|---|---|
| **좌반면 실축** | 지수 감쇠 |
| **좌반면 복소** | **감쇠 진동** |
| **허수축** | 지속 진동 |
| **우반면** | **발산** |
| **원점** | 적분 |

$$
\text{\textbf{실수부가 감쇠, 허수부가 진동}}
$$

$$
\text{\textbf{원점에서 멀수록 빠르다}}
$$

$$
\text{\textbf{허수축에 가까울수록 진동적}}
$$

### 지배극

$$
\boxed{\text{\textbf{허수축에 가장 가까운 극}}\text{이 응답을 지배}}
$$

$$
\text{\textbf{멀리 있는 극은 빨리 사라진다}} \;-\; e^{-10t} \text{ 는 } e^{-t} \text{ 보다 훨씬 빨리}
$$

$$
\text{\textbf{5배 이상 멀면 무시}}\text{할 수 있다}
$$

$$
\boxed{\text{\textbf{고차계를 2차계로 근사}}}
$$

$$
\text{\textbf{그래서 ct.2.4의 2차계 이론}}\text{이 실무에서 통한다}
$$

**대부분의 실제 계가 고차인데** 2차계로 근사해서 다룬다. 지배극 두 개만 보면 되기
때문이다.

## 세 방법의 비교

| | **라우스-후르비츠** | **나이퀴스트** | **근궤적**(ct.2.6) |
|---|---|---|---|
| **보는 것** | **계수** | **주파수 응답** | **극의 자취** |
| **필요한 것** | 특성방정식 | **개루프 $GH$** | 개루프 극·영점 |
| **알려주는 것** | **우반면 근의 수** | **안정 여부 + 여유** | **$K$ 에 따른 극** |
| **실측 가능** | X | **O** | X |
| **여유** | X | **O** | 간접 |
| 부동시간 | **못 다룸** | **다룬다** | 어렵다 |

$$
\boxed{\text{\textbf{나이퀴스트만 실측으로 할 수 있다}}}
$$

$$
\text{\textbf{전달함수를 몰라도}} \;\Longrightarrow\; \text{정현파를 넣어 재면 된다}(\text{ct.2.4})
$$

$$
\text{\textbf{부동시간}}(e^{-Ls})\text{도 다룬다} \;-\; \text{라우스는 유리함수만}
$$

$$
\text{\textbf{그래서 실무에서 나이퀴스트・보드}}\text{를 쓴다}
$$

## 정리

$$
\boxed{\text{\textbf{극이 모두 좌반면}} \;\Longleftrightarrow\; \text{안정}}
$$

$$
\boxed{\text{\textbf{후르비츠}}: \text{계수가 다 있고 부호가 같아야} \;-\; \text{\textbf{필요조건}}}
$$

$$
\boxed{\text{\textbf{라우스}}: \text{제1열 부호 변화 = 우반면 근의 수}}
$$

$$
\boxed{\text{\textbf{나이퀴스트}}: Z = P - N \;-\; \text{\textbf{$-1$ 점}}\text{을 본다}}
$$

$$
\boxed{GM > 0, \; PM > 0 \;-\; \text{\textbf{둘 다}}}
$$

$$
GH = -1 \;\Longleftrightarrow\; |GH| = 1 \text{ 이고 } \angle GH = -180°
$$

$$
\text{\textbf{부궤환이 정궤환이 되는 순간}} \;-\; \text{안정도 문제의 본질}
$$
