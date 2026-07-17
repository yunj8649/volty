---
id: ct.1.5
title: 다상교류
status: reviewed
summary: 3상은 전력이 맥동하지 않는다. 그 하나 때문에 세상이 3상을 쓴다.
covers:
  - ct.1.5.1
  - ct.1.5.2
  - ct.1.5.3
  - ct.1.5.4
  - ct.1.5.5
  - ct.1.5.6
  - ct.1.5.7
  - ct.1.5.8
  - ct.1.5.9
  - ct.1.5.10
formulas:
  - label: Y결선
    tex: V_l = \sqrt{3}\,V_p\angle 30°, \qquad I_l = I_p
    note: '**선간전압이 √3배, 30° 앞선다**. 전류는 그대로.'
  - label: Δ결선
    tex: V_l = V_p, \qquad I_l = \sqrt{3}\,I_p\angle -30°
    note: '**선전류가 √3배, 30° 뒤진다**. 전압은 그대로.'
  - label: 3상 전력
    tex: P = \sqrt{3}\,V_lI_l\cos\theta = 3V_pI_p\cos\theta
    note: '**결선과 무관하게 같은 식**. 선간이냐 상이냐만 구분.'
  - label: 대칭 n상
    tex: V_l = 2\sin\dfrac{\pi}{n}\,V_p, \qquad I_l = 2\sin\dfrac{\pi}{n}\,I_p
    note: '$n=3$ 이면 $2\sin 60° = \sqrt{3}$. **3상은 특수한 경우**일 뿐.'
  - label: Δ-Y 변환
    tex: Z_Y = \dfrac{Z_\Delta}{3}
    note: '**Δ가 3배**. mc.5.3의 Y-Δ 기동이 1/3인 뿌리.'
traps:
  - '**3상 순시전력은 맥동하지 않는다.** 단상은 2f로 맥동한다. 이게 3상을 쓰는 근본 이유.'
  - '**Y는 전압이 √3배, Δ는 전류가 √3배**다. 뒤집으면 틀린다.'
  - '**Δ가 Y의 3배**다($Z_\Delta = 3Z_Y$). √3배가 아니다.'
  - '**2전력계법은 전력계 2개로 3상 전력**을 잰다. 3개가 필요 없다.'
related:
  - ct.1.3
  - ct.1.6
  - mc.5.1
---

## 왜 3상인가

$$
\boxed{\text{\textbf{3상은 순시전력이 맥동하지 않는다}}}
$$

$$
\text{\textbf{단상}}: p(t) = VI\cos\theta - VI\cos(2\omega t - \theta) \;-\; \text{\textbf{2f로 맥동}}(\text{ct.1.3})
$$

$$
\text{\textbf{3상}}: p_a + p_b + p_c = \boxed{3VI\cos\theta = \text{\textbf{일정}}}
$$

### 왜 합이 일정한가

$$
\text{세 맥동 항이 } 120° \text{ 씩 어긋나 있다}
$$

$$
\cos(2\omega t - \theta) + \cos(2\omega t - \theta - 240°) + \cos(2\omega t - \theta - 480°) = 0
$$

$$
\text{\textbf{$2 \times 120° = 240°$ 씩}} \;\Longrightarrow\; \text{세 벡터가 \textbf{정삼각형}} \;\Longrightarrow\; \text{\textbf{합이 0}}
$$

$$
\boxed{\text{\textbf{맥동 성분이 서로 상쇄된다}}}
$$

### 그래서 무엇이 좋은가

| 결과 | 어디서 |
|---|---|
| **토크가 일정** | **회전기의 진동·소음이 없다** |
| **회전자계** | **mc.5.1** — 저절로 생긴다 |
| **전선이 절약** | 같은 전력에 동량 적음 |
| **중성선 전류 0** | 평형이면 |

$$
\text{\textbf{mc.5.7의 단상 유도전동기가 진동}}\text{하는 게 이것의 반증}
$$

