---
id: pw.2.6
title: 장거리 송전선로의 특성
status: reviewed
summary: 뭉치는 근사가 깨져 분포정수로 푼다. 답이 쌍곡선 함수로 나오고, 특성임피던스와 전파정수 두 값이 선로를 규정한다.
covers:
  - pw.2.6.1
  - pw.2.6.2
  - pw.2.6.3
  - pw.2.6.4
  - pw.2.6.5
formulas:
  - label: 특성임피던스
    tex: Z_0 = \sqrt{\dfrac{Z}{Y}} \approx \sqrt{\dfrac{L}{C}} = 138\log_{10}\dfrac{D}{r}\ \mathrm{[\Omega]}
    note: '**거리와 무관**하다. 가공선 약 $300\sim500\ \Omega$, 케이블 약 $30\sim50\ \Omega$.'
  - label: 전파정수
    tex: \gamma = \sqrt{ZY} = \sqrt{(R + j\omega L)(G + j\omega C)} = \alpha + j\beta
    note: $\alpha$ **감쇠정수**(크기 감소), $\beta$ **위상정수**(위상 회전).
  - label: 무손실 조건
    tex: R = G = 0
    note: 그러면 $\alpha = 0$ (감쇠 없음), $Z_0 = \sqrt{L/C}$ (실수).
  - label: 무왜형 조건
    tex: RC = LG
    note: 감쇠는 있으나 **파형이 안 일그러진다**. 모든 주파수가 같은 속도로 간다.
  - label: 전파방정식 (쌍곡선)
    tex: V_s = V_r\cosh\gamma l + I_r Z_0\sinh\gamma l
    note: $I_s = \dfrac{V_r}{Z_0}\sinh\gamma l + I_r\cosh\gamma l$.
  - label: 4단자정수 (장거리)
    tex: A = D = \cosh\gamma l, \qquad B = Z_0\sinh\gamma l, \qquad C = \dfrac{\sinh\gamma l}{Z_0}
    note: $AD - BC = \cosh^2 - \sinh^2 = 1$ 이 자동으로 성립한다.
traps:
  - '**특성임피던스는 길이와 무관**하다. $\sqrt{Z/Y}$ 에서 둘 다 단위 길이당이라
    길이가 약분된다.'
  - $\alpha$ 는 **감쇠**, $\beta$ 는 **위상**이다. $\gamma = \alpha + j\beta$ 에서
    실수부가 감쇠, 허수부가 위상.
  - '**케이블의 특성임피던스가 가공선보다 훨씬 작다**($\sqrt{L/C}$ 인데 케이블은
    $C$ 가 크다). 그래서 서지가 케이블로 들어가면 크게 반사된다.'
  - 무부하일 때 $\cosh$ 때문에 **수전단 전압이 송전단보다 높아진다**(페란티).
related:
  - pw.2.5
  - pw.2.7
  - pw.4.1
---

## 전파방정식

### 왜 분포정수인가

$100\ \mathrm{[km]}$ 를 넘으면 **뭉치는 근사가 깨진다.** T나 π로 한 덩어리에 몰아넣으면
오차가 커진다.

전기자기학 em.8.5에서 봤듯, $60\ \mathrm{[Hz]}$ 파장이 $5000\ \mathrm{[km]}$ 이고
$l < \lambda/10 = 500\ \mathrm{[km]}$ 이면 집중정수로 봐도 된다. 그런데
$100\ \mathrm{[km]}$ 부터는 정밀도가 필요한 계산에서 차이가 나기 시작한다.

**분포정수**로 다루면 전압과 전류가 **위치의 함수**가 된다.

$$
-\dfrac{dV}{dx} = ZI, \qquad -\dfrac{dI}{dx} = YV
$$

$Z = R + j\omega L$, $Y = G + j\omega C$ 는 **단위 길이당** 값이다.

### 파동방정식으로

두 식을 연립하면(하나를 미분해 다른 하나를 넣으면)

$$
\dfrac{d^2V}{dx^2} = ZY\,V
$$

**파동방정식**이다. 전기자기학 em.8.3의 $\nabla^2E = \mu\varepsilon\dfrac{\partial^2E}{\partial t^2}$
와 같은 구조이고, **같은 물리를 회로 언어로 쓴 것**이다.

