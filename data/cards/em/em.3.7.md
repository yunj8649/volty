---
id: em.3.7
title: 유전체 사이의 힘
status: reviewed
summary: 유전체는 전계가 센 쪽으로 빨려 들어간다. 경계면에서는 유전율이 큰 쪽에서 작은 쪽으로 밀어낸다.
covers:
  - em.3.7.1
  - em.3.7.2
formulas:
  - label: 유전체 내 도체 표면에 작용하는 힘
    tex: f = \dfrac{\sigma^2}{2\varepsilon} = \dfrac{1}{2}\varepsilon E^2 = \dfrac{D^2}{2\varepsilon}\ \mathrm{[N/m^2]}
    note: 진공일 때의 $\varepsilon_0$ 를 $\varepsilon$ 으로 바꾼 것.
  - label: 경계면에 작용하는 힘 (수직 입사)
    tex: f = \dfrac{1}{2}\left(\dfrac{1}{\varepsilon_2} - \dfrac{1}{\varepsilon_1}\right)D^2
    note: $D$ 가 연속인 경우. $\varepsilon_1 > \varepsilon_2$ 면 1에서 2로 민다.
  - label: 경계면에 작용하는 힘 (수평 입사)
    tex: f = \dfrac{1}{2}(\varepsilon_1 - \varepsilon_2)E^2
    note: $E$ 가 연속인 경우. 역시 큰 쪽에서 작은 쪽으로.
traps:
  - 힘의 방향은 언제나 **유전율이 큰 쪽에서 작은 쪽으로** 향한다. 입사가 수직이든
    수평이든 같다.
  - 결과적으로 유전체는 **전계가 센 곳으로 빨려 들어간다.** 극판 사이에 유전체를
    반쯤 걸쳐두면 안으로 끌려간다.
  - 수직 입사는 $D$ 가 연속이라 $D$ 로 된 식을, 수평 입사는 $E$ 가 연속이라 $E$ 로
    된 식을 쓴다. 무엇이 연속인지를 먼저 보고 식을 골라야 한다.
related:
  - em.2.5
  - em.3.4
  - em.3.6
---

## 유전체 내의 도체 표면에 작용하는 힘

앞서 진공에서 도체 표면에 작용하는 정전응력을 구했다.

$$
f = \dfrac{\sigma^2}{2\varepsilon_0} = \dfrac{1}{2}\varepsilon_0 E^2\ \mathrm{[N/m^2]}
$$

유전체 안이면 $\varepsilon_0$ 를 $\varepsilon$ 으로 바꾸면 된다.

$$
f = \dfrac{\sigma^2}{2\varepsilon} = \dfrac{1}{2}\varepsilon E^2 = \dfrac{D^2}{2\varepsilon} = \dfrac{1}{2}ED\ \mathrm{[N/m^2]}
$$

방향은 여전히 **표면을 바깥으로 잡아당기는** 쪽이고, 전하 부호와 무관하다.
$\sigma^2$ 처럼 제곱이 들어가기 때문이다.

여기서 조심할 게 있다. **전하 $\sigma$ 를 고정한 채** 유전체를 넣으면 $D = \sigma$
는 그대로인데 $\varepsilon$ 이 커지므로

$$
f = \dfrac{D^2}{2\varepsilon} \quad\longrightarrow\quad \text{힘이 } \dfrac{1}{\varepsilon_s} \text{로 줄어든다}
$$

반면 **전압을 고정**하면 $E = V/d$ 가 그대로이므로

$$
f = \dfrac{1}{2}\varepsilon E^2 \quad\longrightarrow\quad \text{힘이 } \varepsilon_s \text{배로 커진다}
$$

무엇을 고정했느냐에 따라 정반대다. 이 단원 전체를 관통하는 구분이니 문제를 읽을 때
반드시 확인해야 한다.

## 유전체에 작용하는 힘

유전율이 다른 두 유전체가 맞닿아 있으면 경계면에 힘이 작용한다. 앞 단원에서
유전체를 넣으면 에너지가 줄고, 그 줄어든 만큼이 유전체를 빨아들이는 일이 된다고
했다. 그 힘을 정량화한다.

