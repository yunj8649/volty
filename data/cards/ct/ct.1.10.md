---
id: ct.1.10
title: 회로의 전달 함수
status: reviewed
summary: 초기값을 0으로 놓은 출력/입력이다. 회로의 성격이 그 한 식에 다 들어 있다.
covers:
  - ct.1.10.1
  - ct.1.10.2
formulas:
  - label: 전달함수의 정의
    tex: G(s) = \dfrac{\mathcal{L}[\text{출력}]}{\mathcal{L}[\text{입력}]}\Bigg|_{\text{\textbf{모든 초기값} } = 0}
    note: '**초기값 0**이 조건이다. 이걸 빼면 전달함수가 아니다.'
  - label: 임피던스도 전달함수
    tex: Z(s) = \dfrac{V(s)}{I(s)} \;-\; R, \; sL, \; \dfrac{1}{sC}
    note: 페이저의 $j\omega$ 자리에 $s$ 를 넣으면 된다.
  - label: 1차 지연 요소
    tex: G(s) = \dfrac{K}{1 + Ts}
    note: '$T$ **시정수**. RC·RL 회로가 이 꼴.'
  - label: 2차 요소
    tex: G(s) = \dfrac{\omega_n^2}{s^2 + 2\zeta\omega_n s + \omega_n^2}
    note: '$\zeta$ **감쇠비**, $\omega_n$ **고유주파수**. RLC가 이 꼴.'
traps:
  - '**전달함수는 초기값을 0으로 놓는다.** 그래야 회로 고유의 성질만 남는다.'
  - '**극이 응답의 모양을, 영점이 크기를** 정한다.'
  - '**미분 요소는 s, 적분 요소는 1/s**다. 헷갈리면 안 된다.'
  - '**부동시간(낭비시간) 요소는 $e^{-Ls}$** 다. 유리함수가 아니라 근사가 필요하다.'
related:
  - ct.1.9
  - ct.2.2
  - ct.1.11
---

## 전달함수의 정의

$$
\boxed{G(s) = \dfrac{\mathcal{L}[\text{\textbf{출력}}]}{\mathcal{L}[\text{\textbf{입력}}]}\Bigg|_{\text{\textbf{모든 초기값} = 0}}}
$$

$$
\text{\textbf{초기값 0}}\text{이 조건이다}
$$

### 왜 초기값을 0으로 놓나

$$
\text{\textbf{초기값은 과거의 흔적}} \;-\; \text{\textbf{회로 자신의 성질이 아니다}}
$$

$$
\boxed{\text{\textbf{회로 고유의 성질만} 뽑아내려고}}
$$

$$
\text{\textbf{같은 회로라도 초기값에 따라 응답이 다르다}} \;\Longrightarrow\; \text{그럼 회로를 못 나타낸다}
$$

$$
\text{\textbf{초기값을 0으로 통일}} \;\Longrightarrow\; \text{\textbf{입출력 관계가 회로만의 것}}
$$

**ct.1.9의 미분 변환** $sF(s) - f(0)$ 에서 $f(0) = 0$ 으로 놓으면 $sF(s)$ 만 남는다.
그래야 **깔끔한 비**가 된다.

$$
\text{\textbf{초기값이 있으면}} \;\Longrightarrow\; \text{\textbf{그건 따로 더한다}}(\text{중첩})
$$

$$
\text{\textbf{전체 응답} = \textbf{영상태 응답}}(\text{입력에 의한}) + \text{\textbf{영입력 응답}}(\text{초기값에 의한})
$$

$$
\text{\textbf{전달함수는 앞의 것만} 다룬다}
$$

## 임피던스도 전달함수다

$$
Z(s) = \dfrac{V(s)}{I(s)}
$$

| 소자 | 시간 영역 | $Z(s)$ |
|---|---|---|
| **R** | $v = Ri$ | **$R$** |
| **L** | $v = L\frac{di}{dt}$ | **$sL$** |
| **C** | $i = C\frac{dv}{dt}$ | **$\frac{1}{sC}$** |

