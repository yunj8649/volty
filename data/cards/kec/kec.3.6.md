---
id: kec.3.6
title: 발전소, 변전소, 개폐소 등의 전기설비
status: reviewed
summary: 울타리 2m·하단 0.15m가 기본이고, 충전부까지 거리 합계는 특고압 높이와 같은 규칙이다.
covers:
  - kec.3.6.1
formulas:
  - label: 울타리·담의 높이 (KEC 351.1)
    tex: \text{높이 } \mathbf{2}\ \mathrm{m} \text{ 이상}, \qquad \text{지표면과 하단 사이 } \mathbf{0.15}\ \mathrm{m} \text{ 이하}
    note: 사람이 못 넘고, 밑으로도 못 들어가게.
  - label: 울타리 ~ 충전부 거리 합계 (표 351.1-1)
    tex: 35\mathrm{kV} \text{ 이하 } \mathbf{5}\ \mathrm{m}, \quad 160\mathrm{kV} \text{ 초과 } 6 + 0.12 \times \lceil\tfrac{V-160}{10}\rceil
    note: kec.3.4의 특고압 높이와 **같은 규칙**.
  - label: 수소냉각식 (KEC 351.10)
    tex: \text{수소 순도 } \mathbf{85\%} \text{ 이하로 저하 시 경보}
    note: mc.2.9의 수소냉각. 폭발 방지.
traps:
  - '**울타리 2m 이상, 하단 간격 0.15m 이하**다. 넘지도 밑으로도 못 들어가게.'
  - '**충전부까지 거리 합계는 kec.3.4의 특고압 높이와 같은 값**이다.'
  - '**수소냉각은 순도 85% 이하에서 경보**한다. 공기와 섞이면 폭발.'
related:
  - kec.3.4
  - kec.3.5
  - mc.2.9
---

> KEC **350** (351 발전소·변전소·개폐소 등의 전기설비) — 시행 2026. 1. 5. 기준

## 발전소, 변전소, 개폐소 등의 전기설비

> KEC **351**

$$
\text{\textbf{고압・특고압 설비가 모인 곳}} \;-\; \text{사람을 막는 게 우선}
$$

## 울타리·담 등의 시설 (351.1)

$$
\boxed{\text{\textbf{취급자 이외의 사람이 들어가지 못하게}}}
$$

| 조치 | |
|---|---|
| **울타리·담** | 시설 |
| **출입금지 표시** | 출입구에 |
| **자물쇠장치** | 출입구에 |

### 울타리의 규격

$$
\boxed{\text{높이 } \mathbf{2}\ \mathrm{m} \text{ 이상}, \qquad \text{지표면과 하단 사이 } \mathbf{0.15}\ \mathrm{m} \text{ 이하}}
$$

$$
\text{\textbf{"2m / 0.15m"}}
$$

$$
\text{\textbf{높이는 넘지 못하게}} \;-\; 2\ \mathrm{m}
$$

$$
\text{\textbf{하단은 기어들지 못하게}} \;-\; 0.15\ \mathrm{m}
$$

$$
\boxed{\text{\textbf{위로도 아래로도 막는다}}}
$$

### 충전부까지의 거리 합계 (표 351.1-1)

$$
\boxed{
\begin{array}{l|c}
\mathbf{35}\ \mathrm{kV} \text{ 이하} & \mathbf{5}\ \mathrm{m} \\
35 \sim 160\ \mathrm{kV} & \mathbf{6}\ \mathrm{m} \\
\mathbf{160}\ \mathrm{kV} \text{ 초과} & 6 + 0.12 \times \lceil\tfrac{V-160}{10}\rceil
\end{array}
}
$$

$$
\boxed{\text{\textbf{울타리 높이 + 울타리에서 충전부까지 거리}}}
$$

$$
\text{\textbf{kec.3.4의 특고압 가공전선 높이와 정확히 같은 규칙}}
$$

$$
\text{\textbf{둘 다 사람과 충전부의 거리}} \;-\; \text{같은 물리}
$$

### 왜 "합계"인가

$$
\text{\textbf{울타리가 높으면}} \;\Longrightarrow\; \text{충전부가 가까워도 된다}
$$

$$
\text{\textbf{울타리가 낮으면}} \;\Longrightarrow\; \text{충전부를 멀리}
$$

$$
\boxed{\text{\textbf{손이 닿는 거리}}\text{가 기준}}
$$

$$
\text{높이 } 2\ \mathrm{m} \text{ 울타리 + 팔 길이} \;-\; \text{그래도 } 35\ \mathrm{kV} \text{ 는 } 5\ \mathrm{m} \text{ 여야}
$$

$$
\text{\textbf{울타리를 넘어 손을 뻗어도 안 닿게}}
$$

## 수소냉각식 발전기 (351.10)

