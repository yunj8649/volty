---
id: ct.2.4
title: 정상오차와 주파수응답
status: reviewed
summary: 적분기의 개수가 정상오차를 정한다. 형이 하나 오를 때마다 오차가 하나씩 0이 된다.
covers:
  - ct.2.4.1
  - ct.2.4.2
  - ct.2.4.3
  - ct.2.4.4
formulas:
  - label: 정상편차
    tex: e_{ss} = \lim_{s\to 0} \dfrac{sR(s)}{1 + G(s)H(s)}
    note: ct.1.9의 **최종값 정리**를 편차에 적용한 것.
  - label: 편차상수
    tex: K_p = \lim_{s\to0}GH, \quad K_v = \lim_{s\to0}sGH, \quad K_a = \lim_{s\to0}s^2GH
    note: '**위치·속도·가속도** 편차상수. $s$ 가 하나씩 붙는다.'
  - label: 정상편차
    tex: e_p = \dfrac{1}{1+K_p}, \qquad e_v = \dfrac{1}{K_v}, \qquad e_a = \dfrac{1}{K_a}
    note: '**위치만 $1+$** 가 붙는다. 나머지는 그냥 역수.'
  - label: 2차계의 오버슈트
    tex: M_p = e^{-\frac{\zeta\pi}{\sqrt{1-\zeta^2}}} \times 100\ \mathrm{[\%]}
    note: '**$\zeta$ 만으로 정해진다**. $\omega_n$ 과 무관.'
  - label: 공진 정점
    tex: M_p = \dfrac{1}{2\zeta\sqrt{1-\zeta^2}}, \qquad \omega_p = \omega_n\sqrt{1-2\zeta^2}
    note: '$\zeta > 0.707$ 이면 **공진이 없다**.'
traps:
  - '**위치 편차만 $\frac{1}{1+K_p}$** 이고 속도·가속도는 $\frac{1}{K_v}$, $\frac{1}{K_a}$ 다.'
  - '**형(type)은 적분기의 개수**다. 0형은 위치 편차가 남고, 1형은 위치가 0이 된다.'
  - '**오버슈트는 ζ만으로** 정해진다. $\omega_n$ 은 속도만 바꾼다.'
  - '**$\zeta > 0.707$ 이면 공진이 없다.** 대역폭 계산과 헷갈리면 안 된다.'
related:
  - ct.2.2
  - ct.1.10
  - ct.2.6
---

## 자동제어계의 정상오차

$$
\boxed{\text{\textbf{시간이 충분히 지난 뒤에도 남는 오차}}}
$$

$$
e_{ss} = \lim_{t\to\infty} e(t)
$$

$$
\text{\textbf{ct.1.9의 최종값 정리}}\text{를 쓴다}
$$

$$
e_{ss} = \lim_{s\to0}sE(s)
$$

### 편차의 전달함수

$$
E = R - HC, \qquad C = GE
$$

$$
E = R - GHE \;\Longrightarrow\; E(1+GH) = R
$$

$$
\boxed{E(s) = \dfrac{R(s)}{1+G(s)H(s)}}
$$

$$
\boxed{e_{ss} = \lim_{s\to0}\dfrac{sR(s)}{1+G(s)H(s)}}
$$

$$
\text{\textbf{ct.2.2의 되먹임 공식}}\text{에서 바로 나온다}
$$

$$
\text{\textbf{GH가 크면 오차가 작다}} \;-\; \text{분모가 커지니}
$$

$$
\boxed{\text{\textbf{이득을 키우면 정확해진다}}}
$$

$$
\text{\textbf{그런데 불안정해진다}}(\text{ct.2.5}) \;-\; \text{\textbf{또 그 거래}}
$$

## 제어계의 형 (Type)

$$
\boxed{\text{\textbf{$GH$ 에 있는 적분기의 개수}}}
$$

$$
GH = \dfrac{K(1+T_1s)(1+T_2s)\cdots}{s^N(1+T_as)(1+T_bs)\cdots}
$$

$$
\boxed{N = \text{\textbf{형}}(\text{type})}
$$

| 형 | $GH$ | 이름 |
|---|---|---|
| **0형** | 적분기 없음 | 비례계 |
| **1형** | $\frac{1}{s}$ 하나 | |
| **2형** | $\frac{1}{s^2}$ 둘 | |

$$
\text{\textbf{$s=0$ 에서 극이 몇 개냐}}
$$

## 편차상수

$$
\boxed{
\begin{aligned}
K_p &= \lim_{s\to0}G(s)H(s) &\;(\text{\textbf{위치}}) \\
K_v &= \lim_{s\to0}sG(s)H(s) &\;(\text{\textbf{속도}}) \\
K_a &= \lim_{s\to0}s^2G(s)H(s) &\;(\text{\textbf{가속도}})
\end{aligned}
}
$$