해는 지수함수 두 개의 합인데, 경계조건(수전단 $V_r$, $I_r$)을 넣어 정리하면
**쌍곡선 함수**로 나온다.

$$
\boxed{V_s = V_r\cosh\gamma l + I_r Z_0\sinh\gamma l}
$$
$$
\boxed{I_s = \dfrac{V_r}{Z_0}\sinh\gamma l + I_r\cosh\gamma l}
$$

이것이 **전파방정식**이다. 여기 나온 $Z_0$ 와 $\gamma$ 가 선로를 규정하는 두 값이다.

## 특성임피던스와 전파정수

### 특성임피던스

$$
Z_0 = \sqrt{\dfrac{Z}{Y}} = \sqrt{\dfrac{R + j\omega L}{G + j\omega C}}\ \mathrm{[\Omega]}
$$

**무손실 근사**($R \ll \omega L$, $G \ll \omega C$)에서는 깔끔해진다.

$$
Z_0 \approx \sqrt{\dfrac{L}{C}}\ \mathrm{[\Omega]}
$$

**실수**가 되고, 주파수와 무관해진다.

### 길이와 무관하다

**중요한 성질이다.** $Z$ 와 $Y$ 가 둘 다 단위 길이당 값이라, 길이가 분자·분모에서
**약분**된다.

$$
Z_0 = \sqrt{\dfrac{Z \cdot l}{Y \cdot l}} = \sqrt{\dfrac{Z}{Y}}
$$

$1\ \mathrm{[km]}$ 든 $1000\ \mathrm{[km]}$ 든 특성임피던스가 같다. 선로의 **고유
성질**이다.

전기자기학 em.8.3의 고유임피던스 $Z_0 = \sqrt{\dfrac{\mu}{\varepsilon}} = 377\ \Omega$ 과
같은 개념이다. 매질(선로)이 정하는 값이고 길이와 무관하다.

### 값

$$
Z_0 = \sqrt{\dfrac{L}{C}}
$$

에서 $L$ 과 $C$ 는 pw.2.1의 것이다.

선로정수를 넣어 정리하면 **실용 계산식**이 나온다.

$$
\boxed{Z_0 = \sqrt{\dfrac{L}{C}} = 138\log_{10}\dfrac{D}{r}\ \mathrm{[\Omega]}}
$$

**138 이 어디서 나오는지** 확인해보면 안 잊는다. pw.2.1의 $L$ 과 $C$ 를 넣으면
($0.05$ 는 무시)

$$
Z_0 = \sqrt{\dfrac{0.4605\log_{10}\frac{D}{r} \times 10^{-3}}{\dfrac{0.02413}{\log_{10}\frac{D}{r}} \times 10^{-6}}} = \sqrt{\dfrac{0.4605 \times 10^{3}}{0.02413}}\,\log_{10}\dfrac{D}{r}
$$

$$
= \sqrt{19084}\,\log_{10}\dfrac{D}{r} = 138.1\log_{10}\dfrac{D}{r}
$$

**정확히 138이 떨어진다.** $L$ 과 $C$ 에서 $\log$ 가 각각 분자·분모에 있었으니
(pw.2.1), 나누면 $\log$ 가 **제곱**이 되어 밖으로 나온다.

| 선로 | $Z_0$ | 왜 |
|---|---|---|
| **가공선로** | 약 $300 \sim 500\ \Omega$ | $C$ 가 작다 (전선이 공중에 떠 있음) |
| **케이블** | 약 $30 \sim 50\ \Omega$ | **$C$ 가 매우 크다** (도체가 가깝고 $\varepsilon_s$ 높음) |

**케이블의 특성임피던스가 10배쯤 작다.** $C$ 가 크기 때문이다. 도체 간격이 mm 단위고
절연체의 비유전율이 2~4라 정전용량이 크다.

이 차이가 **서지 반사**에서 중요해진다(pw.4.1). 가공선에서 케이블로 서지가 들어가면
임피던스가 확 달라져 크게 반사된다.

$$
\Gamma = \dfrac{Z_2 - Z_1}{Z_2 + Z_1}
$$

전기자기학 em.8.3의 반사계수가 그대로 나온다.