$$
\text{\textbf{mc.2.3의 단상 반작용이 맥동}}\text{하는 것도}
$$

$$
\boxed{\text{\textbf{3상의 우월성이 이 한 줄에서 전부 나온다}}}
$$

## 대칭n상교류 및 평형3상 회로

$$
\text{\textbf{일반화}}\text{하면 3상은 } n=3 \text{ 인 경우일 뿐}
$$

$$
\boxed{V_l = 2\sin\dfrac{\pi}{n}\,V_p, \qquad I_l = 2\sin\dfrac{\pi}{n}\,I_p}
$$

$$
n = 3 \;\Longrightarrow\; 2\sin 60° = 2 \times \dfrac{\sqrt{3}}{2} = \boxed{\sqrt{3}}
$$

$$
\text{\textbf{√3이 어디서 왔는지}}\text{가 보인다}
$$

| $n$ | $2\sin\frac{\pi}{n}$ |
|---|---|
| **2** | $2\sin 90° = \mathbf{2}$ |
| **3** | $2\sin 60° = \mathbf{\sqrt{3}}$ |
| **4** | $2\sin 45° = \mathbf{\sqrt{2}}$ |
| **6** | $2\sin 30° = \mathbf{1}$ |

$$
\textbf{6상은 } \text{ V} _l \text{ = V} _p \;-\; \text{재미있는 성질}
$$

$$
\text{\textbf{위상차}}: \dfrac{2\pi}{n} \;-\; \text{3상이면 } 120°
$$

## 2π/n씩 위상차를 가진 대칭n상 기전력의 기호표시법

$$
\boxed{\dot{V}_k = V\angle -\dfrac{2\pi(k-1)}{n} \quad (k = 1, 2, \cdots, n)}
$$

$$
\textbf{k번째 상은 } \dfrac{2\pi}{n} \text{ 씩 뒤진다}
$$

$$
\text{3상}(n=3): \quad \dot{V}_a = V\angle 0°, \quad \dot{V}_b = V\angle -120°, \quad \dot{V}_c = V\angle -240°
$$

$$
\text{\textbf{벡터 오퍼레이터}}\text{로 쓰면} \;\Longrightarrow\; V, \; a^2V, \; aV \;-\; \text{아래 참조}
$$

## 평형부하의 경우 성형전류와 환상전류와의 관계

$$
\text{\textbf{성형}}(\text{星形}) = \text{Y} \qquad \text{\textbf{환상}}(\text{環狀}) = \Delta
$$

$$
\text{\textbf{옛 이름}}\text{이다} \;-\; \text{별 모양과 고리 모양}
$$

$$
\text{\textbf{성형전류}} = \text{Y의 상전류} = \text{선전류} \qquad \text{\textbf{환상전류}} = \Delta \text{ 의 상전류}
$$

$$
\boxed{\text{평형이면 } I_l = \sqrt{3}\,I_{\text{환상}} \;-\; \Delta \text{ 의 관계 그대로}}
$$

**출제기준의 옛 용어**다. 성형=Y, 환상=Δ 로 바꿔 읽으면 된다.

## 선간전압과 상전압

### Y결선

$$
\boxed{V_l = \sqrt{3}\,V_p \angle 30°, \qquad I_l = I_p}
$$

$$
\textbf{선간전압이 상전압보다 } \sqrt{3} \text{ 배 크고 } \text{ 30° } \text{ 앞선다}
$$

$$
V_{ab} = V_a - V_b \;-\; \text{두 상전압의 \textbf{차}}
$$

$$
|V_a - V_b| = 2V_p\sin 60° = \sqrt{3}V_p \;-\; \text{\textbf{정삼각형의 한 변}}
$$

$$
\text{\textbf{전류는 한 길로만 흐르니} } I_l = I_p
$$

### Δ결선

$$
\boxed{V_l = V_p, \qquad I_l = \sqrt{3}\,I_p \angle -30°}
$$

