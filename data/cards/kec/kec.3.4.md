---
id: kec.3.4
title: 전선로
status: reviewed
summary: 풍압하중 세 종과 특고압 높이가 핵심이다. 160kV를 넘으면 10kV마다 0.12m씩 더한다.
covers:
  - kec.3.4.1
  - kec.3.4.2
  - kec.3.4.3
  - kec.3.4.4
  - kec.3.4.5
formulas:
  - label: 풍압하중 세 종 (KEC 331.6)
    tex: \text{\textbf{갑종}}(\text{고온계}) \cdot \text{\textbf{을종}}(\text{빙설, 갑종의 } \tfrac{1}{2}) \cdot \text{\textbf{병종}}(\text{저온계, 갑종의 } \tfrac{1}{2})
    note: 을종은 두께 6mm·비중 0.9 빙설 부착 상태.
  - label: 특고압 가공전선의 높이 (KEC 333.7)
    tex: 35\mathrm{kV} \text{ 이하 } \mathbf{5}\ \mathrm{m}, \quad 160\mathrm{kV} \text{ 초과} \to \mathbf{6} + 0.12 \times \lceil\tfrac{V-160}{10}\rceil\ \mathrm{m}
    note: 160kV 초과분 **10kV마다 0.12m** 가산.
  - label: 지지물 기초 안전율 (KEC 331.7)
    tex: \text{일반 } \mathbf{2} \text{ 이상}, \qquad \text{이상시 철탑 } \mathbf{1.33} \text{ 이상}
    note: 철탑은 이상 시 상정하중이라 완화.
  - label: 경동선 안전율 (KEC 332.4)
    tex: \text{경동선・내열동합금 } \mathbf{2.2}, \qquad \text{기타}(\text{ACSR}) \; \mathbf{2.5}
    note: kec.2.3과 같다. pw.2.1의 이도.
traps:
  - '**을종·병종은 갑종의 1/2**이다. 을종은 빙설 부착, 병종은 저온계.'
  - '**160kV 초과는 10kV마다 0.12m** 가산이다. 단수 올림에 주의.'
  - '**기초 안전율은 2, 이상시 철탑만 1.33**이다.'
  - '**빙설은 두께 6mm, 비중 0.9**로 계산한다.'
related:
  - kec.2.3
  - pw.2.1
  - pw.4.2
---

> KEC **330** (331 일반 · 332 고압 가공전선로 · 333 특고압 가공전선로 · 334 지중 ·
> 335 특수장소) — 시행 2026. 1. 5. 기준

## 전선로 일반 및 구내, 옥측, 옥상 전선로

> KEC **331**

### 풍압하중의 종별 (331.6)

$$
\boxed{\text{\textbf{갑종} ・ \textbf{을종} ・ \textbf{병종}}}
$$

| 종별 | 언제 | 크기 |
|---|---|---|
| **갑종** | **고온계** (일반) | **기준** |
| **을종** | **빙설이 많은 지역** | **갑종의 $\frac{1}{2}$** |
| **병종** | **저온계** (빙설 적은 저온) | **갑종의 $\frac{1}{2}$** |

$$
\boxed{\textbf{을종・병종은 갑종의 } \dfrac{1}{2}}
$$

### 갑종 — 기준

$$
\textbf{수직 투영면적 } \text{ 1} \  \mathrm{m^2} \text{ 에 대한 풍압}
$$

| 구성재 | 풍압 |
|---|---|
| **목주·원형 철주·철근콘크리트주** | $588\ \mathrm{Pa}$ |
| 원형 철근콘크리트주 | $588\ \mathrm{Pa}$ |
| **각형 철주** | $1{,}412\ \mathrm{Pa}$ |
| **전선 기타 가섭선** | $1{,}117\ \mathrm{Pa}$ |

$$
\text{\textbf{바람이 세게 부는 상태}}\text{를 가정}
$$

$$
\text{\textbf{둥근 것이 풍압을 덜 받는다}} \;-\; 588 < 1412
$$

$$
\text{\textbf{공기가 매끄럽게 흘러가니}}
$$

### 을종 — 빙설

$$
\boxed{\text{두께 } \mathbf{6}\ \mathrm{mm}, \text{ 비중 } \mathbf{0.9} \text{ 빙설이 부착된 상태}}
$$

$$
\text{빙설이 붙으면} \;\Longrightarrow\; \text{\textbf{면적이 커진다}} \;\Longrightarrow\; \text{바람을 더 받는다}
$$

