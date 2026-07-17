---
id: em.8.3
title: 전자파 및 평면파
status: reviewed
summary: 전계와 자계가 서로를 만들며 나아가는 게 전자파다. 진공에서 속도는 3×10⁸, 고유임피던스는 377Ω이다.
covers:
  - em.8.3.1
  - em.8.3.2
  - em.8.3.3
  - em.8.3.4
  - em.8.3.5
  - em.8.3.6
  - em.8.3.7
  - em.8.3.8
  - em.8.3.9
formulas:
  - label: 전파속도
    tex: v = \dfrac{1}{\sqrt{\mu\varepsilon}} = \dfrac{3 \times 10^{8}}{\sqrt{\mu_s\varepsilon_s}}\ \mathrm{[m/s]}
    note: 진공에서 $c = \dfrac{1}{\sqrt{\mu_0\varepsilon_0}} = 3 \times 10^{8}$.
  - label: 고유 임피던스
    tex: Z_0 = \dfrac{E}{H} = \sqrt{\dfrac{\mu}{\varepsilon}} = 377\sqrt{\dfrac{\mu_s}{\varepsilon_s}}\ \mathrm{[\Omega]}
    note: 진공에서 $\sqrt{\mu_0/\varepsilon_0} = 377\ \Omega$ (약 $120\pi$).
  - label: 파동방정식
    tex: \nabla^2 E = \mu\varepsilon\dfrac{\partial^2 E}{\partial t^2}
    note: 맥스웰 1·2를 연립하면 나온다. 계수 $\mu\varepsilon = 1/v^2$.
  - label: 포인팅 벡터
    tex: \vec{P} = \vec{E} \times \vec{H}, \qquad P = EH\ \mathrm{[W/m^2]}
    note: 단위 면적당 전력. $E \perp H$ 라 $\sin\theta = 1$.
  - label: 파장과 위상정수
    tex: \lambda = \dfrac{v}{f}, \qquad \beta = \dfrac{2\pi}{\lambda} = \omega\sqrt{\mu\varepsilon}
    note: 위상정수는 단위 길이당 위상 변화.
traps:
  - 고유임피던스 **377Ω** 은 진공(공기)의 값이다. $120\pi \approx 377$ 이다.
  - '**전자파에서 E와 H는 서로 수직이고, 진행 방향과도 수직**이다. 셋이 서로
    직교한다(횡파, TEM).'
  - 전파속도는 $\varepsilon$ 과 $\mu$ 가 **분모의 제곱근**에 있다. 매질이 조밀할수록
    느려진다.
  - 포인팅 벡터의 방향이 **에너지가 흐르는 방향**이자 파의 진행 방향이다.
related:
  - em.8.2
  - em.7.7
  - em.5.1
---

## 전자파

맥스웰 방정식의 시간 항 두 개가 되먹임을 만든다.

$$
\text{변하는 } E \;\xrightarrow{\text{제1}}\; H, \qquad \text{변하는 } H \;\xrightarrow{\text{제2}}\; E
$$

전계가 자계를 만들고 그 자계가 다시 전계를 만들면서, **도체 하나 없는 빈 공간을
스스로 나아간다.** 이것이 **전자파**다.

전자파의 정체를 잡는 세 가지다.

**$E$ 와 $H$ 는 서로 수직이다.** 그리고 **진행 방향과도 수직**이다. 셋이 서로
직교한다. 이런 파를 **횡파** 또는 **TEM파**(Transverse ElectroMagnetic)라 한다.

**$E$ 와 $H$ 는 위상이 같다.** 동시에 최대가 되고 동시에 0이 된다. (도체 안에서는
다르다 — 뒤에서 다룬다.)

**매질이 필요 없다.** 소리는 공기가 있어야 하지만 전자파는 진공을 간다. 전계와
자계가 서로를 지탱하기 때문이다.

## 평면파

파면(위상이 같은 면)이 **평면**인 파다. 진행 방향에 수직인 평면 위에서는 어디나
$E$ 와 $H$ 가 같다.

실제로는 점 광원에서 나온 파가 구면파인데, **멀리 가면 평면파에 가까워진다.**
태양빛이 지구에 도달할 때 사실상 평면파인 것과 같다. 계산이 훨씬 쉬워서 대부분의
문제가 평면파를 전제한다.

$z$ 방향으로 진행하는 평면파는

$$
E = E_m\sin(\omega t - \beta z), \qquad H = H_m\sin(\omega t - \beta z)
$$

$\beta$ 가 **위상정수**이고 단위 길이당 위상이 얼마나 도는지를 나타낸다.

$$
\beta = \dfrac{2\pi}{\lambda} = \dfrac{\omega}{v} = \omega\sqrt{\mu\varepsilon}\ \mathrm{[rad/m]}
$$

## 파동방정식

맥스웰 1·2를 연립하면 나온다. 진공(또는 무손실 유전체, $k = 0$)에서

$$
\nabla \times E = -\mu\dfrac{\partial H}{\partial t}, \qquad \nabla \times H = \varepsilon\dfrac{\partial E}{\partial t}
$$

