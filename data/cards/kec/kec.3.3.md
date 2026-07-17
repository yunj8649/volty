---
id: kec.3.3
title: 접지설비
status: reviewed
summary: 150/300/600 규칙이 살아남았다. 빨리 끊을수록 접지저항을 크게 허용한다.
covers:
  - kec.3.3.1
  - kec.3.3.2
formulas:
  - label: 변압기 중성점 접지저항 (KEC 142.5)
    tex: R \leq \dfrac{\mathbf{150}}{I_g}\ \mathrm{[\Omega]}
    note: '$I_g$ 는 **고압·특고압측 1선 지락전류**. 일반적인 경우.'
  - label: 완화 조건
    tex: \text{1~2초 차단} \to \dfrac{\mathbf{300}}{I_g}, \qquad \text{1초 이내 차단} \to \dfrac{\mathbf{600}}{I_g}
    note: 저압 대지전압이 **150V 초과**일 때. **빨리 끊으면 크게 허용**.
  - label: 혼촉 방지 (KEC 322.1)
    tex: \text{저압측 \textbf{중성점}}\text{에 접지} \;-\; \text{변압기 \textbf{시설장소마다}}
    note: 300V 이하면 **1단자**에 해도 된다. 어려우면 **200m**까지 이격.
  - label: 가공공동지선
    tex: \text{지름 } \mathbf{4}\ \mathrm{mm} \text{ 이상 경동선}, \quad \text{인장강도 } 5.26\ \mathrm{kN}
    note: 2 이상의 시설장소에 나눠 접지.
traps:
  - '**150/300/600**이다. 1초 이내가 600, 1~2초가 300. **빠를수록 큰 값**.'
  - '**분모가 1선 지락전류**다. 지락전류가 크면 접지저항을 작게 해야 한다.'
  - '**완화는 저압 대지전압 150V 초과**일 때만이다. 조건을 놓치면 안 된다.'
  - '**1선 지락전류는 실측값**이 원칙이다. 곤란하면 계산.'
related:
  - kec.1.5
  - pw.4.1
  - kec.3.1
---

> KEC **320** (321 고압·특고압 접지계통 · 322 혼촉에 의한 위험방지시설) 및
> **142.5·142.6** — 시행 2026. 1. 5. 기준

## 고압, 특고압 접지계통

> KEC **321**

$$
\text{\textbf{kec.1.5의 140}}\text{을 고압・특고압에 적용}
$$

$$
\text{\textbf{접지시스템의 구분}}(\text{계통・보호・피뢰})\text{은 그대로}
$$

$$
\text{\textbf{다만 전압이 높으니}} \;-\; \text{요구가 엄격}
$$

## 변압기 중성점 접지 (142.5)

$$
\boxed{R \leq \dfrac{\mathbf{150}}{I_g}\ \mathrm{[\Omega]}}
$$

$$
I_g = \text{\textbf{고압・특고압측 전로의 1선 지락전류}}
$$

$$
\text{\textbf{일반적인 경우}}
$$

### 완화 조건

$$
\textbf{저압전로의 대지전압이 } \mathbf{150} \  \mathrm{V} \text{ 를 } \textbf{초과}\text{하는 경우}
$$

$$
\boxed{
\begin{array}{l|c}
\text{\textbf{1초 초과 2초 이내}} \text{ 자동차단} & R \leq \dfrac{\mathbf{300}}{I_g} \\
\text{\textbf{1초 이내}} \text{ 자동차단} & R \leq \dfrac{\mathbf{600}}{I_g}
\end{array}
}
$$

$$
\boxed{\text{\textbf{"150 / 300 / 600"}}}
$$

$$
\text{\textbf{빨리 끊을수록 접지저항을 크게 허용}}
$$

### 왜 그런가

$$
\text{\textbf{혼촉}}\text{이 나면 저압측에 고압이 걸린다}
$$

$$
V = I_g \times R \;-\; \text{\textbf{접지저항에 걸리는 전압}}
$$

$$
\text{\textbf{그게 저압측의 대지전압 상승}}
$$

$$
R \leq \dfrac{150}{I_g} \;\Longrightarrow\; V = I_g R \leq \mathbf{150}\ \mathrm{V}
$$