$$
\textbf{그런데 풍압 자체는 갑종의 } \dfrac{1}{2}
$$

$$
\text{\textbf{빙설이 있으면 바람이 약한 계절}} \;-\; \text{겨울}
$$

$$
\boxed{\text{\textbf{면적은 커지고 바람은 약하고}}}
$$

$$
\text{\textbf{두 효과의 균형}} \;-\; \text{그래서 } \frac{1}{2}
$$

### 병종 — 저온계

$$
\text{\textbf{빙설이 적은 지역의 저온}} \;-\; \text{갑종의 } \dfrac{1}{2}
$$

$$
\text{\textbf{추운데 빙설은 안 붙는 곳}}
$$

$$
\boxed{\text{\textbf{지역에 따라 적용}}}
$$

| 지역 | 적용 |
|---|---|
| **빙설 많은 지역** | 갑종 · **을종** 중 큰 것 |
| **빙설 많고 해안 등 저온** | 갑종 · 을종 중 큰 것 |
| **기타** | 갑종 · **병종** 중 큰 것 |

$$
\text{\textbf{그 지역에서 가장 가혹한 조건}}\text{으로}
$$

### 기초 안전율 (331.7)

$$
\boxed{\text{일반 } \mathbf{2} \text{ 이상}, \qquad \text{이상 시 철탑 } \mathbf{1.33} \text{ 이상}}
$$

$$
\text{\textbf{철탑은 왜 완화}}\text{되나}
$$

$$
\text{\textbf{이상 시 상정하중}}\text{은 이미 극단적}\text{이니}
$$

$$
\text{\textbf{드물게 오는 최악}}\text{에 } 2 \text{ 를 요구하면 과하다}
$$

$$
\boxed{\text{\textbf{조건이 가혹하면 안전율을 낮춘다}}}
$$

## 가공전선로

> 고압 가공전선 — KEC **332**

### 굵기 (332.3)

$$
\text{인장강도 } 8.01\ \mathrm{kN} \text{ 또는 지름 } \mathbf{5}\ \mathrm{mm} \text{ 이상 경동선}
$$

$$
\text{\textbf{시가지 외}}\text{도 } 5\ \mathrm{mm} \;-\; \text{저압보다 엄격}(\text{kec.2.3})
$$

$$
\text{\textbf{고압이니 끊어지면 더 위험}}
$$

### 안전율 (332.4)

$$
\boxed{\text{경동선・내열동합금선 } \mathbf{2.2}, \qquad \text{기타 } \mathbf{2.5}}
$$

$$
\text{\textbf{kec.2.3의 저압과 같다}} \;-\; \text{안전율은 재료가 정한다}
$$

$$
\text{\textbf{pw.2.1의 이도}}: D = \dfrac{WS^2}{8T}
$$

$$
T = \dfrac{\text{인장강도}}{\text{안전율}} \;-\; \text{안전율이 이도를 정한다}
$$

$$
\text{\textbf{안전율을 크게 하면}} \;\Longrightarrow\; T \downarrow \;\Longrightarrow\; \text{이도} \uparrow \;\Longrightarrow\; \text{더 처진다}
$$

$$
\boxed{\text{\textbf{안전율과 이도는 이어져 있다}}}
$$

### 높이 (332.5)

$$
\boxed{
\begin{array}{l|c}
\text{도로 횡단} & \mathbf{6}\ \mathrm{m} \\
\text{철도・궤도 횡단} & \mathbf{6.5}\ \mathrm{m} \\
\text{횡단보도교} & \mathbf{3.5}\ \mathrm{m} \\
\text{기타} & \mathbf{5}\ \mathrm{m}
\end{array}
}
$$

$$
\text{\textbf{kec.2.3의 저압과 같다}} \;-\; \text{높이는 통행이 정하니}
$$

## 특고압 가공전선로

> KEC **333**

### 높이 (333.7)

$$
\boxed{
\begin{array}{l|c}
\mathbf{35}\ \mathrm{kV} \text{ 이하} & \mathbf{5}\ \mathrm{m} \\
35 \sim 160\ \mathrm{kV} & \mathbf{6}\ \mathrm{m} \\
\mathbf{160}\ \mathrm{kV} \text{ 초과} & 6 + 0.12 \times N
\end{array}
}
$$

$$
N = \left\lceil \dfrac{V - 160}{10} \right\rceil \;-\; \text{\textbf{160kV 초과분을 10kV마다}}
$$

$$
\boxed{\text{160kV 초과 } \mathbf{10}\ \mathrm{kV} \text{ 마다 } \mathbf{0.12}\ \mathrm{m} \text{ 가산}}
$$

