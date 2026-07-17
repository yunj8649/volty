---
id: kec.1.4
title: 전로의 절연
status: reviewed
summary: 절연저항은 기술기준 제52조, 절연내력은 KEC 표 132-1이다. 두 문서에 나뉘어 있다.
covers:
  - kec.1.4.1
  - kec.1.4.2
  - kec.1.4.3
  - kec.1.4.4
  - kec.1.4.5
  - kec.1.4.6
formulas:
  - label: 저압 절연저항 (기술기준 제52조)
    tex: \text{SELV・PELV } \mathbf{0.5}\ \mathrm{M\Omega} \;/\; \text{FELV 포함 } 500\mathrm{V} \text{ 이하 } \mathbf{1.0} \;/\; 500\mathrm{V} \text{ 초과 } \mathbf{1.0}
    note: DC 시험전압 **250 / 500 / 1000 V**. 옛 0.1MΩ 은 폐지.
  - label: 누설전류 대체 (KEC 132-1)
    tex: \text{저항성분 누설전류 } \mathbf{1}\ \mathrm{mA} \text{ 이하면 적합}
    note: 정전이 어려워 절연저항을 못 잴 때.
  - label: 절연내력 시험 (KEC 표 132-1)
    tex: 7\mathrm{kV} \text{ 이하 } \mathbf{1.5} \text{ 배}, \quad 7\sim60\mathrm{kV} \; \mathbf{1.25} \text{ 배}, \quad 60\mathrm{kV} \text{ 초과 직접접지 } \mathbf{0.72} \text{ 배}
    note: '**연속 10분**. 케이블 교류 전로는 **직류 2배**로 대체 가능.'
  - label: 다중접지 중성점
    tex: 7 \sim 25\ \mathrm{kV} \text{ 중성점 다중접지식} \;\Longrightarrow\; \mathbf{0.92} \text{ 배}
    note: 배수가 **1보다 작다**. 접지가 잘 되어 있으니.
traps:
  - '**절연저항은 기술기준 제52조, 절연내력은 KEC 132**다. 두 문서에 나뉘어 있다.'
  - '**옛 0.1MΩ(대지전압 150V 이하)은 폐지**되었다. 지금은 0.5MΩ이 최소.'
  - '**직접접지식일수록 배수가 작다**(0.72, 0.64). 접지가 이상전압을 억제하니.'
  - '**절연내력 시험은 연속 10분**이다. 케이블 교류 전로면 직류 2배로 대신할 수 있다.'
related:
  - kec.1.1
  - pw.4.1
  - pw.4.2
---

> **절연저항**은 **전기설비기술기준 고시** 제52조 (기후에너지환경부고시 제2025-018호,
> 시행 2025. 10. 1.)
> **절연내력**은 **KEC** 130 (시행 2026. 1. 5.)
>
> **두 문서에 나뉘어 있다.** KEC 132-1이 "기술기준 제52조를 충족하여야 한다"고
> **위임**한다.

## 전로의 절연

> KEC **131**

$$
\boxed{\text{\textbf{전로는 대지로부터 절연}}\text{되어야 한다}}
$$

$$
\text{\textbf{예외}}\text{가 있다} \;-\; \text{\textbf{접지를 해야 하는 곳}}
$$

| 절연하지 않는 것 | 왜 |
|---|---|
| **계통접지** 하는 중성점 | **접지가 목적**이니 (kec.1.5) |
| **피뢰기** 접지측 | 뇌전류를 흘려야 |
| **시험용 전로** | |
| 전기로·전기욕기 등 | 구조상 부득이 |

$$
\text{\textbf{절연이 원칙, 접지가 예외}} \;-\; \text{목적이 있으면 접지한다}
$$

$$
\text{\textbf{pw.4.1의 중성점 접지}}\text{가 그 예외}
$$

## 전로의 절연저항 및 절연내력

> 절연저항 = **기술기준 제52조** · 절연내력 = **KEC 132**

### 절연저항 (기술기준 제52조)