$$
\textbf{선전류가 상전류보다 } \sqrt{3} \text{ 배 크고 } \text{ 30° } \text{ 뒤진다}
$$

$$
I_a = I_{ab} - I_{ca} \;-\; \text{두 상전류의 \textbf{차}}
$$

$$
\text{\textbf{전압은 한 변에 그대로 걸리니} } V_l = V_p
$$

### 대칭이 아름답다

$$
\boxed{\text{\textbf{Y는 전압이} } \sqrt{3}, \qquad \Delta \text{ \textbf{는 전류가} } \sqrt{3}}
$$

$$
\textbf{Y는 } \text{ +30°, } \qquad \Delta \text{ 는 } \text{ -30°}
$$

$$
\text{\textbf{정확히 대칭}} \;-\; \text{전압과 전류가 자리를 바꾼 꼴}
$$

**mc.4.4의 30° 위상변위**가 여기서 나온다. Y-$\Delta$ 를 거치면 $30°$ 가 생긴다.

$$
\text{\textbf{둘 다 거치면}}(\Delta\text{-Y} \text{ 와 Y-}\Delta) \;\Longrightarrow\; \text{서로 상쇄}
$$

## 3상Y결선 부하인 경우

$$
I_p = \dfrac{V_p}{Z} = \dfrac{V_l/\sqrt{3}}{Z}
$$

$$
I_l = I_p = \dfrac{V_l}{\sqrt{3}\,Z}
$$

$$
\text{\textbf{중성점}}\text{이 있다} \;-\; \text{4선식 가능}
$$

$$
\text{\textbf{평형이면 중성선 전류가 0}} \;-\; I_a + I_b + I_c = 0
$$

$$
\text{\textbf{그래서 중성선을 가늘게}} \;-\; \text{또는 생략}(\text{3상 3선식})
$$

**불평형이면 중성선에 전류가 흐른다.** 그게 **영상분**이다(ct.1.6).

$$
\text{\textbf{고조파가 있으면 중성선에 제3고조파}}\text{가 몰린다}(\text{pw.7.3})
$$

**중성선이 상선보다 뜨거운** 경우가 실제로 있다. 세 상의 제3고조파가 **더해져서**
흐르기 때문이다.

$$
\text{\textbf{평형인데도 중성선에 전류}} \;-\; \text{고조파의 심술}
$$

## 3상△결선의 각부 전압, 전류

$$
I_p = \dfrac{V_p}{Z} = \dfrac{V_l}{Z}
$$

$$
I_l = \sqrt{3}I_p = \dfrac{\sqrt{3}V_l}{Z}
$$

$$
\text{\textbf{중성점이 없다}} \;-\; \text{3선식만}
$$

$$
\text{\textbf{제3고조파가 안에서 순환}}(\text{mc.4.4})
$$

## △-Y의 결선 변환

$$
\boxed{Z_\Delta = 3Z_Y \;\Longrightarrow\; Z_Y = \dfrac{Z_\Delta}{3}}
$$

$$
\text{\textbf{Δ가 3배}} \;-\; \sqrt{3} \text{ 배가 아니다}
$$

### 왜 3배인가

$$
\text{\textbf{같은 전원에 같은 전류}}\text{가 흐르려면}
$$

$$
\text{Y: } I_l = \dfrac{V_l}{\sqrt{3}Z_Y} \qquad \Delta: I_l = \dfrac{\sqrt{3}V_l}{Z_\Delta}
$$

$$
\dfrac{V_l}{\sqrt{3}Z_Y} = \dfrac{\sqrt{3}V_l}{Z_\Delta} \;\Longrightarrow\; Z_\Delta = 3Z_Y
$$

$$
\boxed{\sqrt{3} \times \sqrt{3} = 3} \;-\; \text{\textbf{두 번 곱해진다}}
$$