$$
\text{\textbf{mc.2.9의 수소냉각}}\text{을 규정으로}
$$

$$
\boxed{\text{수소 순도 } \mathbf{85\%} \text{ 이하로 저하하면 경보}}
$$

$$
\text{\textbf{공기와 섞이면 폭발}}(\text{mc.2.9})
$$

| 요구 | |
|---|---|
| **순도 감시** | 85% 이하 경보 |
| **압력·온도 감시** | |
| **밀봉유 장치** | 축 관통부 |
| **방폭 구조** | 견고한 케이싱 |
| **누설 검출** | |

$$
\text{\textbf{mc.2.9에서 본 그것}} \;-\; \text{규정이 물리를 따른다}
$$

$$
\text{수소 비중 } \dfrac{1}{14} \;\Longrightarrow\; \text{풍손 } \dfrac{1}{10} \;\Longrightarrow\; \text{출력 } 25\% \uparrow
$$

$$
\boxed{\text{\textbf{장점의 대가가 폭발 위험}}} \;-\; \text{그래서 규정이 까다롭다}
$$

## 그 밖의 시설

| 조 | |
|---|---|
| **351.2** | 절연유 유출 방지 |
| **351.3** | 특고압 전로의 상 및 접속 상태 표시 |
| **351.4** | 발전기 등의 보호장치 |
| **351.5** | 특고압용 변압기의 보호장치 |
| **351.6** | 조상설비의 보호장치 |
| 351.7 | 계측장치 |

### 발전기 보호장치 (351.4)

$$
\text{\textbf{자동차단}}\text{해야 하는 경우}
$$

| 사고 | |
|---|---|
| **과전류·과전압** | |
| **베어링 과열** | |
| **내부 고장** | 차동계전기 (pw.1.6) |
| **스러스트 베어링 마모** (수차) | |
| **비상조속기** (과속) | |

$$
\text{\textbf{pw.1.6의 계전기}}\text{가 여기서 의무화}
$$

$$
\text{\textbf{mc.2.9의 발전기}}\text{를 지키는 규정}
$$

### 변압기 보호장치 (351.5)

$$
\text{\textbf{용량에 따라}} \;-\; \text{내부 고장 시 자동차단 또는 경보}
$$

| 용량 | |
|---|---|
| **5,000 kVA 이상 10,000 kVA 미만** | 자동차단 **또는** 경보 |
| **10,000 kVA 이상** | 자동차단 |

$$
\text{\textbf{부흐홀츠 계전기}}(\text{mc.4.1})\text{ ・ 차동계전기}(\text{pw.1.6})
$$

$$
\boxed{\text{\textbf{클수록 엄격}}} \;-\; \text{고장 나면 피해가 크니}
$$

### 조상설비 보호장치 (351.6)

$$
\text{\textbf{전력용 콘덴서・분로리액터}}(\text{pw.2.6})
$$

$$
\text{\textbf{동기조상기}}(\text{mc.2.8})
$$

$$
\text{내부 고장・과전류・과전압 시 자동차단}
$$

## 계측장치 (351.7)

$$
\text{\textbf{발전소・변전소에 두어야 할 계측}}
$$

| 계측 | |
|---|---|
| **전압·전류·전력** | |
| **발전기 온도** | 고정자·베어링 |
| **주요 변압기 온도** | |
| **특고압 모선 전압·전류** | |

$$
\text{\textbf{mc.1.9의 온도상승}}\text{을 상시 감시}
$$

$$
\text{\textbf{mc.2.9의 매입 온도계}}(\text{RTD})
$$

$$
\boxed{\text{\textbf{규정이 계측을 의무화}}}
$$

## 정리

$$
\boxed{\text{울타리 높이 } \mathbf{2}\ \mathrm{m} \text{ 이상}, \quad \text{하단 간격 } \mathbf{0.15}\ \mathrm{m} \text{ 이하}}
$$

$$
\boxed{
\begin{array}{l|c}
35\ \mathrm{kV} \text{ 이하} & 5\ \mathrm{m} \\
35 \sim 160\ \mathrm{kV} & 6\ \mathrm{m} \\
160\ \mathrm{kV} \text{ 초과} & 6 + 0.12 \times \lceil\tfrac{V-160}{10}\rceil
\end{array}
} \;\text{(거리 합계)}
$$

$$
\text{\textbf{kec.3.4의 특고압 높이와 같은 규칙}} \;-\; \text{사람과 충전부의 거리}
$$

$$
\boxed{\text{수소냉각 순도 } \mathbf{85\%} \text{ 이하 경보}}
$$

| 보호 | 근거 |
|---|---|
| **발전기** | pw.1.6 계전기 |
| **변압기** | 10,000kVA 이상 자동차단 |
| **조상설비** | pw.2.6 |

$$
\text{\textbf{규정이 앞 과목의 계전기・계측을 의무화한다}}
$$