$$
\boxed{
\begin{array}{l|c|c}
\text{\textbf{전로의 사용전압}} & \text{\textbf{DC 시험전압}} & \text{\textbf{절연저항}} \\ \hline
\textbf{SELV 및 PELV} & \mathbf{250}\ \mathrm{V} & \mathbf{0.5}\ \mathrm{M\Omega} \\
\textbf{FELV 포함 } 500\mathrm{V} \text{ 이하} & \mathbf{500}\ \mathrm{V} & \mathbf{1.0}\ \mathrm{M\Omega} \\
\mathbf{500}\ \mathrm{V} \text{ 초과} & \mathbf{1{,}000}\ \mathrm{V} & \mathbf{1.0}\ \mathrm{M\Omega}
\end{array}
}
$$

$$
\text{\textbf{개폐기 또는 과전류차단기로 구분할 수 있는 전로마다}}
$$

### 옛 기준과 다르다

| | **옛 판단기준** | **기술기준 제52조** |
|---|---|---|
| 대지전압 $150\ \mathrm{V}$ 이하 | **$0.1\ \mathrm{M\Omega}$** | **폐지** |
| $150 \sim 300\ \mathrm{V}$ | $0.2\ \mathrm{M\Omega}$ | **폐지** |
| $300\ \mathrm{V}$ 초과 | $0.4\ \mathrm{M\Omega}$ | **폐지** |
| **최소값** | $0.1\ \mathrm{M\Omega}$ | **$0.5\ \mathrm{M\Omega}$** |

$$
\boxed{\text{\textbf{0.1MΩ 은 이제 없다}}}
$$

$$
\text{\textbf{기준이 대지전압에서 특별저압 여부로}}\text{ 바뀌었다}
$$

$$
\text{\textbf{훨씬 엄격해졌다}} \;-\; \text{최소가 5배}
$$

### 왜 SELV·PELV가 더 낮나

$$
\text{\textbf{특별저압}}\text{은 애초에 위험이 작다}(\text{kec.2.2})
$$

$$
\text{교류 } 50\ \mathrm{V}, \text{ 직류 } 120\ \mathrm{V} \text{ 이하}
$$

$$
\text{\textbf{그러니 절연 요구도 낮게}} \;-\; 0.5\ \mathrm{M\Omega}
$$

$$
\text{\textbf{시험전압도 낮게}} \;-\; 250\ \mathrm{V}
$$

$$
\text{\textbf{높은 시험전압을 걸면 오히려 기기가 상한다}}
$$

### SPD가 있으면

$$
\text{\textbf{측정 전에 분리}}\text{해야 한다}
$$

$$
\text{\textbf{SPD}}\text{가 시험전압에 반응해 \textbf{도통}}\text{하니}
$$

$$
\text{\textbf{분리가 어려우면}} \;\Longrightarrow\; \text{시험전압을 } \mathbf{250}\ \mathrm{V} \text{ 로 낮추되 } \mathbf{1}\ \mathrm{M\Omega} \text{ 이상}
$$

$$
\boxed{\text{\textbf{전압을 낮추는 대신 기준을 올린다}}}
$$

$$
\text{\textbf{원문의 단서}} \;-\; \text{놓치기 쉽다}
$$

**mc.7.4의 SPD**가 여기서 측정을 방해한다. 서지에 반응하라고 단 건데, 절연저항계의
전압에도 반응한다.

### 누설전류로 대신 (KEC 132-1)

$$
\boxed{\text{\textbf{저항성분 누설전류} } \mathbf{1}\ \mathrm{mA} \text{ 이하면 적합}}
$$

$$
\text{\textbf{정전이 어려운 경우}} \;-\; \text{절연저항 측정이 곤란할 때}
$$

$$
\text{\textbf{살아 있는 채로 잰다}} \;-\; \text{클램프식 누설전류계}
$$

$$
\text{\textbf{저항성분}}\text{만} \;-\; \text{용량성분}(\text{정전용량 때문에 늘 흐르는 것})\text{은 뺀다}
$$

$$
\text{\textbf{정상적인 대지 정전용량}}\text{으로도 전류가 흐른다}(\text{pw.2.3})
$$

$$
\text{\textbf{그건 절연 불량이 아니다}} \;-\; \text{그래서 저항성분만 본다}
$$

**실무에서 매우 중요**하다. 24시간 돌아가는 공장은 정전을 못 시킨다.

### 절연내력 (KEC 132-2)

$$
\boxed{\textbf{시험전압을 전로와 대지 사이에 연속 } \mathbf{10} \  \text{분}}
$$

$$
\text{\textbf{다심케이블}}\text{은 \textbf{심선 상호 간}}\text{ 및 심선-대지}
$$