$$
\text{\textbf{$s$ 가 하나씩 더 붙는다}}
$$

$$
\boxed{
\begin{aligned}
e_p &= \dfrac{1}{1+K_p} &\;(\text{\textbf{계단 입력}}) \\
e_v &= \dfrac{1}{K_v} &\;(\text{\textbf{램프 입력}}) \\
e_a &= \dfrac{1}{K_a} &\;(\text{\textbf{포물선 입력}})
\end{aligned}
}
$$

$$
\boxed{\text{\textbf{위치만 } 1+ \text{ 가 붙는다}}}
$$

$$
\text{\textbf{시험 함정}} \;-\; e_v = \frac{1}{1+K_v} \text{ 로 쓰면 틀린다}
$$

### 왜 위치만 다른가

$$
\text{\textbf{계단 입력}}: R(s) = \dfrac{1}{s}
$$

$$
e_p = \lim_{s\to0}\dfrac{s \cdot \frac{1}{s}}{1+GH} = \dfrac{1}{1 + \lim_{s\to0}GH} = \dfrac{1}{1+K_p}
$$

$$
\text{\textbf{램프 입력}}: R(s) = \dfrac{1}{s^2}
$$

$$
e_v = \lim_{s\to0}\dfrac{s\cdot\frac{1}{s^2}}{1+GH} = \lim_{s\to0}\dfrac{1}{s(1+GH)} = \lim_{s\to0}\dfrac{1}{s + sGH}
$$

$$
s \to 0 \;\Longrightarrow\; \text{\textbf{앞의 } s \text{ 가 사라진다}} \;\Longrightarrow\; \dfrac{1}{\lim sGH} = \dfrac{1}{K_v}
$$

$$
\boxed{\text{\textbf{$s$ 가 붙어 있어서 } 1 \text{ 이 사라진다}}}
$$

$$
\text{\textbf{외우지 말고 유도하면}} \text{ 헷갈릴 일이 없다}
$$

## 형과 정상편차 — 핵심 표

| 형 | **계단** $e_p$ | **램프** $e_v$ | **포물선** $e_a$ |
|---|---|---|---|
| **0형** | **$\frac{1}{1+K}$** (유한) | **$\infty$** | **$\infty$** |
| **1형** | **0** | **$\frac{1}{K}$** (유한) | **$\infty$** |
| **2형** | **0** | **0** | **$\frac{1}{K}$** (유한) |

$$
\boxed{\text{\textbf{형이 하나 오르면 오차가 하나씩 0이 된다}}}
$$

$$
\text{\textbf{대각선으로 유한값이 옮겨간다}}
$$

### 왜 그런가

$$
\text{\textbf{0형}}: K_p = \lim_{s\to0}GH = K \;(\text{유한}) \;\Longrightarrow\; e_p = \dfrac{1}{1+K} \;-\; \text{\textbf{남는다}}
$$

$$
\text{\textbf{1형}}: K_p = \lim_{s\to0}\dfrac{K}{s} = \infty \;\Longrightarrow\; e_p = \dfrac{1}{1+\infty} = \mathbf{0}
$$

$$
\boxed{\text{\textbf{적분기가 오차를 지운다}}}
$$

### 적분기가 왜 오차를 지우나

$$
\text{\textbf{적분기는 편차가 0이 아닌 한 계속 쌓는다}}
$$

$$
e \neq 0 \;\Longrightarrow\; \int e\,dt \text{ 가 계속 커짐} \;\Longrightarrow\; \text{\textbf{조작량이 계속 커짐}}
$$

$$
\text{\textbf{편차가 0이 될 때까지 멈추지 않는다}}
$$

$$
\boxed{\text{\textbf{정상상태에서 편차가 0이어야만 적분기가 멈춘다}}}
$$

$$
\text{\textbf{이게 I 동작이 잔류편차를 없애는 원리}}(\text{ct.2.6})
$$

**우아한 논리다.** 적분기가 있으면 **편차가 0이 아닌 정상상태가 존재할 수 없다.**

$$
\text{\textbf{P 동작만 있으면}} \;\Longrightarrow\; \text{편차가 있어야 조작량이 있다} \;\Longrightarrow\; \text{\textbf{잔류편차}}
$$

$$
\text{\textbf{비례 제어의 숙명}} \;-\; \text{오차가 없으면 일을 안 하니 오차가 남는다}
$$

## 과도응답과 주파수응답

### 과도응답

$$
\text{\textbf{계단 입력}}\text{에 대한 응답으로 본다}
$$

