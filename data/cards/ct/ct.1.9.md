---
id: ct.1.9
title: 라플라스변환
status: reviewed
summary: 페이저의 일반화다. jω를 s로 바꾸면 과도 상태까지 다룰 수 있다.
covers:
  - ct.1.9.1
  - ct.1.9.2
  - ct.1.9.3
  - ct.1.9.4
formulas:
  - label: 정의
    tex: F(s) = \mathcal{L}[f(t)] = \int_0^{\infty} f(t)e^{-st}dt
    note: '$s = \sigma + j\omega$. **페이저의 $j\omega$ 를 일반화**한 것.'
  - label: 미분·적분
    tex: \mathcal{L}\left[\dfrac{df}{dt}\right] = sF(s) - f(0), \qquad \mathcal{L}\left[\int f\,dt\right] = \dfrac{F(s)}{s}
    note: '**미분이 곱셈**. 초기값이 저절로 들어온다.'
  - label: 기본 변환
    tex: \mathcal{L}[1] = \dfrac{1}{s}, \quad \mathcal{L}[t] = \dfrac{1}{s^2}, \quad \mathcal{L}[e^{-at}] = \dfrac{1}{s+a}
    note: 이 셋에서 대부분이 나온다.
  - label: 초기값·최종값 정리
    tex: f(0^+) = \lim_{s\to\infty} sF(s), \qquad f(\infty) = \lim_{s\to 0} sF(s)
    note: '**역변환 없이** 처음과 끝을 안다.'
traps:
  - '**미분 변환에 초기값이 들어간다**($sF(s) - f(0)$). 이게 페이저와 결정적 차이다.'
  - '**최종값 정리는 안정한 경우에만** 쓴다. 발산하면 틀린 답이 나온다.'
  - '**s → jω 로 놓으면 페이저**가 된다. 라플라스가 더 일반적이다.'
  - '**시간 지연은 $e^{-Ls}$**, 주파수 이동은 $F(s+a)$. 헷갈리기 쉽다.'
related:
  - ct.1.3
  - ct.1.10
  - ct.1.11
---

## 왜 라플라스인가

$$
\text{\textbf{페이저}}(\text{ct.1.3})\text{는 \textbf{정현파 정상상태}}\text{에만}
$$

$$
\boxed{\text{\textbf{과도 상태}}\text{는 못 다룬다}}
$$

$$
\text{\textbf{스위치를 켠 직후}}\text{는? \textbf{계단 입력}}\text{에는?}
$$

$$
\boxed{s = \sigma + j\omega \;-\; \textbf{페이저의 } \text{ j} \omega \text{ 를 일반화}}
$$

| | 페이저 | 라플라스 |
|---|---|---|
| **변수** | $j\omega$ | **$s = \sigma + j\omega$** |
| **다루는 것** | 정현파 정상상태 | **모든 것** |
| **초기조건** | 없음 | **자동으로 들어감** |
| $e^{\sigma t}$ | 못 다룸 | **다룬다** (감쇠·발산) |

$$
\text{\textbf{$\sigma$ 가 감쇠를 나타낸다}} \;-\; e^{st} = e^{\sigma t}e^{j\omega t}
$$

$$
\text{\textbf{진동} } \times \text{ \textbf{감쇠}} \;-\; \text{과도현상의 모습 그대로}
$$

$$
\boxed{\sigma = 0 \;\Longrightarrow\; \text{\textbf{라플라스가 페이저가 된다}}}
$$

**페이저는 라플라스의 특수한 경우**다. 감쇠가 없는 정상상태만 본 것이다.

## 라플라스 변환의 정의

$$
\boxed{F(s) = \mathcal{L}[f(t)] = \int_0^{\infty} f(t)e^{-st}\,dt}
$$

$$
\text{\textbf{시간 함수}} \to \text{\textbf{s 함수}}
$$

$$
\text{\textbf{미분방정식}} \to \text{\textbf{대수방정식}}
$$