$$
\text{\textbf{예외}}: \text{케이블 \textbf{교류} 전로는 \textbf{직류 2배}}\text{로 10분}
$$

$$
\text{\textbf{절연저항은 "얼마나 안 새나", 절연내력은 "얼마나 버티나"}}
$$

| | 무엇 | 어떻게 |
|---|---|---|
| **절연저항** | **평소 새는 정도** | 낮은 DC로 |
| **절연내력** | **이상전압에 견디나** | **높은 전압으로 10분** |

$$
\text{\textbf{절연내력 시험은 파괴 시험에 가깝다}} \;-\; \text{약하면 뚫린다}
$$

### 표 132-1 — 시험전압

$$
\boxed{
\begin{array}{l|c}
\textbf{1. } \text{ 7} \  \mathrm{kV} \text{ 이하} & \text{최대사용전압} \times \mathbf{1.5} \\
\textbf{2. } \text{ 7 } \sim \text{ 25} \  \mathrm{kV} \text{ 중성점 다중접지식} & \times \mathbf{0.92} \\
\textbf{3. } \text{ 7 } \sim \text{ 60} \  \mathrm{kV} & \times \mathbf{1.25} \;(\text{최저 } 10.5\ \mathrm{kV}) \\
\textbf{4. } \text{ 60} \  \mathrm{kV} \text{ 초과 비접지식} & \times \mathbf{1.25} \\
\textbf{5. } \text{ 60} \  \mathrm{kV} \text{ 초과 접지식} & \times \mathbf{1.1} \;(\text{최저 } 75\ \mathrm{kV}) \\
\textbf{6. } \text{ 60} \  \mathrm{kV} \text{ 초과 } \textbf{직접} \text{접지식} & \times \mathbf{0.72} \\
\textbf{7. } \text{ 170} \  \mathrm{kV} \text{ 초과 직접접지}(\text{발・변전소}) & \times \mathbf{0.64}
\end{array}
}
$$

$$
\text{\textbf{"1.5 / 0.92 / 1.25 / 1.25 / 1.1 / 0.72 / 0.64"}}
$$

### 왜 접지식이 배수가 작나

$$
\boxed{\text{\textbf{접지가 이상전압을 억제한다}}}
$$

$$
\text{\textbf{pw.4.1에서 본 그것}}
$$

$$
\text{\textbf{비접지}}: \text{1선 지락 시 건전상 전압이 } \sqrt{3} \text{ 배로} \;\Longrightarrow\; \text{\textbf{절연을 세게}}
$$

$$
\text{\textbf{직접접지}}: \text{건전상 전압 상승이 \textbf{거의 없다}} \;\Longrightarrow\; \text{\textbf{절연을 낮춰도} 된다}
$$

$$
\boxed{\text{\textbf{단절연}}\text{이 가능한 이유}(\text{mc.4.7})}
$$

$$
\text{\textbf{직접접지의 경제성}} \;-\; \text{절연 레벨을 낮춰 기기를 싸게}
$$

$$
0.72, \; 0.64 \;-\; \text{\textbf{1보다 작다}} \;-\; \text{최대사용전압보다 낮은 전압으로 시험}
$$

$$
\text{\textbf{이상해 보이지만}} \;-\; \text{실제로 그만큼만 걸리니 충분하다}
$$

**규정의 숫자가 물리에서 나온다.** pw.4.1의 접지방식 비교표가 그대로 시험전압 배수가
되었다.

### 다중접지 0.92배

$$
7 \sim 25\ \mathrm{kV} \text{ 중성점 \textbf{다중접지}}\text{식} \;\Longrightarrow\; \mathbf{0.92}
$$

$$
\text{\textbf{우리나라 배전선}}\text{이 이것} \;-\; 22.9\ \mathrm{kV\text{-}Y} \text{ 다중접지}
$$

$$
22.9 \times 0.92 = 21.07\ \mathrm{kV}
$$

$$
\text{\textbf{가장 많이 나오는 계산}}
$$

### 최저값 단서

$$
\textbf{3. } \text{ 7 } \sim \text{ 60} \  \mathrm{kV}: \times 1.25 \text{ 인데 } \mathbf{10.5}\ \mathrm{kV} \text{ 미만이면 } 10.5\ \mathrm{kV}
$$