### 전파정수

$$
\gamma = \sqrt{ZY} = \sqrt{(R + j\omega L)(G + j\omega C)} = \alpha + j\beta
$$

**복소수**이고, 실수부와 허수부가 각각 뜻이 있다.

| | 이름 | 뜻 | 단위 |
|---|---|---|---|
| $\alpha$ | **감쇠정수** | 거리에 따라 **크기가 줄어드는** 정도 | $\mathrm{Np/km}$ |
| $\beta$ | **위상정수** | 거리에 따라 **위상이 도는** 정도 | $\mathrm{rad/km}$ |

$$
\text{실수부} = \text{감쇠}, \qquad \text{허수부} = \text{위상}
$$

무손실이면 $\alpha = 0$ 이고 $\gamma = j\beta$ 로 순허수다. 감쇠 없이 위상만 돈다.

$$
\beta = \omega\sqrt{LC}\ \mathrm{[rad/km]}
$$

전기자기학 em.8.3의 $\beta = \omega\sqrt{\mu\varepsilon}$ 와 같다.

### 무손실 조건과 무왜형 조건 — 구분하라

**둘은 다르다. 시험이 이걸 묻는다.**

| 조건 | 식 | 뜻 |
|---|---|---|
| **무손실** | $R = G = 0$ | 감쇠가 **없다**. $\alpha = 0$ |
| **무왜형** | $RC = LG$ | 감쇠는 **있으나** 파형이 **안 일그러진다** |

**무손실**은 저항과 누설이 아예 0인 이상적인 선로다. $\alpha = 0$ 이라 크기가 안
줄고, $Z_0 = \sqrt{L/C}$ 로 실수가 된다.

**무왜형**은 손실은 있는데 **왜곡이 없는** 조건이다. 이게 더 흥미롭다.

왜곡이 왜 생기나. 일반적으로 $\alpha$ 와 $\beta$ 가 **주파수에 따라 달라진다.** 그러면
주파수 성분마다 감쇠와 속도가 달라서, 여러 주파수가 섞인 신호(예: 펄스)가 가면서
모양이 뭉개진다.

$RC = LG$ 이면 $\alpha$ 가 주파수와 무관해지고 $\beta$ 가 $\omega$ 에 정비례해서,
**모든 주파수가 같은 비율로 감쇠하고 같은 속도로 간다.** 크기만 줄어들 뿐 모양은
그대로다.

$$
\text{무왜형에서: } \alpha = \sqrt{RG}, \qquad Z_0 = \sqrt{\dfrac{L}{C}}\ (\text{실수})
$$

**통신선로**에서 중요했다. 옛날 전화선은 $RC \gg LG$ 라 신호가 뭉개졌는데, 중간중간
**장하코일**(loading coil)로 $L$ 을 인위적으로 키워 $RC = LG$ 에 맞췄다. 이걸
**장하**(loading)라 한다.

$$
\text{무손실} = \text{안 줄어든다}, \qquad \text{무왜형} = \text{줄어들되 \textbf{모양이 안 변한다}}
$$

### 전파속도

$$
v = \dfrac{\omega}{\beta} = \dfrac{1}{\sqrt{LC}} \approx 3 \times 10^{8}\ \mathrm{[m/s]}
$$

**빛의 속도**다. pw.2.1에서 $LC$ 가 거의 상수라고 한 게 이것이다.

$$
\lambda = \dfrac{v}{f} = \dfrac{3 \times 10^{8}}{60} = 5000\ \mathrm{[km]}
$$

**파장 $5000\ \mathrm{[km]}$** 가 여기서 나온다. em.8.5에서 집중정수 판정의 기준이었던
그 값이다.

## 일반회로 정수 및 4단자 정수

전파방정식을 4단자정수 꼴로 쓰면

$$
A = D = \cosh\gamma l
$$
$$
B = Z_0\sinh\gamma l
$$
$$
C = \dfrac{\sinh\gamma l}{Z_0}
$$

**검산이 자동으로 된다.**

$$
AD - BC = \cosh^2\gamma l - Z_0\sinh\gamma l \cdot \dfrac{\sinh\gamma l}{Z_0} = \cosh^2 - \sinh^2 = 1 \;\checkmark
$$