$$
\boxed{\textbf{페이저의 } \text{ j} \omega \text{ 자리에 } \text{ s}}
$$

$$
\text{ct.1.3의 } j\omega L \;\longrightarrow\; sL
$$

$$
\text{\textbf{페이저 회로 해석을 그대로}} \;-\; s \text{ 로만 바꿔서}
$$

$$
\text{\textbf{직렬・병렬・분압}} \;-\; \text{전부 그대로 쓴다}
$$

$$
\boxed{\text{\textbf{배운 걸 다시 안 배워도 된다}}}
$$

### 예 — RC 회로

$$
\text{입력 } V_i, \text{ 출력 } V_o \;(\text{C 양단})
$$

$$
G(s) = \dfrac{V_o}{V_i} = \dfrac{\frac{1}{sC}}{R + \frac{1}{sC}} = \dfrac{1}{1 + sRC}
$$

$$
\boxed{G(s) = \dfrac{1}{1 + Ts}, \qquad T = RC}
$$

$$
\text{\textbf{분압 공식}}(\text{ct.1.2})\text{을 그대로 썼다}
$$

$$
\text{\textbf{1차 지연 요소}} \;-\; \text{가장 흔한 꼴}
$$

## 기본적 요소의 전달함수

| 요소 | $G(s)$ | 예 |
|---|---|---|
| **비례**(P) | **$K$** | 저항 분압 |
| **미분**(D) | **$s$** | L 양단 전압 |
| **적분**(I) | **$\frac{1}{s}$** | C 양단 전압 |
| **1차 지연** | **$\frac{K}{1+Ts}$** | **RC · RL** |
| **1차 앞섬** | $K(1+Ts)$ | |
| **2차** | **$\frac{\omega_n^2}{s^2+2\zeta\omega_ns+\omega_n^2}$** | **RLC** |
| **부동시간** | **$e^{-Ls}$** | 수송 지연 |

$$
\boxed{\textbf{미분은 } \text{ s, } \text{ 적분은 } \dfrac{1}{s}}
$$

$$
\text{ct.1.9의 미분・적분 변환}\text{ 그대로}
$$

### 1차 지연 요소

$$
\boxed{G(s) = \dfrac{K}{1+Ts}}
$$

$$
T = \text{\textbf{시정수}} \;-\; \text{ct.1.11의 그것}
$$

$$
\textbf{극이 } \text{ s = -} \dfrac{1}{T} \;-\; \text{\textbf{좌반면}}\text{이니 안정}
$$

$$
\text{계단 입력에} \;\Longrightarrow\; c(t) = K(1 - e^{-t/T}) \;-\; \text{\textbf{지수 상승}}
$$

$$
\text{\textbf{T가 클수록 느리다}}
$$

| 회로 | $T$ |
|---|---|
| **RC 직렬** | **$RC$** |
| **RL 직렬** | **$\frac{L}{R}$** |

$$
\text{\textbf{시정수의 단위가 초}} \;-\; RC \text{ 도 } \dfrac{L}{R} \text{ 도}
$$

### 2차 요소

$$
\boxed{G(s) = \dfrac{\omega_n^2}{s^2 + 2\zeta\omega_n s + \omega_n^2}}
$$

| 기호 | 이름 |
|---|---|
| $\omega_n$ | **고유주파수** (natural frequency) |
| $\zeta$ | **감쇠비** (damping ratio) |

$$
\text{\textbf{RLC 직렬}}: \omega_n = \dfrac{1}{\sqrt{LC}}, \qquad \zeta = \dfrac{R}{2}\sqrt{\dfrac{C}{L}}
$$

$$
\text{\textbf{공진주파수}}(\text{ct.1.3})\text{가 } \omega_n \;-\; \text{같은 값}
$$

$$
\zeta = \dfrac{1}{2Q} \;-\; \text{\textbf{선택도의 역수}}\text{와 관계}
$$

### 감쇠비가 응답을 정한다

