---
id: mc.4.3
title: 전압강하 및 전압변동률
status: reviewed
summary: ε = p cosθ + q sinθ 하나면 된다. 진상이면 뒤 항의 부호가 바뀐다.
covers:
  - mc.4.3.1
  - mc.4.3.2
formulas:
  - label: 전압변동률
    tex: \varepsilon = \dfrac{V_{20} - V_{2n}}{V_{2n}} \times 100 = p\cos\theta + q\sin\theta\ \mathrm{[\%]}
    note: '**진상이면 $-q\sin\theta$.** 2차 기준이 표준.'
  - label: '%저항강하 · %리액턴스강하'
    tex: p = \dfrac{I_{2n}r_{21}}{V_{2n}} \times 100, \qquad q = \dfrac{I_{2n}x_{21}}{V_{2n}} \times 100
    note: $p$ 는 **임피던스 와트 / 정격용량**으로도 구한다.
  - label: '%임피던스강하'
    tex: '\%Z = \sqrt{p^2 + q^2} = \dfrac{V_s}{V_{1n}} \times 100'
    note: '**임피던스 전압 $V_s$ 의 백분율**. 단락전류·병렬운전에 다 쓰인다.'
  - label: 최대 전압변동률
    tex: \varepsilon_{max} = \sqrt{p^2 + q^2} = \%Z \quad\text{일 때}\quad \cos\theta = \dfrac{p}{\sqrt{p^2+q^2}}
    note: '**역률 1이 최대가 아니다.** 역률 1이면 $\varepsilon = p$ 일 뿐.'
traps:
  - '**$\varepsilon = p\cos\theta + q\sin\theta$ — 진상이면 뒤 항이 음수**다. 그래서
    전압변동률이 음수가 될 수 있다.'
  - '**최대 전압변동률은 역률 1일 때가 아니다.** $\cos\theta = p/\sqrt{p^2+q^2}$ 일 때
    $\varepsilon_{max} = \%Z$.'
  - '**임피던스 전압**은 단락 상태에서 **정격전류**를 흘리는 데 필요한 전압이다.
    정격전압이 아니다.'
  - '**임피던스 와트 = 동손**이다. 임피던스 전압을 걸었을 때의 전력.'
related:
  - mc.4.2
  - mc.4.6
  - mc.4.9
---

## 전압강하

$$
\text{\textbf{누설 리액턴스와 권선 저항}이 전압을 깎는다}
$$

$$
V_1 = V_2' + I_2'(r_{21} + jx_{21})
$$

**mc.4.2의 등가회로**에서 직렬 임피던스가 하는 일이다. 부하 전류가 흐르면 그만큼
전압이 떨어진다.

$$
\text{부하} \uparrow \;\Longrightarrow\; I \uparrow \;\Longrightarrow\; \text{강하} \uparrow \;\Longrightarrow\; V_2 \downarrow
$$

**pw.2.4의 송전선 전압강하**와 같은 구조다. 임피던스가 있으면 전압이 떨어진다.

## 백분율로 표현한다

$$
\boxed{p = \dfrac{I_{2n}r_{21}}{V_{2n}} \times 100 \quad(\% \text{저항강하})}
$$

$$
\boxed{q = \dfrac{I_{2n}x_{21}}{V_{2n}} \times 100 \quad(\% \text{리액턴스강하})}
$$

$$
\boxed{\%Z = \dfrac{I_{2n}Z_{21}}{V_{2n}} \times 100 = \sqrt{p^2 + q^2}}
$$

### 왜 백분율인가

$$
\textbf{정격전류가 흐를 때 정격전압의 몇 } \% \text{가 깎이나}
$$

**기기의 크기와 무관하게 비교**할 수 있다. $1000\ \mathrm{kVA}$ 든 $10\ \mathrm{kVA}$ 든
%Z가 5%면 같은 성격이다.

$$
\text{pw.3.4의 } \% \textbf{임피던스법}\text{과 같은 발상}
$$

단락전류 계산도 병렬운전 조건도 전부 %Z로 한다. **변압기의 성격을 나타내는 대표
숫자**다.

$$
\text{배전용 변압기 } \%Z \approx 2 \sim 6\%
$$

### $p$ 를 구하는 다른 길

$$
\boxed{p = \dfrac{\text{임피던스 와트}\ \mathrm{[W]}}{\text{변압기 정격용량}\ \mathrm{[VA]}} \times 100}
$$

$$
p = \dfrac{I_{2n}r_{21}}{V_{2n}} = \dfrac{I_{2n}^2 r_{21}}{V_{2n}I_{2n}} = \dfrac{\text{동손}}{\text{정격용량}}
$$

