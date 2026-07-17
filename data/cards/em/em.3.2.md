---
id: em.3.2
title: 전속밀도
status: reviewed
summary: 전속은 매질과 무관하게 Q개다. 그래서 전속밀도 D는 유전체를 넣어도 변하지 않는다 — 전기력선과 결정적으로 다른 점이다.
covers:
  - em.3.2.1
  - em.3.2.2
formulas:
  - label: 전속의 개수
    tex: \Psi = Q\ \mathrm{[C]}
    note: 매질과 **무관**하다. 전기력선($Q/\varepsilon$)과 다른 지점.
  - label: 전속밀도
    tex: D = \dfrac{\Psi}{S} = \dfrac{Q}{4\pi r^2}\ \mathrm{[C/m^2]}
    note: 점전하 기준. $\varepsilon$ 이 없다.
  - label: 전속밀도와 전계
    tex: D = \varepsilon E = \varepsilon_0 \varepsilon_s E
    note: 가장 많이 쓰는 형태.
  - label: 전속밀도의 일반식
    tex: D = \varepsilon_0 E + P
    note: 진공 몫 + 분극 몫. 유전체가 없으면($P = 0$) $D = \varepsilon_0 E$.
traps:
  - 전속은 $Q$ 개, 전기력선은 $Q/\varepsilon$ 개다. **전속만 매질과 무관**하다.
    이 구분이 유전체 단원 전체의 출발점이다.
  - 유전체를 넣으면 $E$ 는 $1/\varepsilon_s$ 로 줄지만 $D$ 는 **그대로**다.
    (전하가 일정할 때)
  - 도체 표면의 전하밀도 $\sigma$ 와 전속밀도 $D$ 는 **크기가 같다.**
    $D = \sigma$ 이고, 그래서 $E = \sigma/\varepsilon$ 이 나온다.
related:
  - em.1.3
  - em.3.1
  - em.3.4
---

## 전속

전기력선 단원에서 전하 $Q$ 에서 $Q/\varepsilon_0$ 개의 전기력선이 나온다고 했다.
매질이 유전체면 $Q/\varepsilon$ 이 되어 **개수가 줄어든다.**

이게 불편하다. 매질을 바꿀 때마다 선의 개수가 달라지면 계산이 번거롭다. 그래서
**매질과 무관하게 개수를 $Q$ 개로 고정한** 가상의 선을 따로 정의한다. 이것이
**전속**이다.

$$
\Psi = Q\ \mathrm{[C]}
$$

$\varepsilon$ 이 어디에도 없다. 진공이든 물속이든 $1\ \mathrm{[C]}$ 에서 나오는 전속은
언제나 $1$ 개다.

두 개를 나란히 놓으면 차이가 분명해진다.

| | 개수 | 매질의 영향 |
|---|---|---|
| 전기력선 | $Q/\varepsilon$ | **받는다** ($\varepsilon$ 커지면 줄어든다) |
| 전속 | $Q$ | **안 받는다** |

**전속이 매질과 무관하다**는 것, 이 한 줄이 유전체 단원 전체의 출발점이다. 뒤에
나올 경계조건에서 "$D$ 의 법선 성분이 연속"이라는 결과가 결국 이 성질에서 온다.

## 분극과 전속밀도

**전속밀도** $D$ 는 단위 면적당 지나가는 전속의 개수다.

$$
D = \dfrac{\Psi}{S}\ \mathrm{[C/m^2]}
$$

점전하 $Q$ 를 반지름 $r$ 인 구로 감싸면

$$
D = \dfrac{Q}{4\pi r^2}\ \mathrm{[C/m^2]}
$$

전계 $E = \dfrac{Q}{4\pi\varepsilon r^2}$ 와 비교해보면 **$\varepsilon$ 이 없다**는
것만 다르다. 그래서 둘의 관계가 바로 나온다.

$$
D = \varepsilon E = \varepsilon_0 \varepsilon_s E\ \mathrm{[C/m^2]}
$$

가장 많이 쓰는 형태다. 유전체를 넣으면 $E$ 는 줄어들지만 $D$ 는 그대로라는 게
여기서 보인다 — $\varepsilon$ 이 커진 만큼 $E$ 가 작아져 곱이 유지된다.

### 분극까지 넣은 일반식

$D$ 를 분극으로 풀어 쓰면 물리적 의미가 드러난다.

$$
D = \varepsilon_0 E + P\ \mathrm{[C/m^2]}
$$

두 항으로 읽으면 된다.

- $\varepsilon_0 E$ — **진공이 감당하는 몫**
- $P$ — **유전체의 분극이 감당하는 몫**

유전체가 없으면 $P = 0$ 이라 $D = \varepsilon_0 E$ 로 돌아간다. 유전체가 있으면
분극이 일부를 떠맡아서, 같은 $D$ 를 만드는 데 필요한 $E$ 가 작아진다.

$P = \varepsilon_0(\varepsilon_s - 1)E$ 를 넣어 확인해보면 앞의 식과 일치한다.

$$
D = \varepsilon_0 E + \varepsilon_0(\varepsilon_s - 1)E = \varepsilon_0\varepsilon_s E = \varepsilon E
$$

### 도체 표면에서

도체 표면의 전하밀도 $\sigma$ 와 전속밀도 $D$ 는 **크기가 같다.**

$$
D = \sigma\ \mathrm{[C/m^2]}
$$

전하 $Q$ 에서 전속이 $Q$ 개 나오는데 그게 표면적 $S$ 로 나가니, 단위 면적당
$Q/S = \sigma$ 개다. 정의상 당연한 결과다.

여기서 도체 표면의 전계가 바로 나온다.

$$
E = \dfrac{D}{\varepsilon} = \dfrac{\sigma}{\varepsilon}
$$

앞 단원에서 본 $E = \dfrac{\sigma}{\varepsilon_0}$ 의 유전체 버전이다.

### 유전체를 넣으면 무엇이 변하나

시험이 정확히 여기를 묻는다. **전하가 일정한 상태**(전원을 떼어냄)에서 유전체를
넣으면

| 양 | 변화 |
|---|---|
| $Q$ | 그대로 (전원이 없으니) |
| $D$ | **그대로** ($D = Q/S$ 라 전하로만 정해진다) |
| $E$ | $1/\varepsilon_s$ 로 **줄어든다** ($E = D/\varepsilon$) |
| $V$ | $1/\varepsilon_s$ 로 **줄어든다** ($V = Ed$) |
| $C$ | $\varepsilon_s$ 배로 **커진다** ($C = Q/V$) |

$D$ 는 그대로인데 $E$ 만 줄어든다 — 이게 전속과 전기력선을 굳이 구분해서 정의한
값어치다. 전하가 정해지면 $D$ 가 정해지고, 거기서 매질을 나눠 $E$ 를 얻는 순서로
생각하면 헷갈리지 않는다.