| 지표 | 뜻 |
|---|---|
| **지연시간** $T_d$ | **50%** 도달 |
| **상승시간** $T_r$ | **10 → 90%** |
| **정점시간** $T_p$ | **최대에 이르는** 시간 |
| **오버슈트** $M_p$ | **목표를 넘은** 최대량 |
| **정정시간** $T_s$ | **$\pm2\%$ 또는 $\pm5\%$** 안에 |

$$
\text{ct.1.11의 \textbf{상승시간}}\text{과 같은 정의}
$$

### 2차계의 과도응답

$$
G(s) = \dfrac{\omega_n^2}{s^2+2\zeta\omega_ns+\omega_n^2} \quad(\text{ct.1.10})
$$

$$
\boxed{c(t) = 1 - \dfrac{e^{-\zeta\omega_nt}}{\sqrt{1-\zeta^2}}\sin\left(\omega_dt + \cos^{-1}\zeta\right)}
$$

$$
\omega_d = \omega_n\sqrt{1-\zeta^2} \;-\; \text{\textbf{감쇠 진동 주파수}}
$$

$$
\text{\textbf{$\zeta\omega_n$ 이 감쇠, $\omega_d$ 가 진동}}
$$

### 오버슈트

$$
\boxed{M_p = e^{-\frac{\zeta\pi}{\sqrt{1-\zeta^2}}} \times 100\ \mathrm{[\%]}}
$$

$$
\boxed{\text{\textbf{$\zeta$ 만으로 정해진다}}} \;-\; \omega_n \text{ 과 \textbf{무관}}
$$

| $\zeta$ | $M_p$ |
|---|---|
| **0.4** | **25.4%** |
| **0.5** | **16.3%** |
| **0.6** | **9.5%** |
| **0.707** | **4.3%** |
| **0.8** | **1.5%** |
| **1.0** | **0%** |

$$
\text{\textbf{$\omega_n$ 은 빠르기만 바꾼다}} \;-\; \text{모양은 } \zeta \text{ 가 정한다}
$$

$$
\boxed{\text{\textbf{$\zeta$ 가 모양, $\omega_n$ 이 속도}}}
$$

$$
T_p = \dfrac{\pi}{\omega_d}, \qquad T_s \approx \dfrac{4}{\zeta\omega_n} \;(\pm2\%)
$$

$$
\text{\textbf{$\omega_n$ 을 키우면 다 빨라진다}} \;-\; \text{오버슈트는 그대로}
$$

### 주파수응답

$$
\boxed{s \to j\omega} \;-\; \text{\textbf{정현파 입력에 대한 정상 응답}}
$$

$$
G(j\omega) = |G(j\omega)|\angle\phi(\omega)
$$

$$
\text{\textbf{ct.1.3의 페이저로 돌아온다}} \;-\; \text{라플라스의 특수한 경우}
$$

$$
\text{\textbf{크기}} = \text{이득}, \qquad \text{\textbf{각도}} = \text{위상}
$$

### 왜 주파수로 보나

| 이유 | |
|---|---|
| **실험이 쉽다** | 정현파를 넣고 재면 된다 |
| **전달함수를 몰라도** | 실측으로 그린다 |
| **안정도를 본다** | ct.2.5의 나이퀴스트 |
| 잡음 특성 | 대역폭 |

$$
\boxed{\text{\textbf{모델을 몰라도 측정할 수 있다}}}
$$

$$
\text{\textbf{복잡한 실물}}\text{에 주파수를 바꿔가며 넣어 보면} \;\Longrightarrow\; \text{\textbf{특성이 나온다}}
$$

## 주파수응답의 궤적표현

| 선도 | 축 | 특징 |
|---|---|---|
| **벡터궤적** (나이퀴스트) | **복소평면** | $\omega$ 를 매개변수로 |
| **보드선도** | **$\log\omega$ vs dB, 위상** | **곱이 합이 된다** |
| **이득-위상선도** (니콜스) | 위상 vs 이득 | |

### 보드선도

$$
\text{\textbf{이득을 dB로}}: 20\log_{10}|G|
$$

$$
\boxed{\text{\textbf{곱이 합이 된다}}} \;-\; \log(AB) = \log A + \log B
$$

$$
\text{\textbf{직렬 요소를 더하기만}} \;\Longrightarrow\; \text{손으로 그릴 수 있다}
$$

$$
\text{\textbf{그게 보드선도의 존재 이유}}
$$

| 요소 | 기울기 |
|---|---|
| **$K$** | **0 dB/dec** (수평) |
| **$\frac{1}{s}$** | **$-20$ dB/dec** |
| **$s$** | **$+20$ dB/dec** |
| **$\frac{1}{1+Ts}$** | **꺾인 뒤 $-20$** |

