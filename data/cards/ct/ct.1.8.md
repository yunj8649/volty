---
id: ct.1.8
title: 분포정수회로
status: reviewed
summary: 선로가 파장에 견줄 만큼 길면 집중정수가 깨진다. 그러면 전압이 위치의 함수가 된다.
covers:
  - ct.1.8.1
  - ct.1.8.2
  - ct.1.8.3
  - ct.1.8.4
  - ct.1.8.5
  - ct.1.8.6
formulas:
  - label: 특성 임피던스
    tex: Z_0 = \sqrt{\dfrac{Z}{Y}} = \sqrt{\dfrac{R + j\omega L}{G + j\omega C}}
    note: 무손실이면 $\sqrt{L/C}$. **거리와 무관**한 값.
  - label: 전파정수
    tex: \gamma = \sqrt{ZY} = \alpha + j\beta
    note: '$\alpha$ **감쇠정수**, $\beta$ **위상정수**.'
  - label: 무손실 선로
    tex: R = G = 0 \;\Longrightarrow\; Z_0 = \sqrt{\dfrac{L}{C}}, \quad \alpha = 0, \quad \beta = \omega\sqrt{LC}
    note: 감쇠가 없다. 위상만 돈다.
  - label: 무왜형 선로
    tex: \dfrac{R}{L} = \dfrac{G}{C} \;\Longrightarrow\; \text{\textbf{파형이 안 일그러진다}}
    note: '**헤비사이드 조건**. 감쇠는 있지만 모든 주파수가 같이 줄어든다.'
  - label: 반사계수
    tex: \rho = \dfrac{Z_L - Z_0}{Z_L + Z_0}
    note: '$Z_L = Z_0$ 이면 **반사 없음**(정합).'
traps:
  - '**무손실은 감쇠가 없는 것, 무왜형은 일그러지지 않는 것**이다. 다르다.'
  - '**무왜형 조건 RC = LG** (즉 R/L = G/C). 헤비사이드 조건이라 부른다.'
  - '**정합되면 반사가 없다**($Z_L = Z_0$). 무한장 선로와 같아진다.'
  - '**특성 임피던스는 거리와 무관**하다. 선로가 길든 짧든 같다.'
related:
  - ct.1.7
  - pw.2.3
  - ct.1.1
---

## 언제 필요한가

$$
\boxed{\text{\textbf{선로가 파장에 견줄 만큼 길면}}}
$$

$$
\text{ct.1.1의 \textbf{집중정수 근사}}\text{가 깨진다}
$$

$$
\lambda = \dfrac{c}{f} \;-\; 60\ \mathrm{Hz} \;\Longrightarrow\; 5000\ \mathrm{km}
$$

$$
\textbf{송전선 } \text{ 500} \  \mathrm{km} \;\Longrightarrow\; \dfrac{500}{5000} = \dfrac{1}{10}\lambda \;-\; \text{\textbf{무시 못 한다}}
$$

$$
\boxed{\text{\textbf{전압이 위치의 함수}}\text{가 된다}}
$$

$$
V = V(x) \;-\; \text{\textbf{같은 순간에 지점마다 전압이 다르다}}
$$

**집중정수에서는 도선 위 모든 점의 전압이 같았다.** 그 가정이 깨진다.

$$
\text{\textbf{고주파}}\text{도 마찬가지} \;-\; f \uparrow \;\Longrightarrow\; \lambda \downarrow
$$

| 언제 | 예 |
|---|---|
| **장거리 송전선** | $60\ \mathrm{Hz}$, 수백 km (pw.2.3) |
| **통신 선로** | 고주파 |
| **케이블** | |
| PCB 배선 | GHz |

## 기본식과 특성임피던스

$$
\text{\textbf{미소 구간 } dx \text{ 를 집중정수로}}
$$

$$
\text{단위 길이당}: R, L, G, C \;-\; \text{\textbf{4정수}}
$$

| 정수 | 뜻 |
|---|---|
| $R$ | **저항** (도체 손실) |
| $L$ | **인덕턴스** |
| $G$ | **누설 컨덕턴스** (절연 손실) |
| $C$ | **정전용량** |

$$
Z = R + j\omega L \;(\text{\textbf{직렬}}), \qquad Y = G + j\omega C \;(\text{\textbf{병렬}})
$$

### 전신 방정식

$$
-\dfrac{dV}{dx} = ZI, \qquad -\dfrac{dI}{dx} = YV
$$

$$
\text{\textbf{미분하면}} \;\Longrightarrow\; \dfrac{d^2V}{dx^2} = ZYV = \gamma^2 V
$$

$$
\boxed{V(x) = V^+e^{-\gamma x} + V^-e^{+\gamma x}}
$$

$$
\text{\textbf{앞으로 가는 파} + \textbf{뒤로 오는 파}}
$$