$$
\boxed{\text{\textbf{150 이라는 숫자가 곧 허용 전압}}}
$$

$$
\textbf{저압측 전위를 } 150\ \mathrm{V} \text{ 이하로 잡겠다}\text{는 뜻}
$$

$$
\textbf{300이면 } 300\ \mathrm{V}, \; \text{600이면 } 600\ \mathrm{V} \text{ 까지 허용}
$$

### 왜 빠르면 높여 주나

$$
\boxed{\text{\textbf{전압 × 시간}}\text{이 위험을 정한다}}
$$

$$
\text{\textbf{kec.1.2의 "크기를 제한하거나 지속시간을 제한하거나"}}
$$

$$
\text{\textbf{1초 이내에 끊으면}} \;\Longrightarrow\; \text{\textbf{600V 라도 짧게}} \;\Longrightarrow\; \text{견딜 만}
$$

$$
\text{\textbf{안 끊으면}} \;\Longrightarrow\; \text{\textbf{150V 라도 계속}} \;\Longrightarrow\; \text{위험}
$$

$$
\text{\textbf{kec.2.2의 차단시간 표}}\text{와 같은 사상}
$$

$$
\boxed{\text{\textbf{빨리 끊는 대가로 여유를 얻는다}}}
$$

**규정의 거래**다. 차단장치에 투자하면 접지공사를 덜 해도 된다.

$$
\text{\textbf{접지저항을 낮추는 건 비싸다}} \;-\; \text{땅을 파고 접지극을 묻어야}
$$

### 1선 지락전류

$$
\boxed{\text{\textbf{실측값}}\text{에 의한다}}
$$

$$
\text{\textbf{실측이 곤란하면}} \;\Longrightarrow\; \text{\textbf{선로정수 등으로 계산}}
$$

$$
\text{\textbf{pw.4.1의 접지방식}}\text{이 } I_g \text{ 를 정한다}
$$

$$
\text{\textbf{직접접지}}: I_g \text{ 큼} \;\Longrightarrow\; R \text{ 을 \textbf{작게}} \text{ 해야}
$$

$$
\text{\textbf{비접지}}: I_g \text{ 작음} \;\Longrightarrow\; R \text{ 이 \textbf{커도} 된다}
$$

$$
\boxed{\textbf{분모가 } \text{ I} _g \text{ 라 그렇다}}
$$

$$
\textbf{우리나라 배전은 } \text{ 22.9} \  \mathrm{kV\text{-}Y} \text{ 다중접지} \;-\; I_g \text{ 가 크다}
$$

### 옛 기준과 같다

$$
\text{\textbf{옛 제2종 접지공사}}\text{가 정확히 이 식}
$$

$$
R_2 = \dfrac{150}{I_g} \;(\text{또는 } 300, 600)
$$

$$
\boxed{\text{\textbf{종별 접지는 폐지됐는데 이 식은 살아남았다}}}
$$

$$
\text{\textbf{제1종}}(10\Omega) \cdot \text{\textbf{제3종}}(100\Omega)\text{은 사라졌는데}
$$

$$
\text{\textbf{제2종의 계산식만}} \;-\; \text{142.5로 옮겨왔다}
$$

$$
\text{\textbf{왜?}} \;-\; \text{\textbf{물리에 근거}}\text{한 식이라 바꿀 이유가 없다}
$$

$$
\text{\textbf{10Ω ・ 100Ω 은 임의의 값}}\text{이었지만} \;-\; \dfrac{150}{I_g} \text{ 는 \textbf{계산된 값}}
$$

$$
\boxed{\text{\textbf{근거가 있는 규정은 살아남는다}}}
$$

## 혼촉에 의한 위험방지시설

> KEC **322**

### 혼촉이란

$$
\boxed{\text{\textbf{고압・특고압과 저압이 섞이는} 것}}
$$

$$
\text{\textbf{변압기 안에서 절연이 깨지면}} \;\Longrightarrow\; \text{\textbf{저압측에 고압이}}
$$

$$
\textbf{집 안 콘센트에 } \text{ 22.9} \  \mathrm{kV} \;-\; \text{생각만 해도 끔찍}
$$