| $\zeta$ | 이름 | 응답 |
|---|---|---|
| **$\zeta = 0$** | **무제동** | **지속 진동** |
| **$0 < \zeta < 1$** | **부족제동** | **감쇠 진동** (오버슈트) |
| **$\zeta = 1$** | **임계제동** | **가장 빠른 비진동** |
| **$\zeta > 1$** | **과제동** | 느린 비진동 |

$$
\boxed{\zeta = 1 \text{ 이 \textbf{경계}}} \;-\; \text{진동하느냐 마느냐}
$$

$$
\text{\textbf{ct.1.11의 RLC 과도현상}}\text{이 정확히 이 분류}
$$

$$
\text{\textbf{ct.2.4의 2차계 응답}}\text{도 같은 이야기}
$$

**같은 수학이 세 카드에서** 나온다. 회로로 보면 과도현상, 제어로 보면 2차계 응답,
전달함수로 보면 $\zeta$ 다.

$$
\textbf{실용에서는 } \zeta \approx \text{ 0.7} \;-\; \text{빠르면서 오버슈트가 적당}
$$

### 부동시간 요소

$$
\boxed{G(s) = e^{-Ls}}
$$

$$
\text{\textbf{시간 지연}}(\text{ct.1.9})
$$

$$
\text{\textbf{유리함수가 아니다}} \;-\; \text{다항식의 비로 못 쓴다}
$$

$$
\text{\textbf{파데 근사}}: e^{-Ls} \approx \dfrac{1 - \frac{Ls}{2}}{1 + \frac{Ls}{2}}
$$

$$
\text{\textbf{근사해서 다룬다}} \;-\; \text{안 그러면 극・영점을 못 그린다}
$$

$$
\text{\textbf{제어를 어렵게 만든다}}(\text{ct.2.5}) \;-\; \text{위상이 계속 늦어지니}
$$

**컨베이어의 수송 지연, 배관의 유체 이동**이 부동시간이다. 제어 공학에서 가장 골치
아픈 요소다.

## 극과 영점

$$
G(s) = \dfrac{N(s)}{D(s)} = K\dfrac{(s-z_1)(s-z_2)\cdots}{(s-p_1)(s-p_2)\cdots}
$$

| | 뜻 | 정하는 것 |
|---|---|---|
| **극**(pole) | $D(s) = 0$ | **응답의 모양** |
| **영점**(zero) | $N(s) = 0$ | **크기·과도 특성** |

$$
\boxed{\text{\textbf{극이 응답의 모양을 정한다}}}
$$

$$
\text{ct.1.9에서 본 표}\text{가 그대로}
$$

| 극의 위치 | 응답 |
|---|---|
| **좌반면** | **안정** (감쇠) |
| **허수축** | **지속 진동** |
| **우반면** | **발산** |

$$
\text{\textbf{ct.2.5의 안정도 판별}}\text{이 곧 \textbf{극이 좌반면에 있나}}\text{를 보는 것}
$$

$$
\text{\textbf{극이 원점에서 멀수록 빠르다}} \;-\; |{-1/T}| \text{ 가 크면 } T \text{ 가 작으니}
$$

$$
\text{\textbf{극점 배치가 제어 설계}}(\text{ct.2.6의 근궤적})
$$

## 정리

$$
\boxed{G(s) = \dfrac{\text{출력}}{\text{입력}}\Bigg|_{\text{초기값}=0}}
$$

| 요소 | $G(s)$ |
|---|---|
| **비례** | $K$ |
| **미분** | **$s$** |
| **적분** | **$\frac{1}{s}$** |
| **1차 지연** | **$\frac{K}{1+Ts}$** |
| **2차** | **$\frac{\omega_n^2}{s^2+2\zeta\omega_ns+\omega_n^2}$** |
| **부동시간** | **$e^{-Ls}$** |

$$
\boxed{Z(s): \; R, \; sL, \; \dfrac{1}{sC}} \;-\; \textbf{페이저의 } \text{ j} \omega \text{ 자리에 } \text{ s}
$$

$$
\boxed{\zeta = 1 \text{ 이 진동의 경계}}
$$

$$
\text{\textbf{극이 좌반면에 있으면 안정}} \;-\; \text{ct.2.5의 전부}
$$