### 예 — 345kV

$$
N = \left\lceil \dfrac{345 - 160}{10} \right\rceil = \lceil 18.5 \rceil = \mathbf{19}
$$

$$
\text{높이} = 6 + 0.12 \times 19 = 6 + 2.28 = \mathbf{8.28}\ \mathrm{m}
$$

$$
\boxed{\text{\textbf{단수는 올림}}} \;-\; 18.5 \to 19
$$

$$
\text{\textbf{시험 함정}} \;-\; \text{버림하면 틀린다}
$$

### 왜 높을수록 높이나

$$
\text{\textbf{전압이 높으면 절연거리가 커야}}(\text{pw.4.2})
$$

$$
\text{\textbf{공기의 절연내력}} \;-\; \text{전압이 높으면 더 멀리 떨어져야 방전 안 함}
$$

$$
\text{\textbf{사람이 가까이 가면 위험}} \;-\; \text{닿지 않아도 방전}
$$

$$
\boxed{\text{\textbf{높은 전압일수록 사람에게서 멀리}}}
$$

### 철도·궤도는 6.5m 고정

$$
\text{\textbf{전압과 무관}}\text{하게 } 6.5\ \mathrm{m}
$$

$$
\text{\textbf{기차 높이가 정하니}} \;-\; \text{전압이 아니라 통행이}
$$

$$
\text{\textbf{산지 등 사람이 쉽게 못 가는 곳}}\text{은 } 5\ \mathrm{m}
$$

### 시가지 시설 제한 (333.1)

$$
\text{\textbf{특고압을 시가지에}} \;-\; \text{원칙적으로 제한}
$$

$$
\text{\textbf{조건을 갖추면}} \;\Longrightarrow\; \text{시설 가능}
$$

| 조건 | |
|---|---|
| **전선 굵기** | 더 굵게 |
| **경간** | 짧게 |
| **애자** | 2련 이상 |
| **지지물** | 철주·철탑 |

$$
\text{\textbf{사람이 많으니 더 튼튼하게}}
$$

$$
\text{\textbf{100 kV 초과는 지락・단락 시 } 1 \text{ 초 이내 차단}}
$$

### 애자장치 (333.5)

$$
\text{\textbf{사용전압에 견디는 절연}}
$$

$$
\text{\textbf{현수애자 ・ 장간애자}}
$$

$$
\text{\textbf{pw.4.2의 섬락・역섬락}}\text{을 견뎌야}
$$

## 지중 전선로

> KEC **334**

$$
\text{\textbf{kec.2.3의 저압 지중과 같은 구조}}
$$

$$
\text{매설깊이: 차량 압력 } \mathbf{1.0}\ \mathrm{m}, \text{ 기타 } \mathbf{0.6}\ \mathrm{m}
$$

$$
\text{\textbf{직접매설・관로식・암거식}}
$$

$$
\text{\textbf{특고압은 케이블 필수}} \;-\; \text{나전선・절연전선 불가}
$$

## 특수장소의 전선로

> KEC **335**

$$
\text{\textbf{물밑 ・ 터널 ・ 교량}}
$$

$$
\text{\textbf{물밑케이블}}(\text{kec.1.3의 122.4})
$$

$$
\text{\textbf{일반 규정이 안 통하는 곳}}
$$

## 정리

$$
\boxed{\text{풍압: \textbf{갑종}}(\text{기준}) \cdot \text{\textbf{을종・병종}}(\text{갑종의 } \tfrac{1}{2})}
$$

$$
\text{을종 = 빙설}(\text{두께 } 6\ \mathrm{mm}, \text{ 비중 } 0.9), \quad \text{병종 = 저온}
$$

$$
\boxed{
\begin{array}{l|c}
35\ \mathrm{kV} \text{ 이하} & 5\ \mathrm{m} \\
35 \sim 160\ \mathrm{kV} & 6\ \mathrm{m} \\
160\ \mathrm{kV} \text{ 초과} & 6 + 0.12 \times \lceil\tfrac{V-160}{10}\rceil
\end{array}
}
$$

| | 값 |
|---|---|
| **기초 안전율** | **2** (이상시 철탑 **1.33**) |
| **경동선 안전율** | **2.2** (기타 **2.5**) |
| **고압 굵기** | **5mm** 경동선 |

$$
\text{\textbf{높은 전압일수록 높이} ・ \textbf{조건이 가혹하면 안전율 완화}}
$$
