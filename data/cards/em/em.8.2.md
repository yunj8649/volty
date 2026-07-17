---
id: em.8.2
title: 맥스웰의 방정식
status: reviewed
summary: 전기자기학 전체가 네 줄로 압축된다. 시간 항 두 개(변위전류, 전자유도)가 전기와 자기를 묶어 전자파를 만든다.
covers:
  - em.8.2.1
  - em.8.2.2
formulas:
  - label: 제1방정식 (암페어-맥스웰)
    tex: \nabla \times H = i_c + \dfrac{\partial D}{\partial t} = kE + \varepsilon\dfrac{\partial E}{\partial t}
    note: 전류와 **변위전류**가 자계를 만든다. 맥스웰이 뒷항을 추가했다.
  - label: 제2방정식 (패러데이)
    tex: \nabla \times E = -\dfrac{\partial B}{\partial t} = -\mu\dfrac{\partial H}{\partial t}
    note: 변하는 자계가 전계를 만든다. 음(−)부호가 렌츠.
  - label: 제3방정식 (가우스 전기)
    tex: \nabla \cdot D = \rho
    note: 전하가 전속의 원천. **고립 전하가 존재**한다.
  - label: 제4방정식 (가우스 자기)
    tex: \nabla \cdot B = 0
    note: '**자하가 없다.** 자속선은 폐곡선.'
traps:
  - 제1과 제2의 **부호가 다르다.** 제2에만 음(−)부호가 붙는다. 렌츠의 법칙 때문이고,
    이게 없으면 에너지 보존이 깨진다.
  - 제3은 우변이 $\rho$ 인데 제4는 **0**이다. 자하가 없기 때문이고, 이 비대칭이
    맥스웰 방정식의 가장 큰 특징이다.
  - '**시간 항이 있는 건 제1, 제2뿐**이다. 정적인 경우 이 둘의 시간 항이 사라지면
    전기와 자기가 서로 무관해진다.'
related:
  - em.8.1
  - em.7.1
  - em.6.2
---

## 맥스웰의 전자파방정식

전기자기학에서 배운 모든 것이 **네 줄로 압축된다.**

### 미분형

$$
\nabla \times H = i_c + \dfrac{\partial D}{\partial t} \qquad \text{(제1: 암페어-맥스웰)}
$$
$$
\nabla \times E = -\dfrac{\partial B}{\partial t} \qquad\qquad\;\; \text{(제2: 패러데이)}
$$
$$
\nabla \cdot D = \rho \qquad\qquad\qquad\quad\;\;\; \text{(제3: 가우스 전기)}
$$
$$
\nabla \cdot B = 0 \qquad\qquad\qquad\qquad \text{(제4: 가우스 자기)}
$$

### 적분형

| | 미분형 | 적분형 |
|---|---|---|
| 제1 | $\nabla \times H = i_c + \dfrac{\partial D}{\partial t}$ | $\oint H \cdot dl = I + \dfrac{d\Psi}{dt}$ |
| 제2 | $\nabla \times E = -\dfrac{\partial B}{\partial t}$ | $\oint E \cdot dl = -\dfrac{d\phi}{dt}$ |
| 제3 | $\nabla \cdot D = \rho$ | $\oint D \cdot dS = Q$ |
| 제4 | $\nabla \cdot B = 0$ | $\oint B \cdot dS = 0$ |

미분형과 적분형을 오가는 도구가 앞서 나온 **발산정리**(3·4번)와 **스토크스 정리**
(1·2번)다.

## 네 줄을 읽는 법

각각이 무슨 말인지 한 줄로 잡으면 외울 게 없어진다.

| | 뜻 | 뿌리 |
|---|---|---|
| **제1** | 전류와 **변화하는 전계**가 자계를 만든다 | 암페어 + **맥스웰의 변위전류** |
| **제2** | **변화하는 자계**가 전계를 만든다 | 패러데이 + 렌츠 |
| **제3** | 전하에서 전속이 솟아난다 | 가우스 (전기) |
| **제4** | 자속은 솟아나지 않는다 (**자하가 없다**) | 가우스 (자기) |

### 두 가지 비대칭

**제3과 제4가 다르다.** 하나는 우변이 $\rho$ 인데 다른 하나는 0이다.

$$
\nabla \cdot D = \rho \qquad\text{vs}\qquad \nabla \cdot B = 0
$$

**자하가 존재하지 않기 때문**이다. 이게 맥스웰 방정식의 가장 큰 비대칭이고,
자계 단원 전체를 관통했던 그 사실이다. 만약 자기 홀극이 발견된다면 우변이
$\rho_m$ 이 되어 완전히 대칭이 될 것이다.

