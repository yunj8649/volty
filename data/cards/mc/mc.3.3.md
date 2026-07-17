---
id: mc.3.3
title: 제어정류기
status: reviewed
summary: 다이오드를 SCR로 바꾸면 점호각으로 출력을 조절할 수 있다. 네 가지 변환기가 여기서 나온다.
covers:
  - mc.3.3.1
  - mc.3.3.2
formulas:
  - label: 단상 전파 위상제어 (R 부하)
    tex: E_d = \dfrac{\sqrt{2}E}{\pi}(1 + \cos\alpha)
    note: $\alpha = 0$ 이면 $0.9E$ (다이오드와 같음), $\alpha = \pi$ 면 0.
  - label: 단상 전파 위상제어 (유도성 부하)
    tex: E_d = \dfrac{2\sqrt{2}E}{\pi}\cos\alpha = 0.9E\cos\alpha
    note: '**$\cos\alpha$ 가 곱해진다.** $\alpha > 90°$ 면 **음수** — 인버터가 된다.'
  - label: 3상 전파 위상제어
    tex: E_d = 1.35E\cos\alpha
    note: mc.3.2의 값에 $\cos\alpha$ 를 곱한 것.
  - label: 초퍼 (강압)
    tex: E_d = D\,E \quad(D = \text{시비율} = \frac{T_{on}}{T})
    note: 직류 → 직류. **시비율**로 조절.
traps:
  - '**유도성 부하에서 $\alpha > 90°$ 면 $E_d$ 가 음수**가 되어 전력이 거꾸로 흐른다.
    같은 회로가 인버터로 변한다.'
  - '**저항 부하와 유도성 부하의 식이 다르다.** $(1+\cos\alpha)$ 냐 $\cos\alpha$ 냐.'
  - '**위상제어는 역률을 나쁘게 한다.** $\alpha$ 만큼 전류가 뒤진다. 고조파도 낸다.'
  - 초퍼는 **직류→직류**, 인버터는 **직류→교류**, 컨버터는 **교류→직류**, 사이클로컨버터는
    **교류→교류**.
related:
  - mc.3.1
  - mc.3.2
  - pw.7.4
---

## 네 가지 전력변환

$$
\boxed{\text{\textbf{무엇에서 무엇으로}} \;-\; \text{이걸로 이름이 정해진다}}
$$

| 변환기 | 입력 → 출력 | 조절 |
|---|---|---|
| **컨버터**(정류기) | **교류 → 직류** | **점호각** $\alpha$ |
| **인버터** | **직류 → 교류** | PWM |
| **초퍼** | **직류 → 직류** | **시비율** $D$ |
| **사이클로컨버터** | **교류 → 교류** | 주파수 직접 변환 |

$$
\text{교류}\leftrightarrow\text{직류의 \textbf{네 조합}} \;-\; \text{그게 전부다}
$$

**출제기준의 "직류전력변환기"가 초퍼, "교류전력변환기"가 인버터·사이클로컨버터**다.

## 위상제어 — 다이오드를 SCR로 바꾸면

$$
\text{다이오드: 전압이 걸리면 \textbf{즉시} 켜짐}
$$
$$
\text{SCR: 게이트 펄스를 \textbf{줄 때까지} 안 켜짐}
$$

$$
\boxed{\text{\textbf{늦게 켜면} 평균 전압이 \textbf{작아진다}}}
$$

$$
\alpha = \text{\textbf{점호각}}(\text{firing angle}) \;-\; \text{얼마나 늦게 켜느냐}
$$

**mc.3.2의 정류회로에서 다이오드만 SCR로 바꾸면 된다.** 회로는 그대로다.

### 저항 부하

$$
\boxed{E_d = \dfrac{\sqrt{2}E}{\pi}(1 + \cos\alpha) \quad(\text{단상 전파})}
$$