$$
\text{\textbf{전압에서 한 번, 전류에서 한 번}}
$$

**mc.5.3의 Y-Δ 기동이 $\frac{1}{3}$** 인 이유가 정확히 이것이다. 같은 부하를 Y로
결선하면 임피던스가 3배로 보여 전류가 $\frac{1}{3}$ 이 된다.

$$
\textbf{ct.1.2의 저항 Y-} \Delta \text{ 변환}\text{과 같은 결과}
$$

## 다상교류의 전력

$$
\boxed{P = \sqrt{3}\,V_lI_l\cos\theta = 3V_pI_p\cos\theta}
$$

$$
\text{\textbf{결선과 무관하게 같은 식}}
$$

$$
Q = \sqrt{3}V_lI_l\sin\theta, \qquad S = \sqrt{3}V_lI_l
$$

### 왜 √3인가

$$
P = 3 \times \underbrace{V_pI_p\cos\theta}_{\text{\textbf{한 상의 전력}}}
$$

$$
\text{Y: } V_p = \dfrac{V_l}{\sqrt{3}}, I_p = I_l \;\Longrightarrow\; P = 3 \cdot \dfrac{V_l}{\sqrt{3}} \cdot I_l\cos\theta = \sqrt{3}V_lI_l\cos\theta
$$

$$
\dfrac{3}{\sqrt{3}} = \sqrt{3}
$$

$$
\text{\textbf{Δ도 같은 결과}} \;-\; \text{확인해 보면}
$$

$$
\Delta: V_p = V_l, I_p = \dfrac{I_l}{\sqrt{3}} \;\Longrightarrow\; P = 3 \cdot V_l \cdot \dfrac{I_l}{\sqrt{3}}\cos\theta = \sqrt{3}V_lI_l\cos\theta \;\checkmark
$$

$$
\boxed{\text{\textbf{결선이 달라도 선간 값으로 쓰면 같은 식}}}
$$

$$
\text{\textbf{그래서 계통은 늘 선간전압으로 말한다}} \;-\; \text{결선을 몰라도 되니}
$$

**$154\ \mathrm{kV}$, $22.9\ \mathrm{kV}$ 가 전부 선간전압**인 이유다.

### n상 전력

$$
P = n V_pI_p\cos\theta = \dfrac{n}{2\sin\frac{\pi}{n}}V_lI_l\cos\theta
$$

$$
n = 3 \;\Longrightarrow\; \dfrac{3}{\sqrt{3}} = \sqrt{3} \;\checkmark
$$

## 3상 전력의 측정

### 2전력계법

$$
\boxed{\text{\textbf{전력계 2개}}\text{로 3상 전력을 잰다}}
$$

$$
P = W_1 + W_2
$$

$$
Q = \sqrt{3}(W_1 - W_2)
$$

$$
\cos\theta = \dfrac{P}{S} = \dfrac{W_1+W_2}{2\sqrt{W_1^2+W_2^2-W_1W_2}}
$$

$$
\text{\textbf{3상인데 왜 2개면 되나}}
$$

$$
\text{\textbf{블론델의 정리}}: n \text{ 선식은 } n-1 \text{ 개의 전력계로 충분}
$$

$$
\text{3상 3선식} \;\Longrightarrow\; \mathbf{2}\text{개}
$$

**KCL 때문**이다. $I_a + I_b + I_c = 0$ 이니 **하나는 나머지로 정해진다.** 독립적인
정보가 2개뿐이다.

$$
\text{\textbf{3상 4선식은 3개}} \;-\; \text{중성선이 있어 독립 정보가 3개}
$$

### 한 전력계가 음수가 되면

$$
\cos\theta < 0.5 \;\Longrightarrow\; \text{\textbf{한쪽이 음수}}
$$

$$
\text{\textbf{고장이 아니다}} \;-\; \text{역률이 나쁘면 정상적으로 그렇다}
$$