**분자·분모에 $I_{2n}$ 을 곱했을 뿐**이다. 그러면 분자가 동손(임피던스 와트), 분모가
정격용량이 된다.

$$
\text{\textbf{시험 성적서에 동손과 용량이 주어지면} 바로 } p \text{ 가 나온다}
$$

## 임피던스 전압과 임피던스 와트

$$
\boxed{\text{\textbf{임피던스 전압} } V_s = \text{2차를 \textbf{단락}하고 \textbf{정격전류}를 흘리는 데 필요한 1차 전압}}
$$

$$
V_s = I_{1n}Z_{12}\ \mathrm{[V]}
$$

$$
\boxed{\text{\textbf{임피던스 와트} } P_s = \text{그때의 \textbf{전력}} = \textbf{동손}}
$$

### 왜 이런 걸 정의하나

$$
\text{\textbf{단락 시험}}(\text{mc.4.9})\text{에서 직접 재는 값이라서}
$$

2차를 단락하고 1차 전압을 **0부터 서서히 올린다.** 정격전류가 흐르는 순간 멈추고
전압과 전력을 읽는다.

$$
\text{그 전압} = V_s, \qquad \text{그 전력} = P_s = \text{\textbf{동손}}
$$

$$
\%Z = \dfrac{V_s}{V_{1n}} \times 100
$$

**임피던스 전압이 정격전압의 몇 %인가**가 곧 %Z다.

$$
\text{$V_s$ 는 정격전압의 \textbf{수 \%}}\text{에 불과} \;-\; \text{단락이라 조금만 걸어도 정격전류가 흐른다}
$$

**철손이 거의 안 생기는 이유**가 이것이다. 전압이 낮으니 자속이 작고, 그래서 단락
시험에서는 **동손만** 잡힌다.

$$
\text{\textbf{무부하 시험}: 정격전압 → 철손} \qquad / \qquad \text{\textbf{단락 시험}: 정격전류 → 동손}
$$

## 전압변동률의 계산

$$
\boxed{\varepsilon = \dfrac{V_{20} - V_{2n}}{V_{2n}} \times 100\ \mathrm{[\%]}}
$$

$V_{20}$ 무부하 2차 전압, $V_{2n}$ 정격(전부하) 2차 전압이다. **2차 기준이 표준**이다.

$$
\text{부하를 걸면 전압이 \textbf{얼마나 떨어지나}}
$$

### 실용 공식

$$
\boxed{\varepsilon = p\cos\theta + q\sin\theta\ \mathrm{[\%]} \quad(\text{지상})}
$$

$$
\boxed{\varepsilon = p\cos\theta - q\sin\theta\ \mathrm{[\%]} \quad(\text{\textbf{진상}})}
$$

$$
\text{\textbf{진상이면 뒤 항의 부호가 바뀐다}}
$$

**시험 단골**이다. 진상이면 $q\sin\theta$ 가 빠지니 $\varepsilon$ 이 작아지고, 심하면
**음수**가 된다.

$$
\text{진상 부하} \;\Longrightarrow\; \varepsilon < 0 \;\Longrightarrow\; \text{부하를 걸었더니 전압이 \textbf{올라간다}}
$$

**pw.2.5의 페란티**, **mc.2.5의 동기발전기**와 같은 현상이다. 진상은 어디서나 전압을
올린다.

### 어디서 나오나

벡터도에서 $V_1$ 과 $V_2'$ 의 크기 차이를 구하면

$$
V_1 \approx V_2' + I(r\cos\theta + x\sin\theta)
$$

$$
\varepsilon = \dfrac{V_1 - V_2'}{V_2'} = \dfrac{I r\cos\theta}{V_2'} + \dfrac{I x \sin\theta}{V_2'} = p\cos\theta + q\sin\theta
$$

**$p$ 와 $q$ 의 정의를 그대로 넣은 것**이다. 근사식인데(벡터의 크기 차이를 실수부
차이로 봤다) 오차가 매우 작다.