| $\alpha$ | $E_d$ |
|---|---|
| $0°$ | $\frac{2\sqrt{2}E}{\pi} = 0.9E$ (**다이오드와 같음**) |
| $90°$ | $\frac{\sqrt{2}E}{\pi} = 0.45E$ (**절반**) |
| $180°$ | **0** |

$$
\alpha = 0 \;\Longrightarrow\; \text{다이오드 정류와 \textbf{똑같아진다}}
$$

**당연하다.** 처음부터 켜면 다이오드와 다를 게 없다.

$$
\text{저항 부하는 } E_d \geq 0 \;-\; \text{음수가 안 된다}
$$

전압이 음이 되면 저항에 흐르던 전류가 0이 되고 SCR이 저절로 꺼지기 때문이다.

### 유도성 부하 — 여기가 재미있다

$$
\boxed{E_d = \dfrac{2\sqrt{2}E}{\pi}\cos\alpha = 0.9E\cos\alpha}
$$

$$
\text{\textbf{$\cos\alpha$ 가 곱해진다}} \;-\; \text{mc.3.2의 값에 그냥 곱하면 된다}
$$

| $\alpha$ | $E_d$ | |
|---|---|---|
| $0°$ | $+0.9E$ | **정류기** (최대) |
| $60°$ | $+0.45E$ | 정류기 |
| **$90°$** | **0** | 경계 |
| **$120°$** | **$-0.45E$** | **인버터** |
| $180°$ | $-0.9E$ | 인버터 (최대) |

$$
\boxed{\alpha > 90° \;\Longrightarrow\; E_d < 0 \;\Longrightarrow\; \text{\textbf{전력이 거꾸로} 흐른다}}
$$

### 왜 음수가 되나

$$
L \text{ 이 전류를 \textbf{붙잡고 있어서} 전압이 음이 되어도 전류가 계속 흐른다}
$$

**저항 부하면 전압이 음이 되는 순간 전류가 끊기는데**, 유도성 부하는 $L$ 의 관성으로
전류가 유지된다. 그러면 SCR이 안 꺼지고 **음의 전압 구간까지 도통**한다.

$$
E_d < 0, \quad I_d > 0 \;\Longrightarrow\; P = E_d I_d < 0 \;\Longrightarrow\; \text{\textbf{부하 → 전원}}
$$

$$
\text{\textbf{같은 회로가 인버터가 된다}} \;-\; \text{타려 인버터}
$$

**mc.1.8의 회생제동**이 이렇게 구현된다. 전동기가 발전한 전력을 계통으로 돌려보낸다.
회로를 바꾸지 않고 **$\alpha$ 만 90도를 넘기면** 된다.

$$
\text{전기철도의 회생제동} = \alpha > 90°
$$

### 두 식을 헷갈리지 마라

$$
\text{저항 부하: } \dfrac{\sqrt{2}E}{\pi}(1 + \cos\alpha) \qquad / \qquad \text{유도성 부하: } \dfrac{2\sqrt{2}E}{\pi}\cos\alpha
$$

$$
\alpha = 0 \text{ 에서는 \textbf{둘 다} } 0.9E \;-\; \text{같은 값}
$$

$$
\alpha = 90° \text{ 에서 갈린다: } 0.45E \text{ vs } \textbf{0}
$$

**부하가 뭔지 먼저 확인**해야 한다. 시험에서 이걸로 함정을 판다.

### 제어각의 하한 — 역률각보다 커야

$$
\boxed{\alpha > \theta \quad(\theta = \text{부하의 역률각})}
$$

$$
\text{\textbf{SCR은 부하의 역률각보다 큰 범위에서만} 제어된다}
$$

$$
\alpha < \theta \;\Longrightarrow\; \text{\textbf{앞의 SCR이 아직 안 꺼졌는데} 다음 걸 켜는 꼴}
$$

$$
\text{전류가 \textbf{0을 안 지났으면}} \;\Longrightarrow\; \text{SCR이 \textbf{안 꺼진다}}(\text{mc.3.1})
$$

$$
\text{\textbf{자기소호가 안 되는 대가}}\text{가 여기서도}
$$