첫 식에 $\nabla \times$ 를 한 번 더 취하고 둘째 식을 넣으면

$$
\nabla^2 E = \mu\varepsilon\dfrac{\partial^2 E}{\partial t^2}
$$

$$
\nabla^2 H = \mu\varepsilon\dfrac{\partial^2 H}{\partial t^2}
$$

**이것이 파동방정식이다.** 일반적인 파동방정식이 $\nabla^2 u = \dfrac{1}{v^2}\dfrac{\partial^2 u}{\partial t^2}$
이므로, 비교하면

$$
\mu\varepsilon = \dfrac{1}{v^2} \quad\Longrightarrow\quad v = \dfrac{1}{\sqrt{\mu\varepsilon}}
$$

**속도가 저절로 튀어나온다.** 맥스웰이 여기서 숫자를 넣어봤더니 빛의 속도가 나왔고,
그래서 "빛은 전자파다"라고 선언했다.

## 전파속도

$$
v = \dfrac{1}{\sqrt{\mu\varepsilon}}\ \mathrm{[m/s]}
$$

진공에서는

$$
c = \dfrac{1}{\sqrt{\mu_0\varepsilon_0}} = \dfrac{1}{\sqrt{4\pi \times 10^{-7} \times 8.855 \times 10^{-12}}} = 3 \times 10^{8}\ \mathrm{[m/s]}
$$

**전기 상수와 자기 상수만 곱했는데 빛의 속도가 나온다.** 앞서 em.5.1에서 "전기와
자기가 같은 현상의 두 얼굴이라는 첫 힌트"라고 한 게 이것이다.

매질 안에서는

$$
v = \dfrac{c}{\sqrt{\mu_s\varepsilon_s}} = \dfrac{3 \times 10^{8}}{\sqrt{\mu_s\varepsilon_s}}\ \mathrm{[m/s]}
$$

**$\varepsilon$ 과 $\mu$ 가 분모에 있으니 매질이 조밀할수록 느려진다.** 물($\varepsilon_s = 80$)
에서 빛이 느려져 굴절이 생기는 게 이것이다. 광학의 **굴절률**이 사실
$n = \sqrt{\mu_s\varepsilon_s}$ 다.

관련 관계식도 묶어둔다.

$$
\lambda = \dfrac{v}{f} = vT, \qquad \omega = 2\pi f, \qquad v = \lambda f = \dfrac{\lambda}{T}
$$

## 도체 내의 전자파

**전도전류가 지배적인 곳**($k \gg \omega\varepsilon$)에서는 이야기가 달라진다.

$$
\nabla \times H \approx kE
$$

이걸 풀면 **감쇠하는 파**가 나온다.

$$
E = E_0 e^{-\alpha z}\sin(\omega t - \beta z), \qquad \alpha = \beta = \dfrac{1}{\delta} = \sqrt{\dfrac{\omega\mu k}{2}}
$$

$\delta$ 가 앞 단원의 **침투깊이**다. 표피효과가 사실 "도체 내의 전자파" 문제였다는
게 여기서 드러난다.

도체 안에서 진공과 다른 점들이다.

| | 진공/유전체 | 도체 |
|---|---|---|
| 감쇠 | **없다** | **지수적으로 감쇠** ($e^{-z/\delta}$) |
| $E$ 와 $H$ 위상 | **같다** | $H$ 가 **45° 뒤진다** |
| 고유임피던스 | 실수 $\sqrt{\mu/\varepsilon}$ | **복소수** (위상각 45°) |
| 파장 | 길다 | 매우 짧다 |

**$E$ 와 $H$ 의 위상이 45° 어긋난다**는 게 도체의 특징이다. 진공에서는 같았다.

## 전자파의 방사

전자파는 **가속되는 전하**에서 나온다. 등속으로 움직이는 전하는 방사하지 않고,
**가속·감속·진동**할 때만 나온다.

안테나가 그것이다. 도선에 교류를 흘리면 전자가 왕복 진동하고, 그때 전자파가
방사된다.

효율적으로 방사하려면 안테나 길이가 **파장과 맞아야** 한다. 대표적인 것이
**반파장 다이폴**($l = \lambda/2$)이다.

$$
l = \dfrac{\lambda}{2} = \dfrac{v}{2f}
$$

주파수가 낮으면 파장이 길어 안테나가 커진다. 그래서 AM 라디오 안테나는 크고,
$5\ \mathrm{[GHz]}$ 와이파이 안테나는 손톱만 하다.

## 전자파의 반사와 굴절

매질이 바뀌면 일부는 **반사**되고 일부는 **투과**한다. 갈리는 기준이
**고유임피던스 차이**다.

$$
\text{반사계수 } \Gamma = \dfrac{Z_2 - Z_1}{Z_2 + Z_1}
$$

- $Z_1 = Z_2$ — 반사 **없음**. 전부 투과. **정합**(matching)이라 한다.
- $Z_2 = 0$ (완전도체) — $\Gamma = -1$. **전부 반사**되고 위상이 뒤집힌다.
- $Z_2 = \infty$ — $\Gamma = +1$. 전부 반사, 위상 유지.