쌍곡선 함수의 항등식 $\cosh^2 x - \sinh^2 x = 1$ 이 그대로 $AD - BC = 1$ 이 된다.
**우연이 아니라 수동 선형 회로의 성질**이다.

### 중거리 근사와의 연결

$\gamma l$ 이 작으면(짧으면) 쌍곡선 함수를 급수 전개할 수 있다.

$$
\cosh x \approx 1 + \dfrac{x^2}{2}, \qquad \sinh x \approx x + \dfrac{x^3}{6}
$$

$\gamma l = \sqrt{ZY}\,l$ 을 넣으면

$$
A = \cosh\gamma l \approx 1 + \dfrac{ZY}{2}
$$

**중거리의 $A = 1 + \dfrac{ZY}{2}$ 가 그대로 나온다.** T회로도 π회로도 같은 값이었다.

$$
B = Z_0\sinh\gamma l \approx \sqrt{\dfrac{Z}{Y}} \cdot \sqrt{ZY}\,l = Z
$$

**π회로의 $B = Z$** 가 나온다.

$$
\text{장거리 이론에서 짧은 근사를 취하면 → 중거리 회로가 나온다}
$$

즉 **T·π는 장거리 이론의 1차 근사**다. 별개 이론이 아니라 같은 것의 다른 정밀도다.

## 위상각

$$
\beta l\ \mathrm{[rad]}
$$

선로 전체를 지나면서 위상이 얼마나 도는지다.

$$
\beta l = \dfrac{2\pi}{\lambda}\,l = \dfrac{2\pi f l}{v}
$$

$300\ \mathrm{[km]}$ 선로면

$$
\beta l = \dfrac{2\pi \times 300}{5000} = 0.377\ \mathrm{[rad]} = 21.6°
$$

**선로 자체가 20°를 먹는다.** 이 위상 회전이 안정도(pw.4.3)에서 중요하다.
$P = \dfrac{V_sV_r}{X}\sin\delta$ 에서 $\delta$ 의 여유가 그만큼 줄어든다.

**$\lambda/4$ 선로**($1250\ \mathrm{[km]}$, $\beta l = 90°$)에서는 임피던스가 뒤집히는
재미있는 일이 생긴다.

$$
Z_{\text{입력}} = \dfrac{Z_0^2}{Z_L}
$$

$\lambda/4$ **임피던스 변환기**라 하고, 통신·RF에서 정합에 쓴다. 다만 실제 송전선은
이렇게 길지 않다.

## 등가 T회로 및 π회로

장거리 결과를 T나 π 모양으로 **다시 표현**한 것이다. 쌍곡선 함수를 매번 계산하기
번거로우니, 보정 계수를 넣어 익숙한 회로로 바꾼다.

### 등가 π회로

$$
Z_{\pi} = Z_0\sinh\gamma l = Z \cdot \dfrac{\sinh\gamma l}{\gamma l}
$$
$$
\dfrac{Y_{\pi}}{2} = \dfrac{1}{Z_0}\tanh\dfrac{\gamma l}{2} = \dfrac{Y}{2} \cdot \dfrac{\tanh(\gamma l/2)}{\gamma l/2}
$$

**보정 계수**가 $\dfrac{\sinh\gamma l}{\gamma l}$ 과 $\dfrac{\tanh(\gamma l/2)}{\gamma l/2}$ 다.
$\gamma l$ 이 작으면 둘 다 1에 가까워져 보통 π회로로 돌아간다.

### 등가 T회로

$$
\dfrac{Z_T}{2} = Z_0\tanh\dfrac{\gamma l}{2}, \qquad Y_T = \dfrac{\sinh\gamma l}{Z_0}
$$

### 왜 등가 π를 쓰나

**실무 계통 해석 프로그램이 전부 등가 π를 쓴다.**

- 정확도는 분포정수와 **동일**(근사가 아니라 등가)
- 모양은 익숙한 π라 **행렬 계산이 쉽다**
- 여러 구간을 이어 붙이기 좋다

$$
\text{정확도는 장거리 이론 그대로, 형태는 π회로}
$$

이게 등가 π의 값어치다. 이론은 쌍곡선으로 풀고, 계산은 π로 한다.