**유도성 부하는 전류가 전압보다 $\theta$ 만큼 뒤진다.** 그 전에 게이트를 주면 이전
소자가 아직 도통 중이라 제어가 안 된다.

$$
\pi \geq \alpha \geq 0 \;-\; \text{제어각의 전체 범위}
$$

### 3상 전파

$$
\boxed{E_d = 1.35E\cos\alpha}
$$

$$
\text{mc.3.2의 } 1.35E \text{ 에 } \cos\alpha \text{ 를 곱한 것}
$$

**규칙이 같다.** 유도성 부하에서 정류 전압에 $\cos\alpha$ 를 곱하면 된다.

## 위상제어의 대가

| 문제 | 왜 |
|---|---|
| **역률이 나빠진다** | 전류가 $\alpha$ 만큼 **뒤짐** |
| **고조파 발생** | 파형이 잘려 나감 |
| **전원 오염** | 계통에 고조파 유출 |

$$
\text{역률} \approx \cos\alpha
$$

$$
\alpha \uparrow \;\Longrightarrow\; \text{출력} \downarrow \;\Longrightarrow\; \text{\textbf{역률도} } \downarrow
$$

**출력을 줄일수록 역률이 나빠진다.** 이게 위상제어의 근본 문제다.

$$
\text{pw.7.3의 \textbf{고조파}가 여기서 나온다}
$$

**대책**은 PWM 컨버터를 쓰는 것이다. 위상제어 대신 고주파로 스위칭하면 역률 1에
고조파도 적다. IGBT가 있어야 가능하다(mc.3.1).

$$
\text{위상제어(SCR)} \;\longrightarrow\; \text{\textbf{PWM}(IGBT)}
$$

## 직류전력변환기

$$
\boxed{\text{\textbf{직류} → \textbf{직류}}}
$$

$$
\text{\textbf{빠르게 켰다 껐다} 해서 평균 전압을 조절}
$$

$$
\boxed{E_d = D\,E, \qquad D = \dfrac{T_{on}}{T_{on} + T_{off}} = \dfrac{T_{on}}{T}}
$$

$$
D = \text{\textbf{시비율}}(\text{duty ratio}), \quad 0 \leq D \leq 1
$$

### 왜 좋은가

$$
\text{저항으로 낮추면} \;\Longrightarrow\; \text{\textbf{열로 버림}}(\text{mc.1.8의 저항제어})
$$
$$
\text{초퍼로 낮추면} \;\Longrightarrow\; \text{\textbf{껐다 켰다} 할 뿐} \;\Longrightarrow\; \text{손실 거의 없음}
$$

$$
\text{\textbf{스위치는 켜져 있으면 전압강하 0, 꺼져 있으면 전류 0}} \;\Longrightarrow\; P = VI = 0
$$

**이상적인 스위치는 전력을 소비하지 않는다.** 이게 전력전자의 대원리다.

$$
\text{저항 제어: } \eta = D \qquad / \qquad \text{초퍼: } \eta \approx 95\%\ \text{이상}
$$

**mc.1.8에서 "저항 제어는 낭비"라고 한 것**의 해답이 초퍼다.

### 종류

| 초퍼 | $E_d$ | |
|---|---|---|
| **강압**(buck) | $DE$ ($< E$) | 낮춘다 |
| **승압**(boost) | $\frac{E}{1-D}$ ($> E$) | **높인다** |
| 승강압(buck-boost) | $\frac{D}{1-D}E$ | 둘 다 |

$$
\text{\textbf{승압 초퍼}가 신기하다} \;-\; \text{직류인데 전압이 올라간다}
$$

**변압기는 직류를 못 올린다**($e = -N\frac{d\phi}{dt}$, 변화가 없으면 기전력이 없다).
그런데 초퍼는 올린다.

$$
\text{원리: } L \text{ 에 \textbf{에너지를 모았다가} 한꺼번에 방출}
$$