**제1과 제2의 부호가 다르다.**

$$
\nabla \times H = +\dfrac{\partial D}{\partial t} \qquad\text{vs}\qquad \nabla \times E = -\dfrac{\partial B}{\partial t}
$$

제2에만 음(−)부호가 붙는다. **렌츠의 법칙**이다. 이게 없으면 전계와 자계가 서로를
무한정 키워 에너지가 폭주한다. 음부호가 에너지 보존을 지킨다.

## 정적인 경우 — 앞 단원들이 여기 다 있다

시간 변화가 없으면($\partial/\partial t = 0$) 앞에서 배운 것들로 무너진다.

$$
\nabla \times H = i, \qquad \nabla \times E = 0, \qquad \nabla \cdot D = \rho, \qquad \nabla \cdot B = 0
$$

앞서 em.6.2에서 만든 표가 정확히 이것이다.

- $\nabla \times E = 0$ — **정전계는 보존장**, 전위가 정의된다
- $\nabla \times H = i$ — 자계는 전류를 감아 돈다
- $\nabla \cdot D = \rho$ — 전기력선은 (+)에서 (−)로
- $\nabla \cdot B = 0$ — 자속선은 폐곡선

**정전계와 정자계가 서로 무관하다.** 전기 문제와 자기 문제를 따로 풀 수 있었던 이유다.

**시간 항이 살아나면 둘이 묶인다.**

$$
\text{변하는 } E \;\longrightarrow\; H \;\text{(제1)}, \qquad \text{변하는 } H \;\longrightarrow\; E \;\text{(제2)}
$$

전계가 자계를 만들고, 그 자계가 다시 전계를 만들고… 이 **되먹임**이 공간을 스스로
전파해 나간다. **이것이 전자파다.**

맥스웰이 변위전류 항 하나를 추가했더니 전자파가 튀어나왔고, 계산해보니 그 속도가
빛의 속도와 같았다. **빛이 전자파**라는 게 그렇게 밝혀졌다. 헤르츠가 실험으로
확인한 게 20여 년 뒤다.

## 인가전압이 있는 경우의 전자방정식

도체에 전압을 걸어 전류가 흐르는 경우, 제1방정식이 이렇게 풀린다.

$$
\nabla \times H = kE + \varepsilon\dfrac{\partial E}{\partial t}
$$

두 항으로 읽는다.

- $kE$ — **전도전류**밀도 (옴의 법칙 미분형)
- $\varepsilon\dfrac{\partial E}{\partial t}$ — **변위전류**밀도

앞 카드에서 본 대로 어느 쪽이 지배적인지는 **주파수**가 정한다.

| 조건 | 지배적 | 물질이 |
|---|---|---|
| $f \ll f_c$ | $kE$ | 도체처럼 |
| $f \gg f_c$ | $\varepsilon\dfrac{\partial E}{\partial t}$ | 유전체처럼 |

$f_c = \dfrac{k}{2\pi\varepsilon}$ 가 임계 주파수다.

### 좋은 도체와 좋은 유전체

**좋은 도체** ($k \gg \omega\varepsilon$) — 변위전류를 무시한다.

$$
\nabla \times H \approx kE
$$

이 경우를 풀면 앞서 나온 **표피효과**가 나온다. 침투깊이
$\delta = \sqrt{\dfrac{2}{\omega\mu k}}$ 가 이 근사에서 유도된 것이다.

**좋은 유전체 / 진공** ($k \approx 0$) — 전도전류를 무시한다.

$$
\nabla \times H \approx \varepsilon\dfrac{\partial E}{\partial t}
$$

이 경우가 **전자파**다. 다음 카드에서 이 식과 제2방정식을 연립해 파동방정식을
얻는다.

## 보조 관계식

맥스웰 방정식 네 개만으로는 부족하다. **매질의 성질**을 넣어줘야 풀린다. 이것을
**구성 관계식**이라 한다.

$$
D = \varepsilon E, \qquad B = \mu H, \qquad i = kE
$$

앞에서 계속 써온 것들이다. 여기에 로렌츠 힘까지 더하면 고전 전자기학이 완성된다.

$$
F = q(E + v \times B)
$$

**맥스웰 방정식 4개 + 구성 관계식 3개 + 로렌츠 힘 1개** — 이 여덟 줄이 고전
전자기학의 전부다. 전기자기학 과목에서 배운 모든 공식이 여기서 파생된 것이다.