$$
P = W_1 + W_2 \;-\; \text{\textbf{그래도 더한다}}(\text{음수를 그대로)}
$$

**시험 함정**이다. 음수라고 빼면 안 된다.

### 3전압계법·3전류계법

$$
\text{\textbf{전압계 3개}}\text{로 단상 전력}: P = \dfrac{1}{2R}(V_3^2 - V_1^2 - V_2^2)
$$

$$
\text{\textbf{전류계 3개}}\text{로}: P = \dfrac{R}{2}(A_3^2 - A_1^2 - A_2^2)
$$

$$
\text{\textbf{전력계 없이} 전력을 잰다} \;-\; \text{코사인 제2법칙을 쓴 것}
$$

## 3상교류의 복소수에 의한 표시

$$
\boxed{a = 1\angle 120° = -\dfrac{1}{2} + j\dfrac{\sqrt{3}}{2}}
$$

$$
\text{\textbf{벡터 오퍼레이터}} \;-\; 120° \text{ 돌리는 연산자}
$$

$$
a^2 = 1\angle 240°, \qquad a^3 = 1\angle 360° = \mathbf{1}
$$

$$
\boxed{1 + a + a^2 = \mathbf{0}}
$$

$$
\text{\textbf{정삼각형의 세 꼭짓점을 더하면 0}}
$$

$$
\text{\textbf{이 관계가 대칭좌표법}}(\text{ct.1.6})\text{의 뼈대}
$$

$$
V_a = V, \quad V_b = a^2V, \quad V_c = aV \;-\; \text{\textbf{대칭 3상}}
$$

$$
V_a + V_b + V_c = V(1 + a^2 + a) = 0 \;\checkmark
$$

**평형 3상의 합이 0**인 게 이 항등식이다. **중성선 전류가 0**인 이유이고, **ZCT가
지락을 검출**하는 원리다(mc.4.10).

$$
\text{\textbf{하나의 항등식이 여러 곳을 떠받친다}}
$$

## 평형3상회로의 전력 등

$$
\boxed{\text{\textbf{평형}}\text{이면 한 상만 풀고 } 3 \text{ 배 하면 된다}}
$$

$$
\text{\textbf{등가 1상 회로}}(\text{per-phase})
$$

$$
\Delta \text{ 부하는 } Z_Y = \dfrac{Z_\Delta}{3} \text{ 로 바꾼 뒤} \;\Longrightarrow\; \text{\textbf{Y로 통일해서} 푼다}
$$

**3상 문제를 단상 문제로 줄이는 것**이 실무의 표준이다. 평형이면 세 상이 똑같으니
하나만 풀면 된다.

$$
\textbf{pw.3.4의 } \% \textbf{임피던스법}\text{도 이 위에 서 있다}
$$

$$
\text{\textbf{불평형이면}} \;\Longrightarrow\; \text{\textbf{대칭좌표법}}(\text{ct.1.6})\text{으로}
$$

## 정리

$$
\boxed{\text{\textbf{3상은 순시전력이 맥동하지 않는다}}} \;-\; \text{세상이 3상을 쓰는 이유}
$$

| | **Y** | **$\Delta$** |
|---|---|---|
| **전압** | $V_l = \sqrt{3}V_p \angle 30°$ | $V_l = V_p$ |
| **전류** | $I_l = I_p$ | $I_l = \sqrt{3}I_p\angle -30°$ |
| **중성점** | **있다** | 없다 |

$$
\boxed{P = \sqrt{3}V_lI_l\cos\theta \;-\; \text{\textbf{결선 무관}}}
$$

$$
\boxed{Z_\Delta = 3Z_Y} \;-\; \sqrt{3} \times \sqrt{3}
$$

$$
\boxed{1 + a + a^2 = 0} \;-\; \text{ct.1.6의 뼈대}
$$

$$
\text{\textbf{2전력계법}}: P = W_1 + W_2 \;-\; \text{음수여도 더한다}
$$