**완전도체는 전자파를 100% 반사한다.** 전자레인지 벽면, 안테나 반사판, 정전차폐가
전부 이 원리다.

임피던스가 다르면 반사가 생기니, 안테나와 케이블의 임피던스를 맞춰야 한다. 동축
케이블이 $50\ \Omega$ 이나 $75\ \Omega$ 규격인 이유가 이것이다.

## 전자파의 전송선로

전자파를 원하는 곳으로 안내하는 구조다.

- **동축 케이블** — 두 도체 사이로 TEM파가 간다. 외부 도체가 차폐 역할을 해서
  전자파가 안 샌다.
- **평행 2선식** — 구조는 간단한데 방사 손실이 있다.
- **도파관** — 속이 빈 금속관. 고주파에서 쓴다. TEM파는 못 가고 TE/TM 모드로 간다.
- **광섬유** — 전반사로 빛(전자파)을 가둔다.

전송선로의 **특성 임피던스**는

$$
Z_0 = \sqrt{\dfrac{L}{C}}\ \mathrm{[\Omega]}
$$

$L$, $C$ 는 단위 길이당 인덕턴스와 정전용량이다. 앞 단원에서 구한 동축 케이블의
$L = \dfrac{\mu}{2\pi}\ln\dfrac{b}{a}$, $C = \dfrac{2\pi\varepsilon}{\ln(b/a)}$ 를
넣으면

$$
Z_0 = \sqrt{\dfrac{\mu}{\varepsilon}} \cdot \dfrac{1}{2\pi}\ln\dfrac{b}{a}
$$

**인덕턴스와 정전용량 단원이 여기서 만난다.** 회로이론의 분포정수 회로가 이 이야기다.

## 포인팅벡터

전자파가 실어 나르는 **에너지의 흐름**을 나타내는 벡터다.

$$
\vec{P} = \vec{E} \times \vec{H}\ \mathrm{[W/m^2]}
$$

**단위 면적당 전력**이다. $E$ 와 $H$ 가 서로 수직($\sin\theta = 1$)이므로 크기는

$$
P = EH\ \mathrm{[W/m^2]}
$$

**방향이 중요하다.** 외적이므로 $\vec{P}$ 는 $E$ 와 $H$ 둘 다에 수직인데, 그게
바로 **전자파의 진행 방향**이다.

$$
E, \; H, \; P \;\text{가 서로 직교하고, } P \text{ 방향으로 에너지가 간다}
$$

고유임피던스를 쓰면 하나로 표현할 수 있다.

$$
P = EH = \dfrac{E^2}{Z_0} = Z_0 H^2\ \mathrm{[W/m^2]}
$$

전력계통의 전력이 사실 **도선 안이 아니라 도선 주위 공간을 흐른다**는 걸 이 벡터가
말해준다. 도선 주위의 $E$ 와 $H$ 를 외적하면 포인팅 벡터가 도선을 따라 흐르는
방향으로 나온다. 직관에 어긋나지만 이게 맞는 그림이다.

## 고유 임피던스

전자파에서 $E$ 와 $H$ 의 **비율**이다.

$$
Z_0 = \dfrac{E}{H} = \sqrt{\dfrac{\mu}{\varepsilon}}\ \mathrm{[\Omega]}
$$

단위가 옴인 게 재미있다. 옴의 법칙 $\dfrac{V}{I} = R$ 과 같은 꼴이라 그렇다.

진공(공기)에서는

$$
Z_0 = \sqrt{\dfrac{\mu_0}{\varepsilon_0}} = \sqrt{\dfrac{4\pi \times 10^{-7}}{8.855 \times 10^{-12}}} = 377\ \Omega \approx 120\pi
$$

**377Ω** 은 반드시 외워야 하는 값이다. $120\pi \approx 376.99$ 라 $120\pi$ 로도
쓴다.

매질 안에서는

$$
Z_0 = 377\sqrt{\dfrac{\mu_s}{\varepsilon_s}}\ \mathrm{[\Omega]}
$$

$\varepsilon_s$ 가 크면 임피던스가 **작아진다.** 물($\varepsilon_s = 80$)의 고유
임피던스는 $377/\sqrt{80} \approx 42\ \Omega$ 다. 공기와 크게 다르니 수면에서
전자파가 대부분 반사된다 — 물속으로 전파가 잘 안 들어가는 이유다.

### 두 상수 정리

전자계 단원에서 반드시 외워야 할 두 숫자다.

| | 진공에서의 값 | 식 |
|---|---|---|
| **전파속도** | $3 \times 10^{8}\ \mathrm{[m/s]}$ | $v = \dfrac{1}{\sqrt{\mu\varepsilon}}$ |
| **고유임피던스** | $377\ \Omega$ ($120\pi$) | $Z_0 = \sqrt{\dfrac{\mu}{\varepsilon}}$ |

**하나는 곱의 역제곱근, 하나는 비의 제곱근**이다. $\mu$ 와 $\varepsilon$ 을 곱하면
속도가 나오고 나누면 임피던스가 나온다. 이렇게 잡아두면 안 헷갈린다.