$$
\text{정확한 식: } \varepsilon = \sqrt{(V_2' + Ir\cos\theta + Ix\sin\theta)^2 + (Ix\cos\theta - Ir\sin\theta)^2} - V_2'
$$

**시험에서는 근사식만 쓴다.**

## 최대 전압변동률

$$
\boxed{\varepsilon_{max} = \sqrt{p^2 + q^2} = \%Z}
$$

$$
\text{그때의 역률: } \boxed{\cos\theta = \dfrac{p}{\sqrt{p^2 + q^2}}}
$$

### 왜 역률 1이 아닌가

$$
\varepsilon = p\cos\theta + q\sin\theta
$$

**두 항의 합**이다. $\cos\theta = 1$ 이면 $\sin\theta = 0$ 이라

$$
\cos\theta = 1 \;\Longrightarrow\; \varepsilon = p \quad(\text{$q$ 항이 \textbf{통째로 사라진다}})
$$

**$q$ 를 버리는 게 최대일 리 없다.** 보통 $q > p$ 인데(리액턴스가 저항보다 크다),
그 큰 항을 안 쓰는 셈이다.

$$
\text{\textbf{둘을 적당히 섞어야} 최대}
$$

### 유도

$$
\varepsilon = p\cos\theta + q\sin\theta = \sqrt{p^2+q^2}\,\sin(\theta + \alpha), \quad \tan\alpha = \dfrac{p}{q}
$$

**삼각함수의 합성**이다. 최대는 $\sin = 1$ 일 때

$$
\varepsilon_{max} = \sqrt{p^2 + q^2} = \%Z
$$

$$
\theta + \alpha = 90° \;\Longrightarrow\; \cos\theta = \sin\alpha = \dfrac{p}{\sqrt{p^2+q^2}}
$$

$$
\boxed{\text{최대 전압변동률} = \%Z} \;-\; \text{외우기 쉽다}
$$

**%Z가 곧 전압변동률의 한계**다. %Z가 5%면 어떤 역률에서도 5%를 못 넘는다.

$$
\% \text{Z가 } \textbf{변압기의 성격}\text{인 이유가 하나 더}
$$

### 예

$p = 3\%$, $q = 4\%$ 라면

$$
\%Z = \sqrt{3^2 + 4^2} = 5\%
$$

| 역률 | $\varepsilon$ |
|---|---|
| $\cos\theta = 1$ | $3 \times 1 + 4 \times 0 = \mathbf{3\%}$ |
| $\cos\theta = 0.8$ **지상** | $3(0.8) + 4(0.6) = \mathbf{4.8\%}$ |
| $\cos\theta = 0.6$ **지상** | $3(0.6) + 4(0.8) = \mathbf{5.0\%}$ ← **최대** |
| $\cos\theta = 0.8$ **진상** | $3(0.8) - 4(0.6) = \mathbf{0\%}$ |

$$
\cos\theta = \dfrac{p}{\%Z} = \dfrac{3}{5} = 0.6 \;\Longrightarrow\; \varepsilon_{max} = 5\% = \%Z
$$

**딱 맞는다.** 그리고 **진상 0.8에서 $\varepsilon = 0$** 이 되는 것도 보인다.

## %Z가 크면 · 작으면

| | **%Z 큼** | **%Z 작음** |
|---|---|---|
| **전압변동률** | **크다** | **작다** |
| **단락전류** | **작다** | **크다** |
| 차단기 용량 | 작아도 됨 | **커야 함** |
| 계통 안정도 | 나쁨 | 좋음 |

$$
I_s = \dfrac{100}{\%Z}I_n
$$

$$
\boxed{\% \text{Z} \downarrow \;\Longrightarrow\; \text{전압은 안정한데 \textbf{단락전류가 커진다}}}
$$

**mc.2.4의 단락비와 똑같은 거래**다. 거기서도 $x_s$ 가 작으면 안정도가 좋은 대신
단락전류가 컸다.

$$
\text{\textbf{전압 품질} } \longleftrightarrow \text{ \textbf{단락 용량}}
$$

**둘 다 가질 수 없다.** 그래서 %Z를 적당히(2~6%) 설계하고, 부족하면 **한류 리액터**로
단락전류를 잡는다(pw.3.4).

## 정리

$$
\boxed{\varepsilon = p\cos\theta + q\sin\theta \quad(\text{진상이면 } -q\sin\theta)}
$$

$$
\boxed{\varepsilon_{max} = \sqrt{p^2+q^2} = \%Z \quad\text{at}\quad \cos\theta = \dfrac{p}{\%Z}}
$$

| 값 | 어디서 재나 | 무엇 |
|---|---|---|
| $p$ | **단락 시험** | 동손 / 정격용량 |
| $q$ | **단락 시험** | $\sqrt{\%Z^2 - p^2}$ |
| $\%Z$ | **단락 시험** | $V_s / V_{1n}$ |

**전부 단락 시험 하나에서 나온다**(mc.4.9). 임피던스 전압과 임피던스 와트를 재면
$p$, $q$, $\%Z$, 전압변동률, 단락전류가 다 계산된다.