$$
\text{스위치 ON: } L \text{ 에 전류를 키움}(\text{에너지 저장})
$$
$$
\text{스위치 OFF: } L \text{ 이 전류를 유지하려고 \textbf{전압을 밀어올림}}
$$

**em.7.2의 인덕턴스**가 전류를 붙잡는 성질을 승압에 쓴 것이다. 태양광 인버터,
전기차가 다 이걸 쓴다.

| 용도 | |
|---|---|
| **직류 전동기 속도제어** | 워드 레너드를 대체 (mc.1.8) |
| **전기철도** | |
| **태양광 MPPT** | 승압 초퍼 |
| 스위칭 전원 | |

## 교류전력변환기

### 인버터

$$
\boxed{\text{\textbf{직류} → \textbf{교류}}}
$$

$$
\text{스위치 4개를 \textbf{번갈아} 켜서 전류 방향을 뒤집는다}
$$

$$
\text{\textbf{PWM}}(\text{펄스폭 변조})\text{으로 정현파에 가깝게}
$$

$$
\text{펄스의 \textbf{폭}을 정현파 모양으로 바꾸면} \;\Longrightarrow\; \text{평균이 정현파}
$$

**자기소호 소자가 있어야 가능**하다(mc.3.1). 직류에는 전류 0점이 없어서 SCR로는
못 끈다.

$$
\text{GTO ・ IGBT의 등장} \;\Longrightarrow\; \text{인버터의 시대}
$$

**pw.5.4·pw.7.4에서 본 그 인버터**다. VVVF(가변전압 가변주파수)로 유도전동기의 속도를
자유롭게 제어해서, 직류기를 몰아냈다.

$$
\text{\textbf{인버터가 전동기의 판도를 바꿨다}}
$$

### 사이클로컨버터

$$
\boxed{\text{\textbf{교류} → \textbf{교류}} \;-\; \text{직류를 거치지 않고 \textbf{직접}}}
$$

$$
\text{교류} \to \text{직류} \to \text{교류}\ (\text{인버터 방식}) \qquad / \qquad \text{교류} \to \text{교류}\ (\text{사이클로컨버터})
$$

**직접 변환**이 특징이다. 중간에 직류 단계(DC link)가 없다.

$$
\text{여러 개의 SCR로 \textbf{입력 파형을 잘라 붙여} 낮은 주파수를 만든다}
$$

| 장점 | 단점 |
|---|---|
| **직접 변환** (효율↑) | **입력 주파수의 1/3 이하**만 가능 |
| **대용량 가능** | **고조파가 많다** |
| SCR로 가능 (자연 전류) | 회로가 복잡 |
| | 역률이 나쁘다 |

$$
\text{\textbf{저주파만} 만들 수 있다} \;-\; \text{올릴 수는 없다}
$$

**입력 파형을 잘라 쓰는 것**이라 원래보다 빠른 걸 못 만든다. 그래서 **저속 대용량**
전동기(압연기, 시멘트 밀, 선박 추진)에 쓴다.

$$
\text{요즘은 인버터에 밀렸다} \;-\; \text{IGBT가 대용량화되면서}
$$

## 정리

$$
\boxed{\text{컨버터}(\text{AC}\to\text{DC}) \quad \text{인버터}(\text{DC}\to\text{AC}) \quad \text{초퍼}(\text{DC}\to\text{DC}) \quad \text{사이클로컨버터}(\text{AC}\to\text{AC})}
$$

| 조절 변수 | 어디서 |
|---|---|
| **점호각** $\alpha$ | **컨버터** — $E_d = 1.35E\cos\alpha$ |
| **시비율** $D$ | **초퍼** — $E_d = DE$ |
| **PWM** | **인버터** |

$$
\boxed{\alpha > 90° \;\Longrightarrow\; \text{컨버터가 \textbf{인버터로 변한다}}}
$$

**이 한 줄이 mc.3의 백미**다. 회로를 안 바꾸고 게이트 타이밍만 늦추면 전력이 거꾸로
흐른다.