$$
\textbf{5. } \text{ 60} \  \mathrm{kV} \text{ 초과 접지식}: \times 1.1 \text{ 인데 } \mathbf{75}\ \mathrm{kV} \text{ 미만이면 } 75\ \mathrm{kV}
$$

$$
\boxed{\text{\textbf{하한선}}\text{이 있다} \;-\; \text{너무 낮으면 시험이 무의미하니}}
$$

$$
\text{\textbf{계산 문제의 함정}} \;-\; \text{배수만 곱하고 하한을 안 보면 틀린다}
$$

## 회전기, 정류기의 절연내력

> KEC **133**

$$
\text{\textbf{회전기}}: \text{최대사용전압에 따라 } 1.5 \text{ 배 또는 } 1.25 \text{ 배}
$$

$$
7\ \mathrm{kV} \text{ 이하} \;\Longrightarrow\; \times 1.5 \;(\text{최저 } 500\ \mathrm{V})
$$

$$
7\ \mathrm{kV} \text{ 초과} \;\Longrightarrow\; \times 1.25 \;(\text{최저 } 10.5\ \mathrm{kV})
$$

$$
\text{\textbf{정류기}}: \text{직류측・교류측을 따로}
$$

$$
\text{\textbf{mc.1・mc.2・mc.5의 기계}}\text{를 시험하는 규정}
$$

$$
\text{\textbf{mc.1.10・mc.2.9의 절연내력 시험}}\text{이 이 조문}
$$

## 연료전지 및 태양전지 모듈의 절연내력

> KEC **134**

$$
\text{최대사용전압의 } \mathbf{1.5} \text{ 배의 \textbf{직류전압}} \text{ 또는 } \mathbf{1} \text{ 배의 \textbf{교류전압}}
$$

$$
\text{\textbf{연속 10분}} \;(\text{최저 } 500\ \mathrm{V})
$$

$$
\text{\textbf{직류 1.5배, 교류 1배}} \;-\; \text{둘 중 하나}
$$

$$
\text{\textbf{kec.5의 분산형 전원}}\text{과 이어진다}
$$

## 변압기 전로의 절연내력

> KEC **135**

$$
\text{\textbf{표 135-1}}\text{에 따라} \;-\; \text{132와 비슷한 구조}
$$

$$
\text{\textbf{권선마다}} \;-\; \text{1차・2차・3차를 따로}
$$

$$
\text{\textbf{mc.4.9의 변압기 시험}}\text{이 이것}
$$

## 기구 등의 전로의 절연내력

> KEC **136**

$$
\text{\textbf{개폐기 ・ 차단기 ・ 계기용변성기}} \text{ 등}
$$

$$
\text{\textbf{mc.4.10의 PT・CT}}\text{도 여기}
$$

$$
\text{\textbf{mc.7.6의 절연내력 시험}}\text{의 근거}
$$

## 정리

$$
\boxed{
\begin{array}{l|c|c}
\textbf{SELV・PELV} & 250\ \mathrm{V} & \mathbf{0.5}\ \mathrm{M\Omega} \\
\textbf{FELV 포함 } 500\mathrm{V} \text{ 이하} & 500\ \mathrm{V} & \mathbf{1.0}\ \mathrm{M\Omega} \\
500\ \mathrm{V} \text{ 초과} & 1{,}000\ \mathrm{V} & \mathbf{1.0}\ \mathrm{M\Omega}
\end{array}
}
$$

$$
\boxed{\text{누설전류 } \mathbf{1}\ \mathrm{mA} \text{ 이하면 대체 가능}}
$$

| 전로 | 배수 |
|---|---|
| **7kV 이하** | **1.5** |
| **7~25kV 다중접지** | **0.92** |
| **7~60kV** | **1.25** (최저 10.5kV) |
| **60kV 초과 비접지** | **1.25** |
| **60kV 초과 접지** | **1.1** (최저 75kV) |
| **60kV 초과 직접접지** | **0.72** |
| **170kV 초과 직접접지** | **0.64** |

$$
\boxed{\text{\textbf{접지가 잘 될수록 배수가 작다}}} \;-\; \text{pw.4.1의 결론이 숫자로}
$$

$$
\text{\textbf{연속 10분}}, \qquad \text{케이블 교류 전로는 \textbf{직류 2배}}
$$