방법은 도체 사이의 힘을 구할 때와 같다 — **에너지를 위치로 미분**한다. 결과만
보면 경계면에 걸리는 단위 면적당 힘은 **양쪽 에너지밀도의 차이**로 나온다.

$$
f = w_1 - w_2\ \mathrm{[N/m^2]}
$$

그런데 무엇이 연속인지에 따라 계산이 갈린다.

### 수직 입사 — D가 연속

전계가 경계면에 수직으로 들어오면 $D_{n1} = D_{n2} = D$ 다. 에너지밀도를 $D$ 로
쓴 형태를 골라야 한다.

$$
f = \dfrac{D^2}{2\varepsilon_2} - \dfrac{D^2}{2\varepsilon_1} = \dfrac{1}{2}\left(\dfrac{1}{\varepsilon_2} - \dfrac{1}{\varepsilon_1}\right)D^2\ \mathrm{[N/m^2]}
$$

$\varepsilon_1 > \varepsilon_2$ 이면 $\dfrac{1}{\varepsilon_2} > \dfrac{1}{\varepsilon_1}$
이므로 $f > 0$ 이다. **유전율이 큰 매질 1에서 작은 매질 2 쪽으로** 미는 힘이다.

### 수평 입사 — E가 연속

전계가 경계면과 나란하면 $E_{t1} = E_{t2} = E$ 다. 이번엔 $E$ 로 쓴 형태를 쓴다.

$$
f = \dfrac{1}{2}\varepsilon_1 E^2 - \dfrac{1}{2}\varepsilon_2 E^2 = \dfrac{1}{2}(\varepsilon_1 - \varepsilon_2)E^2\ \mathrm{[N/m^2]}
$$

$\varepsilon_1 > \varepsilon_2$ 이면 역시 $f > 0$ 이다. **방향이 같다.**

### 방향은 언제나 같다

두 경우 식은 다른데 결론은 하나다.

$$
\boxed{\text{힘은 유전율이 큰 쪽에서 작은 쪽으로 향한다}}
$$

입사각과 무관하다. 그래서 **유전체는 전계가 센 곳으로 빨려 들어간다.**

정리하면 이렇다.

| 입사 | 연속인 것 | 쓰는 식 | 방향 |
|---|---|---|---|
| 수직 | $D$ | $f = \dfrac{1}{2}\left(\dfrac{1}{\varepsilon_2} - \dfrac{1}{\varepsilon_1}\right)D^2$ | $\varepsilon$ 큰 쪽 → 작은 쪽 |
| 수평 | $E$ | $f = \dfrac{1}{2}(\varepsilon_1 - \varepsilon_2)E^2$ | $\varepsilon$ 큰 쪽 → 작은 쪽 |

**무엇이 연속인지를 먼저 보고 식을 고른다** — 이게 문제 풀이 순서다. 경계조건
단원의 두 줄("접선은 E, 법선은 D")이 여기서 그대로 쓰인다.

### 눈으로 보이는 현상

평행판 콘덴서에 유전체 판을 반쯤 걸쳐 넣으면 **안으로 끌려 들어간다.** 유전체가
들어간 부분은 $\varepsilon$ 이 크고 안 들어간 부분은 공기($\varepsilon_0$)이니,
경계에서 힘이 유전체를 안쪽으로 민다.

에너지로 보면 더 명확하다. 유전체가 더 들어갈수록 $C$ 가 커지고, 전원을 떼어낸
상태라면 $W = \dfrac{Q^2}{2C}$ 가 작아진다. 계는 에너지가 낮아지는 쪽으로 가려
하니 유전체를 빨아들인다.

물줄기에 대전된 막대를 가까이 대면 물이 휘는 것도 같은 원리다. 물의 비유전율이
80이라 공기보다 훨씬 크고, 전계가 센 막대 쪽으로 끌려간다. 물이 대전되어 있지 않은데도
끌려가는 게 핵심이다 — 정전유도로 중성 물체가 항상 인력을 받는 것과 같은 이야기다.

자계에서도 같은 구조가 반복된다. 상자성체·강자성체는 자계가 센 쪽으로 끌려가고,
힘의 방향은 투자율이 큰 쪽에서 작은 쪽이다. $\varepsilon \to \mu$, $E \to H$,
$D \to B$ 로 바꾸면 식까지 그대로다.