$$
\text{\textbf{그래서 별도의 조}}\text{를 둔다}
$$

### 고압·특고압과 저압의 혼촉 (322.1)

$$
\boxed{\text{\textbf{저압측의 중성점}}\text{에 \textbf{142.5의 접지공사}}}
$$

$$
\text{\textbf{예외}}: 322.2 \text{ 의 것 및 \textbf{철도・궤도의 신호용 변압기}}
$$

$$
\text{\textbf{300V 이하}}\text{면 중성점이 어려울 때 \textbf{저압측 1단자}}\text{에 해도 된다}
$$

$$
\text{\textbf{단상 2선식}}\text{처럼 중성점이 없는 경우}
$$

### 10Ω 조건

$$
\text{\textbf{35 kV 이하 특고압}}\text{으로서 \textbf{1초 이내 자동차단}}\text{이 되는 것}
$$

$$
\text{및 } 333.32 \text{ 의 특고압 가공전선로 이외의 특고압}
$$

$$
\textbf{계산된 접지저항이 } \text{ 10} \  \Omega \text{ 을 넘으면} \;\Longrightarrow\; \boxed{10\ \Omega \text{ 이하로}}
$$

$$
\text{\textbf{상한}}\text{이 있다} \;-\; \text{계산값이 커도 } 10\Omega \text{ 을 넘으면 안 된다}
$$

$$
\textbf{600/} \text{I} _g \text{ 이 } \text{ 10} \Omega \text{ 을 넘어도} \;\Longrightarrow\; 10\Omega
$$

$$
\boxed{\text{\textbf{계산 문제의 함정}}} \;-\; \text{식만 쓰고 상한을 안 보면 틀린다}
$$

### 시설장소마다 (322.1-2)

$$
\boxed{\text{\textbf{변압기의 시설장소마다}} \text{ 시행}}
$$

$$
\text{\textbf{예외}}: \text{토지의 상황으로 접지저항을 못 얻으면}
$$

$$
\text{\textbf{가공 접지도체}}(\text{지름 } 4\ \mathrm{mm} \text{ 이상}, \; 5.26\ \mathrm{kN})\text{로}
$$

$$
\boxed{\textbf{시설장소로부터 } \mathbf{200} \  \mathrm{m} \text{ 까지 떼어놓을 수} \text{ 있다}}
$$

$$
\text{\textbf{200m}} \;-\; \text{시험 단골}
$$

$$
\text{\textbf{땅이 나쁘면 좋은 데까지 끌고 간다}} \;-\; \text{다만 200m 까지}
$$

### 가공공동지선 (322.1-3)

$$
\text{\textbf{200m로도 안 되면}} \;\Longrightarrow\; \text{\textbf{가공공동지선}}
$$

$$
\text{지름 } \mathbf{4}\ \mathrm{mm} \text{ 이상 경동선}, \quad 5.26\ \mathrm{kN}
$$

$$
\boxed{\text{\textbf{2 이상의 시설장소}}\text{에 나눠 접지}}
$$

$$
\text{\textbf{여러 곳을 묶어 합성 접지저항}}\text{을 낮춘다}
$$

$$
\text{\textbf{병렬}}\text{이니 저항이 작아진다}(\text{ct.1.2})
$$

$$
\dfrac{1}{R} = \dfrac{1}{R_1} + \dfrac{1}{R_2} + \cdots
$$

$$
\boxed{\text{\textbf{혼자 안 되면 여럿이}}}
$$

$$
\text{\textbf{kec.1.5의 공통접지・통합접지}}\text{와 같은 사상}
$$

### 혼촉방지판 (322.2)

$$
\text{\textbf{고압・특고압 권선과 저압 권선 사이에 금속판}}
$$

$$
\text{\textbf{그 판을 접지}}
$$

$$
\boxed{\text{\textbf{절연이 깨져도 판이 받아낸다}}}
$$

$$
\text{\textbf{물리적으로 막는 것}} \;-\; \text{중성점 접지와 다른 접근}
$$

$$
\text{\textbf{그래서 322.1의 예외}} \;-\; \text{이미 막았으니}
$$