$$
\text{\textbf{파동 방정식}}\text{이다} \;-\; \text{전자기학 em.8의 그것}
$$

### 특성 임피던스

$$
\boxed{Z_0 = \sqrt{\dfrac{Z}{Y}} = \sqrt{\dfrac{R+j\omega L}{G+j\omega C}}}
$$

$$
\textbf{앞으로 가는 파의 } \dfrac{V}{I}
$$

$$
\boxed{\text{\textbf{거리와 무관}}} \;-\; \text{선로가 길든 짧든 같다}
$$

$$
\text{\textbf{선로의 성질}}\text{이지 길이의 함수가 아니다}
$$

$$
\text{ct.1.7의 \textbf{영상 임피던스}}\text{와 같은 것} \;-\; \sqrt{B/C}
$$

**가공 송전선** $Z_0 \approx 300 \sim 500\ \Omega$, **케이블** $Z_0 \approx 20 \sim 60\ \Omega$

$$
\text{\textbf{케이블이 작다}} \;-\; C \text{ 가 크니}(\text{pw.2.3})
$$

$$
Z_0 = \sqrt{\dfrac{L}{C}} \;\Longrightarrow\; C \uparrow \;\Longrightarrow\; Z_0 \downarrow
$$

**pw.4.2의 진행파**에서 가공선과 케이블의 접속점에서 반사가 일어나는 이유다. $Z_0$ 가
다르다.

### 전파정수

$$
\boxed{\gamma = \sqrt{ZY} = \sqrt{(R+j\omega L)(G+j\omega C)} = \alpha + j\beta}
$$

| | 이름 | 뜻 |
|---|---|---|
| $\alpha$ | **감쇠정수** | **얼마나 줄어드나** [Np/m] |
| $\beta$ | **위상정수** | **얼마나 늦나** [rad/m] |

$$
e^{-\gamma x} = e^{-\alpha x} \cdot e^{-j\beta x}
$$

$$
\textbf{크기는 } \text{ e} ^{-\alpha x} \text{ 로 줄고, 위상은 } \beta \text{ x } \text{ 만큼 돈다}
$$

$$
\lambda = \dfrac{2\pi}{\beta}, \qquad v = \dfrac{\omega}{\beta} \;-\; \text{\textbf{파장과 속도}}
$$

## 무한장선로

$$
\boxed{\text{\textbf{끝이 없으면}} \;\Longrightarrow\; \text{\textbf{반사가 없다}}}
$$

$$
V^- = 0 \;\Longrightarrow\; V(x) = V^+e^{-\gamma x}
$$

$$
\boxed{Z_{in} = Z_0} \;-\; \text{\textbf{입력 임피던스가 특성 임피던스}}
$$

$$
\text{\textbf{끝이 없으니 돌아올 게 없다}}
$$

### 무한장과 같아지는 법

$$
\boxed{Z_L = Z_0 \;\Longrightarrow\; \text{\textbf{정합}}}
$$

$$
\textbf{끝에 } \text{ Z} _0 \text{ 를 달면} \;\Longrightarrow\; \text{\textbf{선로는 무한한 줄 안다}}
$$

$$
\text{\textbf{반사가 없다}} \;-\; \text{에너지가 다 부하로}
$$

**통신에서 정합이 중요한 이유**다. 반사가 있으면 신호가 겹쳐 일그러진다.

$$
\text{\textbf{ct.1.7의 영상 임피던스 정합}}\text{과 같은 개념}
$$

## 무손실 선로와 무왜형 선로

$$
\boxed{\text{\textbf{둘은 다르다}}}
$$

| | 조건 | 뜻 |
|---|---|---|
| **무손실** | $R = G = 0$ | **안 줄어든다** |
| **무왜형** | $\frac{R}{L} = \frac{G}{C}$ | **안 일그러진다** (줄기는 함) |

$$
\text{\textbf{무손실은 감쇠가 없는 것, 무왜형은 왜곡이 없는 것}}
$$

$$
\text{\textbf{시험 단골}} \;-\; \text{둘을 헷갈리면 안 된다}
$$

### 무손실 선로

$$
R = G = 0
$$

$$
\gamma = \sqrt{j\omega L \cdot j\omega C} = j\omega\sqrt{LC}
$$

$$
\boxed{\alpha = 0, \qquad \beta = \omega\sqrt{LC}}
$$

$$
\boxed{Z_0 = \sqrt{\dfrac{L}{C}} \;-\; \text{\textbf{순저항}}}
$$

$$
v = \dfrac{\omega}{\beta} = \dfrac{1}{\sqrt{LC}} \;-\; \text{\textbf{주파수와 무관}}
$$

$$
\text{\textbf{모든 주파수가 같은 속도}} \;\Longrightarrow\; \text{\textbf{일그러지지 않는다}}
$$