$$
\text{\textbf{절점 주파수}}: \omega = \dfrac{1}{T} \;-\; \text{거기서 꺾인다}
$$

$$
\textbf{1차 지연의 절점에서 } \text{ -3} \  \mathrm{dB} \text{, } \; \text{ -45°}
$$

$$
\text{\textbf{20 dB/dec = 6 dB/oct}} \;-\; \text{같은 말}
$$

## 2차계에서 MP와 WP

$$
\boxed{M_p = \dfrac{1}{2\zeta\sqrt{1-\zeta^2}} \quad(\text{\textbf{공진 정점}})}
$$

$$
\boxed{\omega_p = \omega_n\sqrt{1-2\zeta^2} \quad(\text{\textbf{공진 주파수}})}
$$

$$
\text{\textbf{과도응답의 오버슈트와 기호가 같아 헷갈린다}} \;-\; \text{여기서는 \textbf{주파수} 영역}
$$

### 공진이 없어지는 조건

$$
\omega_p = \omega_n\sqrt{1-2\zeta^2} \;-\; \text{\textbf{실수여야}}
$$

$$
1 - 2\zeta^2 > 0 \;\Longrightarrow\; \zeta < \dfrac{1}{\sqrt{2}} = \mathbf{0.707}
$$

$$
\boxed{\zeta > 0.707 \;\Longrightarrow\; \text{\textbf{공진이 없다}}}
$$

$$
\text{\textbf{0.707이 경계}} \;-\; \text{시험 단골}
$$

$$
\zeta = 0.707 \;\Longrightarrow\; \omega_p = 0, \; M_p = 1 \;(0\ \mathrm{dB})
$$

$$
\text{\textbf{가장 평탄한 응답}} \;-\; \text{버터워스}
$$

### 왜 0.707을 좋아하나

| $\zeta = 0.707$ | |
|---|---|
| **오버슈트** | **4.3%** (작다) |
| **공진** | **없다** |
| **대역폭** | **넓다** (빠르다) |
| 위상여유 | **약 65°** (충분) |

$$
\boxed{\text{\textbf{모든 게 적당히 좋다}}}
$$

$$
\text{\textbf{실무의 기본값}} \;-\; \text{ct.1.10에서 말한 그것}
$$

$$
\dfrac{1}{\sqrt{2}} = 0.707 \;-\; \text{\textbf{ct.1.3의 실효값}}\text{에서도 나온 숫자}
$$

**우연이지만** 같은 숫자다. 거기서는 $\sin$ 의 RMS, 여기서는 $\zeta$ 의 경계다.

### 대역폭

$$
\textbf{이득이 } \text{ -3} \  \mathrm{dB} \text{ 로 떨어지는 주파수}
$$

$$
-3\ \mathrm{dB} = 20\log\dfrac{1}{\sqrt{2}} \;\Longrightarrow\; \text{\textbf{크기가 } 0.707 \text{ 배}}
$$

$$
\text{\textbf{또 0.707}} \;-\; \text{이번엔 진짜 } \frac{1}{\sqrt{2}}
$$

$$
\text{\textbf{전력이 절반}}\text{이 되는 지점} \;-\; P \propto |G|^2 \;\Longrightarrow\; (0.707)^2 = 0.5
$$

$$
\boxed{\text{\textbf{대역폭이 넓으면 빠르다}}}
$$

$$
\text{\textbf{그런데 잡음도 잘 들어온다}} \;-\; \text{또 거래}
$$

## 정리

$$
\boxed{e_{ss} = \lim_{s\to0}\dfrac{sR(s)}{1+GH}}
$$

| 형 | 계단 | 램프 | 포물선 |
|---|---|---|---|
| **0** | $\frac{1}{1+K_p}$ | $\infty$ | $\infty$ |
| **1** | **0** | $\frac{1}{K_v}$ | $\infty$ |
| **2** | **0** | **0** | $\frac{1}{K_a}$ |

$$
\boxed{\text{\textbf{적분기가 오차를 지운다}}} \;-\; \text{형이 오르면 하나씩}
$$

$$
\boxed{M_p = e^{-\frac{\zeta\pi}{\sqrt{1-\zeta^2}}} \;-\; \zeta \text{ \textbf{만으로}}}
$$

$$
\boxed{\zeta > 0.707 \;\Longrightarrow\; \text{\textbf{공진 없음}}}
$$

$$
\text{\textbf{$\zeta$ 가 모양, $\omega_n$ 이 속도}} \;-\; \text{2차계의 전부}
$$