$$
\boxed{\text{\textbf{이게 전부다}}} \;-\; \text{나머지는 계산 요령}
$$

$$
\text{적분 하한이 } \mathbf{0} \;-\; \text{\textbf{t < 0 은 안 본다}}(\text{인과적})
$$

**스위치를 $t=0$ 에 켜는 문제**를 다루니 그 전은 관심이 없다.

## 간단한 함수의 변환

| $f(t)$ | $F(s)$ |
|---|---|
| **$\delta(t)$** (임펄스) | **$1$** |
| **$u(t)$** (단위계단) | **$\frac{1}{s}$** |
| **$t$** | **$\frac{1}{s^2}$** |
| $t^n$ | $\frac{n!}{s^{n+1}}$ |
| **$e^{-at}$** | **$\frac{1}{s+a}$** |
| $te^{-at}$ | $\frac{1}{(s+a)^2}$ |
| **$\sin\omega t$** | **$\frac{\omega}{s^2+\omega^2}$** |
| **$\cos\omega t$** | **$\frac{s}{s^2+\omega^2}$** |
| $e^{-at}\sin\omega t$ | $\frac{\omega}{(s+a)^2+\omega^2}$ |
| $e^{-at}\cos\omega t$ | $\frac{s+a}{(s+a)^2+\omega^2}$ |

$$
\text{\textbf{세 개만 알면 된다}}: \; 1, \; t, \; e^{-at}
$$

$$
\text{나머지는 \textbf{정리}}\text{로 만든다}
$$

### 왜 이렇게 되나

$$
\mathcal{L}[1] = \int_0^\infty e^{-st}dt = \left[-\dfrac{e^{-st}}{s}\right]_0^\infty = \dfrac{1}{s}
$$

$$
\mathcal{L}[e^{-at}] = \int_0^\infty e^{-at}e^{-st}dt = \int_0^\infty e^{-(s+a)t}dt = \dfrac{1}{s+a}
$$

$$
\boxed{e^{-at} \;\Longrightarrow\; s \to s+a} \;-\; \text{\textbf{주파수 이동}}
$$

$$
\text{\textbf{지수를 곱하면 } s \text{ 가 이동한다}} \;-\; \text{이 하나로 표의 절반이 나온다}
$$

$$
\sin\omega t = \dfrac{e^{j\omega t} - e^{-j\omega t}}{2j} \;\Longrightarrow\; \dfrac{1}{2j}\left(\dfrac{1}{s-j\omega} - \dfrac{1}{s+j\omega}\right) = \dfrac{\omega}{s^2+\omega^2}
$$

$$
\text{\textbf{오일러 공식}}\text{으로 지수로 바꾸면 다 나온다}
$$

## 기본정리

### 선형성

$$
\mathcal{L}[af_1 + bf_2] = aF_1(s) + bF_2(s)
$$

$$
\text{\textbf{중첩이 성립}} \;-\; \text{ct.1.2의 그것}
$$

### 미분 — 핵심

$$
\boxed{\mathcal{L}\left[\dfrac{df}{dt}\right] = sF(s) - f(0)}
$$

$$
\mathcal{L}\left[\dfrac{d^2f}{dt^2}\right] = s^2F(s) - sf(0) - f'(0)
$$

$$
\boxed{\text{\textbf{미분이 } s \text{ 를 곱하는 것}}}
$$

$$
\boxed{\text{\textbf{초기값이 저절로 들어온다}}}
$$

$$
\text{\textbf{페이저와 결정적 차이}} \;-\; \text{페이저는 } j\omega \text{ 만 곱하고 끝}
$$

$$
\text{\textbf{초기조건을 따로 안 넣어도 된다}} \;-\; \text{변환이 알아서 챙긴다}
$$

**이게 라플라스가 과도현상에 강한 이유**다. 미분방정식과 초기조건을 **한꺼번에** 대수
방정식으로 바꾼다.

$$
\text{ct.1.1의 } i_L(0^+) = i_L(0^-), \; v_C(0^+) = v_C(0^-) \;-\; \text{\textbf{그 값이 여기 들어간다}}
$$