$$
\text{\textbf{mc.4.1의 변압기 구조}}\text{에 판이 하나 더}
$$

### 계기용변성기의 2차측 접지 (322.4)

$$
\text{\textbf{PT・CT의 2차측}}\text{을 접지}(\text{mc.4.10})
$$

$$
\text{\textbf{고압・특고압 계기용변성기}} \;-\; \text{2차가 사람이 만지는 쪽}
$$

$$
\text{\textbf{혼촉되면 계기에 고압}} \;\Longrightarrow\; \text{접지로 막는다}
$$

$$
\text{\textbf{mc.4.10에서 "절연이 숨은 목적"}}\text{이라고 한 것}
$$

$$
\text{\textbf{그 절연이 깨질 때의 대비}}
$$

### 전로의 중성점의 접지 (322.5)

$$
\text{\textbf{계통접지}}\text{의 목적}(\text{kec.1.5})
$$

| 목적 | |
|---|---|
| **이상전압 억제** | pw.4.1 |
| **대지전압 저하** | |
| **보호계전기 동작 확보** | pw.1.6 |

$$
\text{\textbf{pw.4.1의 중성점 접지방식}}\text{이 이 조문}
$$

## 공통접지 및 통합접지 (142.6)

$$
\text{\textbf{고압・특고압과 저압의 접지극이 근접}}\text{하면}
$$

$$
\boxed{\text{\textbf{공통접지시스템}}\text{으로 할 수 있다}}
$$

$$
\text{\textbf{저압 접지극이 고압 접지극의 접지저항 형성영역에 완전히 포함}}\text{되면}
$$

$$
\text{\textbf{위험전압이 발생하지 않도록 상호 접속}}\text{하여야}
$$

$$
\boxed{\text{\textbf{어차피 섞이니 아예 묶는다}}}
$$

$$
\text{\textbf{kec.1.5에서 본 논리}} \;-\; \text{따로 하면 전위차가 생겨 오히려 위험}
$$

### 저압설비 허용 상용주파 과전압 (표 142.6-1)

$$
\text{\textbf{고압계통 지락 시 저압계통에 가해지는 과전압의 한계}}
$$

$$
\text{지락고장시간 } > 5 \text{ 초} \;\Longrightarrow\; U_0 + 250\ \mathrm{V}
$$

$$
\text{지락고장시간 } \leq 5 \text{ 초} \;\Longrightarrow\; U_0 + 1200\ \mathrm{V}
$$

$$
\boxed{\text{\textbf{또 시간이 나온다}}} \;-\; \text{빠르면 높게 허용}
$$

$$
\text{\textbf{142.5의 150/300/600}}\text{과 같은 사상}
$$

$$
\text{\textbf{규정 전체를 관통하는 원리}} \;-\; \text{전압 × 시간}
$$

## 정리

$$
\boxed{
\begin{array}{l|c}
\text{\textbf{일반}} & R \leq \dfrac{\mathbf{150}}{I_g} \\
\text{\textbf{1~2초 차단}} \;(\text{저압 대지전압} > 150\mathrm{V}) & R \leq \dfrac{\mathbf{300}}{I_g} \\
\text{\textbf{1초 이내 차단}} & R \leq \dfrac{\mathbf{600}}{I_g}
\end{array}
}
$$

$$
\text{\textbf{빨리 끊을수록 크게 허용}} \;-\; \text{전압 × 시간}
$$

$$
\boxed{\text{\textbf{150 이 곧 허용 전압}}} \;-\; V = I_gR \leq 150\ \mathrm{V}
$$

| 혼촉 대책 | |
|---|---|
| **중성점 접지** | 322.1 — **시설장소마다** |
| **200m 이격** | 땅이 나쁘면 |
| **가공공동지선** | 여럿이 나눠 (**4mm** 경동선) |
| **혼촉방지판** | 물리적으로 막기 |

$$
\textbf{종별 접지는 폐지됐는데 } \dfrac{150}{I_g} \text{ 는 살아남았다}
$$

$$
\boxed{\text{\textbf{근거가 있는 규정은 살아남는다}}}
$$