$$
\text{\textbf{무손실이면 자동으로 무왜형}} \;-\; \dfrac{0}{L} = \dfrac{0}{C} \;\checkmark
$$

**공기 중 전파 속도**가 $\frac{1}{\sqrt{\mu_0\varepsilon_0}} = 3 \times 10^8$ 인 것과
같은 구조다(em.8).

### 무왜형 선로

$$
\boxed{\dfrac{R}{L} = \dfrac{G}{C} \;\Longleftrightarrow\; RC = LG}
$$

$$
\text{\textbf{헤비사이드 조건}}
$$

$$
\gamma = \sqrt{(R+j\omega L)(G+j\omega C)}
$$

조건을 넣으면 $G = \frac{RC}{L}$ 이니

$$
\gamma = \sqrt{(R+j\omega L)\dfrac{C}{L}(R + j\omega L)} = (R+j\omega L)\sqrt{\dfrac{C}{L}}
$$

$$
\boxed{\alpha = R\sqrt{\dfrac{C}{L}} \;(\text{\textbf{주파수 무관}}), \qquad \beta = \omega\sqrt{LC}}
$$

$$
\boxed{Z_0 = \sqrt{\dfrac{L}{C}} \;-\; \text{\textbf{순저항}}}
$$

$$
v = \dfrac{\omega}{\beta} = \dfrac{1}{\sqrt{LC}} \;-\; \text{\textbf{주파수 무관}}
$$

### 왜 안 일그러지나

$$
\text{\textbf{일그러지는 이유는 주파수마다 다르게 취급}}\text{되기 때문}
$$

| 왜곡 | 원인 |
|---|---|
| **감쇠 왜곡** | $\alpha$ 가 주파수에 따라 다름 |
| **위상 왜곡** | $v$ 가 주파수에 따라 다름 |

$$
\text{\textbf{무왜형이면}} \;\Longrightarrow\; \alpha \text{ 도 } v \text{ 도 \textbf{주파수와 무관}}
$$

$$
\boxed{\text{\textbf{모든 성분이 똑같이 줄고 똑같이 늦는다}} \;\Longrightarrow\; \text{\textbf{모양이 그대로}}}
$$

$$
\text{\textbf{줄기는 하는데 모양은 유지}} \;-\; \text{그게 무왜형}
$$

**ct.1.4의 푸리에**로 보면 명확하다. 신호는 여러 주파수의 합인데, **모든 성분이 같은
비율로 줄고 같은 시간만큼 늦으면** 파형이 유지된다.

$$
\text{\textbf{다른 성분이 다르게 취급되면}} \;\Longrightarrow\; \text{합쳤을 때 \textbf{모양이 달라진다}}
$$

### 어떻게 만드나

$$
\dfrac{R}{L} = \dfrac{G}{C} \;-\; \text{실제 선로는 } \dfrac{R}{L} \ggg \dfrac{G}{C}
$$

$$
\text{\textbf{L을 키운다}} \;\Longrightarrow\; \text{\textbf{장하 코일}}(\text{loading coil})
$$

$$
\text{\textbf{푸핀 선로}} \;-\; \text{일정 간격마다 코일을 삽입}
$$

$$
\text{\textbf{크래룹 선로}} \;-\; \text{도체에 자성 재료를 감아 연속적으로}
$$

$$
\text{\textbf{R을 줄이거나 G를 키우는 건}} \;-\; \text{손실이 늘거나 절연이 나빠지니 안 한다}
$$

$$
\boxed{\text{\textbf{L을 키우는 게 유일한 실용 방법}}}
$$

**옛 전화선**에 쓰던 기술이다. 지금은 광섬유·디지털이라 안 쓴다.

## 일반의 유한장선로

$$
V(x) = V_r\cosh\gamma x + I_rZ_0\sinh\gamma x
$$

$$
I(x) = \dfrac{V_r}{Z_0}\sinh\gamma x + I_r\cosh\gamma x
$$

$$
\text{\textbf{ABCD로 쓰면}}(\text{ct.1.7})
$$

$$
\boxed{
\begin{bmatrix} A & B \\ C & D \end{bmatrix} =
\begin{bmatrix} \cosh\gamma l & Z_0\sinh\gamma l \\ \frac{1}{Z_0}\sinh\gamma l & \cosh\gamma l \end{bmatrix}
}
$$

$$
A = D = \cosh\gamma l \;-\; \text{\textbf{대칭}} \;\checkmark
$$

$$
AD - BC = \cosh^2 - \sinh^2 = 1 \;\checkmark
$$

$$
\text{\textbf{상반 정리가 성립}}\text{한다} \;-\; \text{검산 완료}
$$

**pw.2.3의 장거리 송전선**이 정확히 이 식이다. 쌍곡선 함수가 나오는 이유다.

