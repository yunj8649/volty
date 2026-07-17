---
id: mc.1.6
title: 직류전동기의 구조 및 원리
status: reviewed
summary: 발전기와 구조가 같다. F = BIl로 돌고, 돌면 역기전력이 생겨 전류를 막는다. 그 역기전력이 전동기의 자기 조절 장치다.
covers:
  - mc.1.6.1
formulas:
  - label: 회전력 (토크)
    tex: T = \dfrac{P Z \phi I_a}{2\pi a}\ \mathrm{[N \cdot m]} = K\phi I_a
    note: '**자속과 전기자 전류에 비례**한다.'
  - label: 역기전력
    tex: E = V - I_a R_a = K\phi N\ \mathrm{[V]}
    note: 발전기의 $E = V + I_aR_a$ 와 **부호만 반대**.
  - label: 회전속도
    tex: N = \dfrac{V - I_a R_a}{K\phi}\ \mathrm{[rpm]}
    note: 역기전력 식을 $N$ 에 대해 푼 것. **자속에 반비례**.
  - label: 토크와 출력
    tex: T = \dfrac{P_o}{\omega} = \dfrac{60 P_o}{2\pi N} = 9.55\dfrac{P_o}{N}\ \mathrm{[N \cdot m]}
    note: $\mathrm{[kg \cdot m]}$ 이면 $0.975\frac{P_o}{N}$.
traps:
  - '**역기전력이 전동기의 자기 조절 장치**다. 부하가 늘면 속도가 떨어지고, 역기전력이
    줄고, 전류가 늘어 토크가 커진다.'
  - '**기동 순간 역기전력이 0**이라 전류가 폭주한다. 그래서 기동저항이 필요하다.'
  - '**속도는 자속에 반비례**($N \propto \frac{1}{\phi}$)한다. 전압에 비례하는 것과 헷갈리면 안 된다.'
  - '$T = K\phi I_a$ 와 $E = K\phi N$ 은 **같은 $K$** 가 아니다. 단위계가 다르다.'
related:
  - mc.1.1
  - mc.1.7
  - mc.1.8
---

## 직류전동기의 구조 및 원리

### 구조 — 발전기와 똑같다

$$
\text{\textbf{발전기와 똑같다}}
$$

전기자 + 계자 + 정류자. mc.1.1에서 본 그대로다.

$$
\text{같은 기계를 \textbf{돌리면 발전기}, \textbf{전류를 넣으면 전동기}}
$$

전기자기학 em.5.4에서 강조한 그것이다.

### 뿌리는 F = BIl

$$
F = BIl\ \mathrm{[N]}
$$

자계 속 도체에 전류를 흘리면 힘을 받는다. 방향은 **플레밍 왼손법칙**이다.

$$
\text{왼손 = 전동기}(\text{Motor}) \qquad / \qquad \text{오른손 = 발전기}(\text{Generator})
$$

### 정류자가 계속 돌게 한다

**힘만으로는 반 바퀴만 돌고 멈춘다.** 코일이 반 바퀴 돌면 도체가 반대 극 아래로
가서 힘의 방향이 뒤집히기 때문이다.

$$
\text{정류자가 반 바퀴마다 전류 방향을 뒤집는다} \to \text{힘의 방향이 \textbf{유지}} \to \text{계속 회전}
$$

**발전기에서는 교류를 직류로 바꿨는데, 전동기에서는 직류를 교류로 바꾼다.** 같은
정류자가 반대 일을 한다.

$$
\text{발전기: 교류} \to \text{직류} \qquad / \qquad \text{전동기: 직류} \to \text{교류}(\text{전기자 안에서})
$$

**둘 다 전기자 안에서는 교류**라는 게 공통이다. 그래서 둘 다 성층철심이 필요하다.

## 역기전력 — 전동기의 핵심

### 돌면 발전기가 된다

전동기가 돌기 시작하면, 도체가 자계를 끊으므로 **기전력이 생긴다**($e = Blv$).

$$
\text{전동기가 돌면서 \textbf{발전도 한다}}
$$

그런데 이 기전력은 **렌츠의 법칙**에 따라 원인(전류)을 방해하는 방향이다.

$$
\boxed{E = V - I_a R_a = K\phi N \quad(\text{\textbf{역기전력}})}
$$

발전기와 비교하면

$$
\text{발전기: } E = V + I_a R_a \quad(\text{만든 전압 → 내보냄})
$$
$$
\text{전동기: } V = E + I_a R_a \quad(\text{받은 전압 → 역기전력을 이기고 밀어넣음})
$$

**부호 하나 차이**다. 물리적으로는 같은 $E$ 다.

### 역기전력이 자기 조절 장치다

$$
I_a = \dfrac{V - E}{R_a}
$$

**전류는 $V$ 와 $E$ 의 차이로 정해진다.** $R_a$ 가 아주 작으니, 차이가 조금만 나도
전류가 크게 변한다.

**부하가 늘면 어떻게 되나**

$$
\text{부하} \uparrow \;\to\; N \downarrow \;\to\; E = K\phi N \downarrow \;\to\; I_a = \dfrac{V-E}{R_a} \uparrow \;\to\; T = K\phi I_a \uparrow
$$

**저절로 토크가 커져서 부하를 감당한다.**

$$
\boxed{\text{역기전력 = 전동기의 \textbf{자동 조절 장치}}}
$$

아무도 시키지 않았는데 부하에 맞춰 전류를 조절한다. 전동기가 그냥 꽂아만 두면 알아서
도는 이유다.

### 기동 순간이 위험하다

$$
N = 0 \;\Longrightarrow\; E = K\phi N = 0
$$

