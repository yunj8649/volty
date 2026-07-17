---
id: em.4.2
title: 정전계의 2차원 문제
status: reviewed
summary: 단면이 어디나 같은 구조는 2차원으로 줄여 푼다. 전기력선과 등전위선은 항상 직교해서 격자를 이룬다.
covers:
  - em.4.2.1
  - em.4.2.2
formulas:
  - label: 2차원 라플라스 방정식
    tex: \dfrac{\partial^2 V}{\partial x^2} + \dfrac{\partial^2 V}{\partial y^2} = 0
    note: $z$ 방향으로 변화가 없으므로 항이 두 개만 남는다.
  - label: 전기력선과 등전위선의 직교
    tex: \left(\dfrac{dy}{dx}\right)_{\text{전기력선}} \times \left(\dfrac{dy}{dx}\right)_{\text{등전위선}} = -1
    note: 기울기의 곱이 $-1$ 이면 수직이다.
  - label: 무한 직선 도체의 전위
    tex: V = \dfrac{\lambda}{2\pi\varepsilon_0}\ln\dfrac{r_0}{r}
    note: 2차원의 대표적 해. 기준점 $r_0$ 가 필요하다.
traps:
  - 2차원 문제에서 무한원을 전위 기준으로 **못 잡는다.** $\ln r$ 은 $r \to \infty$
    에서 발산하기 때문이다. 임의의 기준점 $r_0$ 를 따로 정해야 한다.
  - 전기력선과 등전위선은 **언제나** 직교한다. 특별한 조건이 필요 없다.
  - 2차원이라고 평면 문제가 아니다. **단면이 어디나 같은 3차원 구조**를 줄여 본
    것이다.
related:
  - em.1.3
  - em.1.5
  - em.2.4
---

## 2차원전계의 성질

전송선로, 동축 케이블, 평행 도선처럼 **길이 방향으로 단면이 계속 같은** 구조가
있다. 이런 건 $z$ 방향(길이 방향)으로 아무것도 변하지 않으므로, 단면 하나만 풀면
전체가 풀린다.

이것을 **2차원 문제**라 한다. 평면에 갇힌 문제가 아니라, 3차원인데 한 방향으로
변화가 없어서 차원을 줄인 것이다.

라플라스 방정식이 이렇게 줄어든다.

$$
\nabla^2 V = \dfrac{\partial^2 V}{\partial x^2} + \dfrac{\partial^2 V}{\partial y^2} + \cancel{\dfrac{\partial^2 V}{\partial z^2}} = 0
$$

$$
\dfrac{\partial^2 V}{\partial x^2} + \dfrac{\partial^2 V}{\partial y^2} = 0
$$

미지수가 하나 줄어드니 훨씬 다루기 쉬워진다.

### 3차원과 다른 점

거리 의존성이 달라진다. 이게 2차원 문제의 특징이다.

| | 점전하 (3차원) | 무한 직선 (2차원) |
|---|---|---|
| 전계 | $E \propto \dfrac{1}{r^2}$ | $E \propto \dfrac{1}{r}$ |
| 전위 | $V \propto \dfrac{1}{r}$ | $V \propto \ln\dfrac{1}{r}$ |

무한 직선 도체(선전하밀도 $\lambda$)의 전계는 가우스 정리로 구하면

$$
E = \dfrac{\lambda}{2\pi\varepsilon_0 r}\ \mathrm{[V/m]}
$$

이고, 이걸 적분해서 전위를 얻으면

$$
V = \dfrac{\lambda}{2\pi\varepsilon_0}\ln\dfrac{r_0}{r}\ \mathrm{[V]}
$$

**여기서 중요한 함정이 하나 있다.** 3차원에서는 무한원을 전위의 기준(0)으로 잡았다.
그런데 2차원에서는 그럴 수 없다. $\ln r$ 은 $r \to \infty$ 에서 무한대로 발산하기
때문이다.

그래서 **임의의 기준점 $r_0$ 를 따로 정해야** 한다. 전위의 절대값은 의미가 없고
**전위차만** 의미가 있다.

$$
V_{AB} = \dfrac{\lambda}{2\pi\varepsilon_0}\ln\dfrac{r_B}{r_A}
$$

물리적으로도 당연하다. 무한히 긴 도체라는 건 애초에 이상화된 모형이고, 무한한
전하가 있으니 무한원에서도 전위가 0이 아니다.

### 실제로 쓰이는 곳

2차원 문제의 대표적인 결과가 정전용량 공식들이다.

**동축 케이블** (내반지름 $a$, 외반지름 $b$, 길이 $l$)

$$
C = \dfrac{2\pi\varepsilon l}{\ln(b/a)}\ \mathrm{[F]}
$$

**평행 2선식 선로** (도체 반지름 $a$, 간격 $d$, $d \gg a$)

$$
C = \dfrac{\pi\varepsilon l}{\ln(d/a)}\ \mathrm{[F]}
$$

둘 다 $\ln$ 이 들어 있다. 2차원 문제의 지문이라고 봐도 된다. 전력공학의 송전선로
정전용량이 전부 이 형태다.

## 전기력선과 등전위선과의 관계

**전기력선과 등전위선은 언제나 직교한다.** 이유는 앞서 나왔다 — 등전위면을 따라
움직일 때 일이 0이려면 힘과 이동 방향이 수직이어야 하기 때문이다.

$$
W = QV = 0 \quad\Longrightarrow\quad F \perp dl \quad\Longrightarrow\quad E \perp (\text{등전위선})
$$

수학적으로도 바로 나온다. $E = -\nabla V$ 인데 $\nabla V$ 는 전위가 가장 급하게
변하는 방향이고, 그건 등전위선에 수직인 방향이다.

### 기울기로 확인하기

2차원에서 전기력선의 방정식은

$$
\dfrac{dx}{E_x} = \dfrac{dy}{E_y} \quad\Longrightarrow\quad \left(\dfrac{dy}{dx}\right)_{\text{전기력선}} = \dfrac{E_y}{E_x}
$$

등전위선은 $V = \text{const}$ 이므로 $dV = \dfrac{\partial V}{\partial x}dx + \dfrac{\partial V}{\partial y}dy = 0$ 에서

$$
\left(\dfrac{dy}{dx}\right)_{\text{등전위선}} = -\dfrac{\partial V/\partial x}{\partial V/\partial y} = -\dfrac{E_x}{E_y}
$$

두 기울기를 곱하면

$$
\dfrac{E_y}{E_x} \times \left(-\dfrac{E_x}{E_y}\right) = -1
$$

기울기의 곱이 $-1$ 이면 두 선은 **수직**이다. 언제나 성립한다 — 특별한 조건이
필요 없다.

### 전기력선 격자

전기력선과 등전위선을 함께 그리면 **직교하는 격자**가 만들어진다. 이걸
**전기력선 격자**(flux plot)라 하고, 복잡한 전극 모양의 전계를 손으로 어림잡을 때
썼다.

읽는 법은 이렇다.

- 격자가 **촘촘한 곳** — 전기력선 밀도가 높다 → **전계가 세다**
- 격자가 **성긴 곳** — 전계가 약하다

앞서 나온 성질들이 이 그림에서 전부 눈으로 확인된다. 도체 표면은 등전위선이고
전기력선이 거기에 수직으로 꽂힌다. 뾰족한 곳은 격자가 몰려서 전계가 세다.

요즘은 수치해석으로 컴퓨터가 풀지만, **격자가 촘촘한 곳이 위험하다**는 감각은
절연 설계에서 여전히 쓰인다.