$$
\text{\textbf{짧으면}}(\gamma l \lll 1) \;\Longrightarrow\; \cosh \approx 1, \; \sinh \approx \gamma l
$$

$$
\begin{bmatrix} 1 & Zl \\ Yl & 1 \end{bmatrix} \;-\; \text{\textbf{집중정수로 돌아온다}}
$$

$$
\boxed{\text{\textbf{근사가 어떻게 나오는지}}\text{가 보인다}}
$$

## 반사계수

$$
\boxed{\rho = \dfrac{V^-}{V^+} = \dfrac{Z_L - Z_0}{Z_L + Z_0}}
$$

$$
\text{\textbf{얼마나 되돌아오나}}
$$

| $Z_L$ | $\rho$ | 뜻 |
|---|---|---|
| $Z_0$ | **0** | **정합** — 반사 없음 |
| **개방** ($\infty$) | **$+1$** | **전부 반사** (같은 극성) |
| **단락** ($0$) | **$-1$** | **전부 반사** (반대 극성) |

$$
\boxed{\text{개방이면 } +1, \text{ 단락이면 } -1}
$$

$$
\text{\textbf{개방이면 전압이 2배}} \;-\; V^+ + V^- = 2V^+
$$

$$
\text{\textbf{pw.4.2의 진행파}}\text{에서 본 그것}
$$

**선로 끝이 개방되면 전압이 2배**가 된다. 뇌 서지가 개폐기 끝에서 2배가 되는 이유다.

$$
\text{\textbf{투과계수}}: \tau = 1 + \rho = \dfrac{2Z_L}{Z_L+Z_0}
$$

$$
\text{\textbf{정재파비}}: \text{SWR} = \dfrac{1+|\rho|}{1-|\rho|}
$$

$$
\text{\textbf{정합이면 SWR} = 1} \;-\; \text{통신에서 쓰는 지표}
$$

## 무손실 유한장회로와 공진

$$
\text{\textbf{무손실 선로의 입력 임피던스}}
$$

$$
Z_{in} = Z_0\dfrac{Z_L + jZ_0\tan\beta l}{Z_0 + jZ_L\tan\beta l}
$$

### 특별한 길이

| 길이 | $Z_{in}$ | 성질 |
|---|---|---|
| **$\frac{\lambda}{4}$** | $\dfrac{Z_0^2}{Z_L}$ | **임피던스 변환** |
| **$\frac{\lambda}{2}$** | $Z_L$ | **그대로** |

$$
\boxed{\dfrac{\lambda}{4} \text{ 선로가 임피던스를 뒤집는다}}
$$

$$
Z_L = 0 \;(\text{단락}) \;\Longrightarrow\; Z_{in} = \infty \;(\text{\textbf{개방으로 보인다}})
$$

$$
Z_L = \infty \;(\text{개방}) \;\Longrightarrow\; Z_{in} = 0 \;(\text{\textbf{단락으로 보인다}})
$$

$$
\text{\textbf{$\frac{\lambda}{4}$ 변성기}} \;-\; \text{임피던스 정합에 쓴다}
$$

$$
Z_0 = \sqrt{Z_{in}Z_L} \;-\; \text{\textbf{기하평균}}\text{으로 정합}
$$

$$
\text{\textbf{$\frac{\lambda}{2}$ 는 원래대로}} \;-\; \text{한 바퀴 돌아온 셈}
$$

$$
\text{\textbf{공진}}: \text{선로 자체가 공진 회로가 된다} \;-\; \text{길이가 } \dfrac{\lambda}{4} \text{ 의 배수일 때}
$$

**고주파에서 선로를 소자로 쓴다.** $\frac{\lambda}{4}$ 단락 선로가 병렬 공진 회로처럼
행동한다.

## 정리

$$
\boxed{Z_0 = \sqrt{\dfrac{Z}{Y}}, \qquad \gamma = \sqrt{ZY} = \alpha + j\beta}
$$

| | 조건 | 결과 |
|---|---|---|
| **무손실** | $R = G = 0$ | $\alpha = 0$ — **안 줄어듦** |
| **무왜형** | $\frac{R}{L} = \frac{G}{C}$ | $\alpha, v$ 가 **주파수 무관** — **모양 유지** |

$$
\boxed{\text{둘 다 } Z_0 = \sqrt{\dfrac{L}{C}} \;(\text{\textbf{순저항}}), \quad v = \dfrac{1}{\sqrt{LC}}}
$$

$$
\boxed{\rho = \dfrac{Z_L - Z_0}{Z_L+Z_0}} \;-\; \text{개방 } +1, \text{ 단락 } -1, \text{ 정합 } 0
$$

$$
\text{\textbf{ct.1.1의 집중정수 근사가 깨지는 곳}} \;-\; \text{그게 이 단원의 존재 이유}
$$