**정지 상태에서는 역기전력이 0**이다. 그러면

$$
I_{st} = \dfrac{V - 0}{R_a} = \dfrac{V}{R_a}
$$

$R_a$ 가 아주 작으니 **전류가 폭주**한다. 정격의 수십 배가 흐를 수 있다.

$$
\text{대책: \textbf{기동저항}}(\text{mc.1.8})
$$

pw.5.4에서 유도전동기의 기동전류가 5~7배라고 한 것과 **같은 원리**다. 회전자가 정지해
있으면 역기전력이 없다.

## 토크

$$
\boxed{T = \dfrac{P Z \phi I_a}{2\pi a}\ \mathrm{[N \cdot m]} = K\phi I_a}
$$

$$
\text{\textbf{자속}과 \textbf{전기자 전류}에 비례한다}
$$

### 어디서 나오나

$F = BIl$ 을 전체 도체에 대해 합하고, 반지름을 곱해 토크로 바꾼 것이다.

**더 간단한 유도**도 있다. 전기적 입력이 기계적 출력으로 바뀐다는 데서

$$
E I_a = T\omega \;\Longrightarrow\; T = \dfrac{E I_a}{\omega} = \dfrac{K\phi N \cdot I_a}{\frac{2\pi N}{60}} = \dfrac{60K}{2\pi}\phi I_a
$$

**$N$ 이 약분된다.** 토크는 속도와 무관하고 $\phi I_a$ 로만 정해진다.

### 출력과의 관계

$$
P_o = T\omega = T \cdot \dfrac{2\pi N}{60}
$$

$$
\boxed{T = \dfrac{60 P_o}{2\pi N} = 9.55\dfrac{P_o}{N}\ \mathrm{[N \cdot m]}}
$$

$\mathrm{[kg \cdot m]}$ 단위면 $9.8$ 로 나눠서

$$
T = 0.975\dfrac{P_o}{N}\ \mathrm{[kg \cdot m]} \quad(P_o \text{ 가 } \mathrm{[W]})
$$

$P_o$ 를 $\mathrm{[kW]}$ 로 주면 $1000$ 배가 되니

$$
\boxed{T = 975\dfrac{P_o}{N}\ \mathrm{[kg \cdot m]} \quad(P_o \text{ 가 } \mathrm{[kW]})}
$$

**9.55 · 0.975 · 975** 셋 다 시험에 나온다. **단위를 먼저 확인**해야 한다.

$$
\dfrac{60}{2\pi} = 9.55\ \mathrm{[N \cdot m]}, \qquad \dfrac{9.55}{9.8} = 0.975\ \mathrm{[kg \cdot m]}, \qquad 0.975 \times 1000 = 975
$$

| 계수 | $T$ 단위 | $P_o$ 단위 |
|---|---|---|
| **9.55** | $\mathrm{N \cdot m}$ | $\mathrm{W}$ |
| **0.975** | $\mathrm{kg \cdot m}$ | $\mathrm{W}$ |
| **975** | $\mathrm{kg \cdot m}$ | $\mathrm{kW}$ |

**0.975와 975는 1000배 차이일 뿐**이다. 숫자만 보고 외우면 헷갈리니, 어느 단위의
출력을 줬는지부터 본다.

## 회전속도

역기전력 식을 $N$ 에 대해 풀면

$$
\boxed{N = \dfrac{V - I_a R_a}{K\phi} = \dfrac{E}{K\phi}\ \mathrm{[rpm]}}
$$

**세 가지가 속도를 정한다.**

| 인자 | 관계 |
|---|---|
| **전압 $V$** | **비례** |
| **자속 $\phi$** | **반비례** |
| 전기자 저항 $R_a$ | (전류와 곱해져) 약간 감소 |

$$
\boxed{N \propto \dfrac{V}{\phi}}
$$

**속도 제어의 세 방법**이 여기서 바로 나온다(mc.1.8).

| 방법 | 무엇을 바꾸나 |
|---|---|
| **전압 제어** | $V$ |
| **계자 제어** | $\phi$ |
| **저항 제어** | $R_a$ (외부 저항 추가) |

### 자속에 반비례한다 — 위험하다

$$
\phi \to 0 \;\Longrightarrow\; N \to \infty
$$

**계자가 끊기면 무한 속도로 폭주한다.** 실제로는 잔류자기 때문에 무한은 아니지만,
원심력으로 **전기자가 터진다.**

$$
\text{\textbf{계자 회로를 절대 끊으면 안 된다}}
$$

그래서 **계자 저항기에는 퓨즈를 안 단다.** 그리고 **계자상실 계전기**(pw.1.6의 40번)로
감시한다.

**직권전동기의 무부하 위험**(mc.1.7)도 같은 이유다.

## 정리 — 세 식이 전부다

$$
\boxed{E = K\phi N \qquad T = K\phi I_a \qquad N = \dfrac{V - I_aR_a}{K\phi}}
$$

**이 셋에서 직류전동기의 모든 특성이 나온다.**

| 알고 싶은 것 | 식 |
|---|---|
| 토크 | $T = K\phi I_a$ |
| 속도 | $N \propto \frac{V}{\phi}$ |
| 전류 | $I_a = \frac{V-E}{R_a}$ |

mc.1.7의 종류별 특성은 **$\phi$ 가 $I_a$ 와 어떤 관계냐**로 갈릴 뿐이다.

$$
\text{분권: } \phi = \text{일정} \qquad / \qquad \text{직권: } \phi \propto I_a
$$

이 한 줄이 두 전동기의 성격을 완전히 갈라놓는다.