### 적분

$$
\boxed{\mathcal{L}\left[\int_0^t f\,dt\right] = \dfrac{F(s)}{s}}
$$

$$
\text{\textbf{적분이 } s \text{ 로 나누는 것}}
$$

$$
\text{\textbf{미분과 정확히 반대}} \;-\; \text{당연하다}
$$

### 시간 이동 (지연)

$$
\boxed{\mathcal{L}[f(t-L)u(t-L)] = e^{-Ls}F(s)}
$$

$$
\text{\textbf{시간 지연} = } e^{-Ls} \text{ \textbf{를 곱하는 것}}
$$

$$
\text{\textbf{ct.2.4의 낭비시간}}(\text{dead time})\text{이 이것}
$$

### 주파수 이동

$$
\boxed{\mathcal{L}[e^{-at}f(t)] = F(s+a)}
$$

$$
\text{\textbf{지수를 곱하면 } s \text{ 축이 이동}}
$$

$$
\textbf{시간 이동은 } \text{ e} ^{-Ls} \text{ 곱하기, 주파수 이동은 } \text{ s } \to \text{ s+a}
$$

$$
\text{\textbf{헷갈리기 쉽다}} \;-\; \text{어느 쪽에서 무슨 일이 나는지}
$$

| | 시간 영역 | s 영역 |
|---|---|---|
| **시간 이동** | $f(t-L)$ | **$e^{-Ls}F(s)$** |
| **주파수 이동** | $e^{-at}f(t)$ | **$F(s+a)$** |

### 상사 정리

$$
\mathcal{L}[f(at)] = \dfrac{1}{a}F\left(\dfrac{s}{a}\right)
$$

$$
\text{\textbf{시간을 압축하면 주파수가 늘어난다}} \;-\; \text{푸리에와 같은 성질}
$$

### 초기값·최종값 정리

$$
\boxed{f(0^+) = \lim_{s\to\infty} sF(s)}
$$

$$
\boxed{f(\infty) = \lim_{s\to 0} sF(s)}
$$

$$
\text{\textbf{역변환 없이} 처음과 끝을 안다}
$$

$$
\text{\textbf{매우 유용}} \;-\; \text{과도현상 문제에서 검산에}
$$

$$
\text{\textbf{$s \to \infty$ 가 $t \to 0$}} \;-\; \text{빠른 것이 처음}
$$

$$
\text{\textbf{$s \to 0$ 이 $t \to \infty$}} \;-\; \text{느린 것이 나중}
$$

$$
\boxed{\text{\textbf{s가 크면 시간이 짧다}}} \;-\; \text{서로 역수 관계}
$$

### 최종값 정리의 함정

$$
\boxed{\text{\textbf{안정한 경우에만}}}
$$

$$
\text{\textbf{발산하거나 진동하면}} \;\Longrightarrow\; \text{\textbf{최종값이 없다}}
$$

$$
f(t) = \sin\omega t \;\Longrightarrow\; F(s) = \dfrac{\omega}{s^2+\omega^2}
$$

$$
\lim_{s\to 0} s\dfrac{\omega}{s^2+\omega^2} = 0 \;-\; \textbf{그런데 } \sin \text{ 은 계속 진동}
$$

$$
\text{\textbf{0으로 수렴하지 않는다}} \;-\; \text{정리가 틀린 답을 준다}
$$

$$
\boxed{\text{\textbf{극이 좌반면에 있어야}} \text{ 쓸 수 있다}}(\text{ct.2.5의 안정도})
$$

**시험 함정**이다. 무턱대고 쓰면 안 된다.

## 라플라스 변환

$$
\text{\textbf{푸는 순서}}\text{가 정해져 있다}
$$

$$
\text{\textbf{미분방정식}} \xrightarrow{\;\mathcal{L}\;} \text{\textbf{대수방정식}} \xrightarrow{\;\text{풀기}\;} F(s) \xrightarrow{\;\mathcal{L}^{-1}\;} f(t)
$$

