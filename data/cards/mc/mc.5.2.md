---
id: mc.5.2
title: 유도전동기의 등가회로 및 특성
status: reviewed
summary: r₂/s 하나가 등가회로의 전부다. 거기서 전력 분배도 비례추이도 최대토크도 다 나온다.
covers:
  - mc.5.2.1
  - mc.5.2.2
  - mc.5.2.3
formulas:
  - label: 회전 시 2차 값
    tex: f_2' = s f_1, \qquad E_2' = s E_2, \qquad x_2' = s x_2
    note: '**주파수·기전력·리액턴스가 모두 s배**. 저항만 안 변한다.'
  - label: 등가 부하저항
    tex: \dfrac{r_2}{s} = r_2 + r_2\dfrac{1-s}{s}
    note: '**$r_2$ 는 동손, $r_2\frac{1-s}{s}$ 는 기계적 출력.** 이 분해가 핵심.'
  - label: 전력 분배
    tex: 'P_2 : P_{c2} : P_o = 1 : s : (1-s)'
    note: '**2차입력 : 2차동손 : 기계적출력**. mc.5.1의 속도 표와 같은 비율.'
  - label: 최대토크의 슬립
    tex: s_t = \dfrac{r_2}{\sqrt{r_1^2 + (x_1+x_2)^2}} \approx \dfrac{r_2}{x_2}
    note: '**$r_2$ 에 비례**. 비례추이의 근거.'
  - label: 비례추이
    tex: \dfrac{r_2}{s} = \dfrac{r_2 + R}{s'} \;\Longrightarrow\; s' = s\dfrac{r_2 + R}{r_2}
    note: '**$r_2$ 를 m배 하면 슬립도 m배**. 최대토크 크기는 안 변한다.'
traps:
  - '**2차 저항을 키워도 최대토크의 크기는 안 변한다.** 그 토크가 나타나는 슬립만 옮겨진다.'
  - '**P₂ : P_c2 : P_o = 1 : s : (1-s)** — 2차동손이 슬립에 비례한다. 슬립이 크면 다 열이다.'
  - '**회전하면 f₂ = sf₁**. 그래서 리액턴스도 s배가 되는데 저항은 안 변한다.'
  - '**비례추이는 토크·전류·역률·동기와트에는 되고, 2차 출력·2차 효율·2차 동손에는
    안 된다.** $\frac{r_2}{s}$ 만으로 정해지느냐가 기준.'
related:
  - mc.5.1
  - mc.5.3
  - mc.5.9
---

## 정지 시 vs 회전 시

$$
\text{\textbf{정지 시}}(s=1) \;-\; \text{변압기와 똑같다}
$$

$$
E_1 = 4.44 f_1 N_1 \phi K_{w1}, \qquad E_2 = 4.44 f_1 N_2 \phi K_{w2}
$$

**mc.4.1의 변압기 그대로**다. 1차가 2차에 유도한다.

$$
\text{\textbf{유도전동기는 회전하는 변압기}}
$$

### 회전하면 무엇이 변하나

$$
\text{상대속도} = sN_s \;\Longrightarrow\; \text{자속을 \textbf{s배 느리게} 끊는다}
$$

$$
\boxed{f_2' = s f_1, \qquad E_2' = s E_2, \qquad x_2' = s x_2}
$$

$$
\text{\textbf{주파수 ・ 기전력 ・ 리액턴스가 모두 } s \text{ 배}}
$$

$$
\textbf{저항 } \text{ r} _2 \text{ 만 안 변한다} \;-\; \text{도체의 성질이니}
$$

**이 비대칭이 유도전동기의 모든 것**을 만든다.

$$
x = 2\pi f L \;\Longrightarrow\; f \text{ 가 } s \text{ 배면 } x \text{ 도 } s \text{ 배}
$$
$$
r = \rho\dfrac{l}{A} \;\Longrightarrow\; \text{주파수와 \textbf{무관}}
$$

### 2차 전류

$$
I_2 = \dfrac{E_2'}{\sqrt{r_2^2 + x_2'^2}} = \dfrac{sE_2}{\sqrt{r_2^2 + (sx_2)^2}}
$$

**분자·분모를 $s$ 로 나누면**

$$
\boxed{I_2 = \dfrac{E_2}{\sqrt{\left(\frac{r_2}{s}\right)^2 + x_2^2}}}
$$

$$
\textbf{정지 시의 회로에서 } \text{ r} _2 \text{ 를 } \dfrac{r_2}{s} \text{ 로 바꾼 것}
$$

$$
\boxed{\textbf{회전을 } \dfrac{r_2}{s} \text{ 하나로 표현했다}}
$$

**이게 등가회로의 발상**이다. 도는 기계를 안 도는 회로로 바꾸는 대가가 저항 하나다.

## 등가 부하저항 — 핵심

$$
\boxed{\dfrac{r_2}{s} = r_2 + r_2\dfrac{1-s}{s}}
$$

**검산**

$$
r_2 + r_2\dfrac{1-s}{s} = r_2\left(1 + \dfrac{1-s}{s}\right) = r_2 \cdot \dfrac{s + 1 - s}{s} = \dfrac{r_2}{s} \;\checkmark
$$

$$
\text{\textbf{두 조각으로 쪼개진다}}
$$

| 조각 | 무엇 |
|---|---|
| $r_2$ | **2차 동손** (진짜 저항, 열) |
| $\boxed{r_2\dfrac{1-s}{s}}$ | **기계적 출력** (등가 부하저항) |

$$
\textbf{나머지 } \text{ r} _2 \dfrac{1-s}{s} \text{ 가 축에서 나오는 힘}
$$

**전기적으로는 저항인데 실제로는 기계적 출력**이다. 도는 걸 안 도는 것처럼 그렸으니,
빠져나간 에너지가 저항으로 위장한다.

$$
s = 1 \;(\text{정지}) \;\Longrightarrow\; r_2\dfrac{1-1}{1} = 0 \;\Longrightarrow\; \text{\textbf{출력 없음}} \;\checkmark
$$
$$
s \to 0 \;\Longrightarrow\; r_2\dfrac{1-s}{s} \to \infty \;\Longrightarrow\; \text{전류가 0} \;\Longrightarrow\; \text{\textbf{토크 없음}} \;\checkmark
$$

**양 끝이 맞는다.** mc.5.1의 "따라잡으면 토크 0"이 회로에서도 나온다.

## 전력 분배

$$
\boxed{P_2 : P_{c2} : P_o = 1 : s : (1-s)}
$$

| 기호 | 이름 |
|---|---|
| $P_2$ | **2차 입력** (= 동기와트) |
| $P_{c2}$ | **2차 동손** |
| $P_o$ | **기계적 출력** |

### 왜 이 비율인가

$$
P_2 = I_2^2 \dfrac{r_2}{s}, \qquad P_{c2} = I_2^2 r_2, \qquad P_o = I_2^2 r_2\dfrac{1-s}{s}
$$

**같은 $I_2^2$ 을 곱했으니 저항의 비가 곧 전력의 비**다.

$$
\dfrac{r_2}{s} : r_2 : r_2\dfrac{1-s}{s} = \dfrac{1}{s} : 1 : \dfrac{1-s}{s}
$$

$s$ 를 곱하면

$$
\boxed{1 : s : (1-s)}
$$

$$
\text{\textbf{mc.5.1의 속도 표와 같은 숫자}}
$$

| | 동기속도 | 상대속도 | 실제속도 |
|---|---|---|---|
| 속도 | 1 | $s$ | $1-s$ |
| **전력** | **$P_2$** | **$P_{c2}$** | **$P_o$** |

$$
\text{\textbf{우연이 아니다}} \;-\; \text{에너지가 속도에 비례해 갈린다}
$$

**회전자계의 속도로 전부 들어오고, 미끄러진 만큼($s$)이 열이 되고, 실제로 돈 만큼
($1-s$)이 일이 된다.**

### 중요한 따름정리

$$
\boxed{P_{c2} = s P_2} \;-\; \text{\textbf{2차 동손은 슬립에 비례}}
$$

$$
\boxed{P_o = (1-s)P_2}
$$

$$
\boxed{\eta_2 = \dfrac{P_o}{P_2} = 1 - s = \dfrac{N}{N_s}} \;-\; \text{\textbf{2차 효율}}
$$

$$
\text{\textbf{$N/N_s$ 형태도 기억해 둔다}} \;-\; N = (1-s)N_s \text{ 니 같은 말}
$$

$$
\text{\textbf{2차 효율 = 속도비}} \;-\; \text{"얼마나 따라잡았나"가 곧 효율}
$$

$$
\text{\textbf{슬립이 곧 손실률}}
$$

$$
s = 0.05 \;\Longrightarrow\; \text{2차 효율 } 95\%
$$

**슬립이 크면 다 열이다.** 이게 mc.5.4에서 **2차 저항 제어가 비효율적**인 이유다.

$$
s = 0.5 \text{ 로 속도를 낮추면} \;\Longrightarrow\; \text{입력의 \textbf{절반이 회전자에서 열}}
$$

### 동기와트

$$
\boxed{P_2 = \text{\textbf{동기와트}} = \text{토크를 전력 단위로}}
$$

$$
T = \dfrac{P_o}{\omega} = \dfrac{(1-s)P_2}{(1-s)\omega_s} = \dfrac{P_2}{\omega_s}
$$

$$
\text{\textbf{$(1-s)$ 가 약분된다}} \;\Longrightarrow\; T \propto P_2
$$

$$
\text{\textbf{2차 입력이 곧 토크}} \;-\; \text{동기속도가 상수니 가능한 표현}
$$

**mc.2.7의 동기전동기에서 본 그것**과 같은 발상이다. 속도가 상수면 토크와 전력이
비례한다.

$$
T = 0.975\dfrac{P_2}{N_s}\ \mathrm{[kg \cdot m]}
$$

**분모가 $N_s$ 지 $N$ 이 아니다.** 동기와트니까.

## 유도전동기의 특성

$$
T \propto \dfrac{s E_2^2 r_2}{r_2^2 + (sx_2)^2}
$$

### 슬립에 따른 모양

$$
\text{\textbf{작은 } s} \;\Longrightarrow\; (sx_2)^2 \lll r_2^2 \;\Longrightarrow\; T \approx \dfrac{sE_2^2}{r_2} \;\Longrightarrow\; \boxed{T \propto s}
$$

$$
\text{\textbf{큰 } s} \;\Longrightarrow\; (sx_2)^2 \ggg r_2^2 \;\Longrightarrow\; T \approx \dfrac{E_2^2 r_2}{s x_2^2} \;\Longrightarrow\; \boxed{T \propto \dfrac{1}{s}}
$$

$$
\text{\textbf{올라갔다 내려온다}} \;\Longrightarrow\; \text{\textbf{어딘가에 최대}}
$$

### 최대토크

$$
\boxed{s_t = \dfrac{r_2}{\sqrt{r_1^2 + (x_1 + x_2)^2}} \approx \dfrac{r_2}{x_2}}
$$

$$
\boxed{T_{max} = \dfrac{E_2^2}{2(x_1 + x_2)} \quad(\text{\textbf{$r_2$ 와 무관!}})}
$$

$$
\textbf{최대토크의 크기는 } \text{ r} _2 \text{ 와 관계없다}
$$

**이게 결정적**이다. 2차 저항을 아무리 바꿔도 **최대토크의 크기는 그대로**고, **그게
나타나는 슬립만** 옮겨진다.

$$
\text{\textbf{산의 높이는 같고 위치만 옮겨진다}}
$$

$$
T_{max} \propto E_2^2 \;\Longrightarrow\; T \propto V^2 \;-\; \text{\textbf{전압의 제곱}}
$$

**전압이 10% 떨어지면 토크가 19% 떨어진다.** 유도전동기가 전압 강하에 약한 이유다.

## 비례추이

$$
\boxed{\dfrac{r_2}{s} = \dfrac{r_2 + R}{s'} \;\Longrightarrow\; s' = s\,\dfrac{r_2 + R}{r_2}}
$$

$$
\text{\textbf{$r_2$ 를 $m$ 배 하면 슬립도 $m$ 배}}
$$

### 왜 되나

$$
\text{토크는 } \dfrac{r_2}{s} \text{ 의 \textbf{함수}}
$$

$$
\dfrac{r_2}{s} \text{ 가 같으면 \textbf{같은 토크, 같은 전류}}
$$

$$
r_2 \to 2r_2, \; s \to 2s \;\Longrightarrow\; \dfrac{2r_2}{2s} = \dfrac{r_2}{s} \;\Longrightarrow\; \text{\textbf{똑같은 상태}}
$$

**등가회로에 $r_2$ 와 $s$ 가 항상 짝으로 나타나기 때문**이다. 둘을 같은 비율로 키우면
회로가 못 알아챈다.

$$
\boxed{\text{\textbf{비례추이} = } r_2 \text{ 와 } s \text{ 가 } \dfrac{r_2}{s} \text{ 로만 등장하는 것의 귀결}}
$$

### 무엇에 되고 무엇에 안 되나

| 비례추이 **되는 것** | **안 되는 것** |
|---|---|
| **토크** | **2차 출력** |
| **1차 전류** | **2차 효율** |
| **2차 전류** | **2차 동손** |
| **역률** | |
| **동기와트**(2차 입력) | |

$$
\boxed{\frac{r_2}{s} \text{ 만으로 정해지는 건 되고, } r_2 \text{ 나 } s \text{ 가 } \textbf{따로} \text{ 들어가면 안 된다}}
$$

**하나씩 확인해 보면 규칙이 보인다.** $r_2 \to 2r_2$, $s \to 2s$ 로 바꿔 보자.
$I_2$ 는 $\frac{r_2}{s}$ 로만 정해지니 **안 변한다.**

| 양 | 식 | $r_2, s$ 를 2배 하면 |
|---|---|---|
| **동기와트** | $I_2^2 \dfrac{r_2}{s}$ | $\frac{r_2}{s}$ 그대로 → **안 변함** ✓ |
| **2차 동손** | $I_2^2 \, r_2$ | $r_2$ 가 **따로** → **2배** ✗ |
| **2차 출력** | $I_2^2 \, r_2\dfrac{1-s}{s}$ | $(1-s)$ 가 **따로** → **변함** ✗ |
| **2차 효율** | $1 - s$ | $s$ 가 **따로** → **변함** ✗ |

$$
\text{\textbf{동기와트는 된다}} \;-\; \dfrac{r_2}{s} \text{ 만 들어 있으니}
$$

**당연해야 한다.** $T = \frac{P_2}{\omega_s}$ 이고 $\omega_s$ 는 상수니, **토크가
비례추이 되면 동기와트도 반드시 된다.** 둘은 같은 것의 다른 이름이다.

$$
\text{\textbf{2차 동손이 안 되는 게 핵심}} \;-\; r_2 \text{ 가 맨몸으로 등장}
$$

$$
P_{c2} = sP_2 \;\Longrightarrow\; P_2 \text{ 는 같은데 } s \text{ 가 커짐} \;\Longrightarrow\; \text{\textbf{동손이 커진다}}
$$

**슬립을 옮기면 효율이 나빠진다.** 같은 토크를 내지만 더 많이 미끄러지니 더 많이
열이 난다.

$$
\text{\textbf{공짜가 아니다}} \;-\; \text{기동토크를 얻는 대가로 효율을 낸다}
$$

### 어디에 쓰나

$$
\boxed{\text{\textbf{권선형}}\text{에서 기동토크를 최대로}}
$$

$$
s_t = \dfrac{r_2 + R}{x_2} = 1 \;\Longrightarrow\; R = x_2 - r_2
$$

$$
\text{\textbf{기동 순간}}(s=1)\text{에 \textbf{최대토크}}\text{가 나오게}
$$

**기동할 때 최대토크**를 내고, 속도가 오르면 저항을 단계적으로 빼서 효율을 회복한다.

$$
\text{mc.1.8의 \textbf{직류기 기동저항}}\text{과 같은 발상} \;-\; \text{쓰고 나서 뺀다}
$$

**농형은 이걸 못 한다.** 회전자가 단락되어 있어 저항을 넣을 방법이 없다. 그래서
mc.5.5의 **2중 농형·디프슬롯**이라는 우회로가 나왔다.

## 등가회로

$$
\text{\textbf{변압기 등가회로}}(\text{mc.4.2})\text{에 } \dfrac{r_2}{s} \text{ 만 넣으면 된다}
$$

| 요소 | |
|---|---|
| $r_1, x_1$ | 1차 (직렬) |
| $g_0, b_0$ | **여자** (병렬) |
| $r_2'/s, x_2'$ | **2차 환산** (직렬) |

$$
\text{2차를 1차로 환산: } r_2' = a^2 r_2, \quad a = \dfrac{N_1 K_{w1}}{N_2 K_{w2}}
$$

**권선계수까지 포함**된 권수비다. 변압기와 달리 분포권을 쓰니까(mc.2.2).

### 여자전류가 크다

$$
I_0 \approx 30 \sim 50\% \text{ of } I_n \;-\; \textbf{변압기의 2} \% \textbf{와 비교하면 엄청나다}
$$

$$
\text{\textbf{공극}}\text{ 때문이다}(\text{mc.5.1})
$$

$$
\text{공극의 자기저항} \;\Longrightarrow\; \text{자화전류 큼} \;\Longrightarrow\; \text{\textbf{역률 나쁨}}
$$

$$
\text{\textbf{간이 등가회로를 쓰면 오차가 크다}} \;-\; \text{변압기와 다른 점}
$$

## 벡터도

$$
V_1 = E_1 + I_1(r_1 + jx_1)
$$

$$
I_1 = I_0 + I_2'
$$

$$
\text{\textbf{$I_0$ 가 크니} } I_1 \text{ 과 } I_2' \text{ 의 차이가 크다}
$$

**변압기 벡터도와 같은 구조**인데 $I_0$ 가 훨씬 크게 그려진다.

$$
\text{\textbf{역률이 나쁘다}} \;-\; \text{무부하 } 0.2, \text{ 전부하 } 0.8 \text{ 정도}
$$

**무부하로 돌리면 역률이 형편없다.** 공장에서 전동기를 놀리면 안 되는 이유다.

$$
\text{pw.2.6의 \textbf{역률 개선}}\text{이 필요한 최대 원인이 유도전동기}
$$

## 정리

$$
\boxed{\dfrac{r_2}{s} = r_2 + r_2\dfrac{1-s}{s} \;-\; \text{동손 + 기계적 출력}}
$$

$$
\boxed{P_2 : P_{c2} : P_o = 1 : s : (1-s)}
$$

$$
\boxed{s_t \propto r_2 \quad\text{인데}\quad T_{max} \text{ 는 } r_2 \text{ 와 무관}}
$$

**세 상자가 서로를 설명한다.** $\frac{r_2}{s}$ 를 쪼개면 전력 분배가 나오고, 전력
분배에서 $1:s:(1-s)$ 가 나오고, $\frac{r_2}{s}$ 가 짝으로만 등장한다는 사실에서
비례추이가 나온다.

$$
\text{\textbf{$\dfrac{r_2}{s}$ 하나가 유도전동기의 전부}}
$$