$$
\boxed{\text{\textbf{어려운 문제를 쉬운 영역으로 옮겨 풀고 되가져온다}}}
$$

$$
\text{\textbf{ct.1.4의 푸리에}} \cdot \text{\textbf{ct.1.6의 대칭좌표법}}\text{과 같은 전략}
$$

**셋 다 같은 발상**이다. 어려운 걸 쉬운 것으로 **변환**해서 풀고 **되돌린다**.

$$
\text{\textbf{되돌리는 게 역변환}} \;-\; \text{실전에서는 여기가 일이다}
$$

### 역변환 — 부분분수 전개

$$
\text{\textbf{부분분수 전개}}\text{가 왕도}
$$

$$
F(s) = \dfrac{N(s)}{D(s)} \;\Longrightarrow\; \text{\textbf{분모를 인수분해}} \;\Longrightarrow\; \text{표를 보고 되돌린다}
$$

### 서로 다른 실근

$$
F(s) = \dfrac{K_1}{s+a} + \dfrac{K_2}{s+b}
$$

$$
K_1 = \left[(s+a)F(s)\right]_{s=-a} \;-\; \text{\textbf{헤비사이드 전개}}
$$

$$
\text{\textbf{가리고 대입}} \;-\; \text{그 항을 곱한 뒤 그 극에서의 값}
$$

$$
f(t) = K_1e^{-at} + K_2e^{-bt}
$$

### 중근

$$
F(s) = \dfrac{K_1}{(s+a)^2} + \dfrac{K_2}{s+a}
$$

$$
K_2 = \dfrac{d}{ds}\left[(s+a)^2F(s)\right]_{s=-a} \;-\; \text{\textbf{미분}}\text{이 필요}
$$

$$
f(t) = K_1te^{-at} + K_2e^{-at}
$$

$$
\text{\textbf{$t$ 가 곱해진다}} \;-\; \text{중근의 표지}
$$

### 복소근

$$
\text{\textbf{켤레쌍}}\text{으로 나온다} \;\Longrightarrow\; \text{\textbf{감쇠 진동}}
$$

$$
s = -\alpha \pm j\beta \;\Longrightarrow\; f(t) = Ae^{-\alpha t}\sin(\beta t + \phi)
$$

$$
\boxed{\text{\textbf{실수부가 감쇠, 허수부가 진동}}}
$$

$$
\text{\textbf{ct.1.11의 RLC 회로}}\text{가 이 꼴}
$$

$$
\text{\textbf{극의 위치가 응답을 정한다}}
$$

| 극의 위치 | 응답 |
|---|---|
| **좌반면 실축** | **지수 감쇠** |
| **좌반면 복소** | **감쇠 진동** |
| **허수축** | **지속 진동** |
| **우반면** | **발산** (불안정) |

$$
\boxed{\text{\textbf{ct.2.5의 안정도 판별}}\text{이 이 표에서 나온다}}
$$

## 정리

$$
\boxed{F(s) = \int_0^\infty f(t)e^{-st}dt, \qquad s = \sigma + j\omega}
$$

| 연산 | s 영역 |
|---|---|
| **미분** | **$sF(s) - f(0)$** |
| **적분** | $\frac{F(s)}{s}$ |
| **시간 지연** | **$e^{-Ls}F(s)$** |
| **지수 곱** | **$F(s+a)$** |

$$
\boxed{f(0^+) = \lim_{s\to\infty}sF(s), \qquad f(\infty) = \lim_{s\to0}sF(s)}
$$

$$
\text{\textbf{최종값 정리는 안정할 때만}}
$$

$$
\boxed{s \to j\omega \;\Longrightarrow\; \text{\textbf{페이저}}} \;-\; \text{라플라스가 더 넓다}
$$

$$
\text{\textbf{미분방정식} → \textbf{대수방정식}} \;-\; \text{그 하나를 위해 존재하는 도구}
$$
