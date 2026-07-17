---
id: kec.4.4
title: 전기철도의 전차선로
status: reviewed
summary: 전차선에 지그재그 편위를 주는 게 핵심이다. 팬터그래프가 한 곳만 닳지 않게.
covers:
  - kec.4.4.1
  - kec.4.4.2
formulas:
  - label: 전차선 설비 안전율 (KEC 431.10)
    tex: \text{합금 } \mathbf{2.0}, \; \text{경동선 } \mathbf{2.2}, \; \text{조가선 } \mathbf{2.5}, \; \text{애자 } \mathbf{2.5}
    note: kec.3.4의 가공전선 안전율과 같은 계열.
  - label: 편위 (KEC 431.8)
    tex: \text{\textbf{지그재그 편위}} \;-\; \text{팬터그래프가 \textbf{고르게 마모}}\text{되게}
    note: 한 곳만 닳으면 팬터그래프에 홈이 파인다.
  - label: 급전선·귀선 (KEC 431.4~431.5)
    tex: \text{\textbf{급전선}}(\text{변전소→전차선}) + \text{\textbf{귀선}}(\text{레일→변전소})
    note: 레일이 귀선을 겸한다.
traps:
  - '**전차선에 지그재그 편위**를 준다. 직선으로 달면 팬터그래프 한 곳만 닳는다.'
  - '**조가선 안전율은 2.5**로 전차선(경동선 2.2)보다 크다. 매다는 줄이 더 중요.'
  - '**귀선은 레일**이 겸한다. 그래서 직류는 전식이 문제(kec.4.2).'
related:
  - kec.4.2
  - kec.3.4
  - pw.1.6
---

> KEC **430** (431 전차선로 일반사항 · 435 원격감시제어설비) — 시행 2026. 1. 5. 기준

## 전차선로의 일반사항

> KEC **431**

$$
\text{\textbf{전차에 전기를 공급하는 선로}}
$$

$$
\boxed{\text{\textbf{전차선} + \textbf{급전선} + \textbf{귀선}}}
$$

| 선 | 역할 |
|---|---|
| **전차선** | **팬터그래프가 닿는** 선 |
| **급전선** | 변전소 → 전차선 |
| **귀선** | **레일** — 전차선 → 변전소 |

$$
\text{\textbf{레일이 귀선을 겸한다}} \;-\; \text{돌아오는 길}
$$

## 전차선 전선 설치 방식 (431.1)

| 방식 | |
|---|---|
| **가공방식** | **팬터그래프** (대부분) |
| **강체방식** | 지하 (터널 천장) |
| **제3레일방식** | 옆에 레일 하나 더 (일부 지하철) |

$$
\text{\textbf{가공이 표준}} \;-\; \text{위에서 팬터그래프로}
$$

$$
\text{\textbf{제3레일}}\text{은 옆에} \;-\; \text{집전화}(\text{shoe})\text{로}
$$

## 전차선의 편위 (431.8) — 핵심

$$
\boxed{\text{\textbf{지그재그 편위}}\text{를 준다}}
$$

$$
\text{\textbf{레일면에 수직인 고른 마모}}\text{를 위하여}
$$

### 왜 지그재그인가

$$
\text{\textbf{전차선을 직선으로 달면}} \;\Longrightarrow\; \text{팬터그래프의 \textbf{한 곳만} 닿는다}
$$

$$
\text{\textbf{그 자리에 홈}}\text{이 파인다} \;\Longrightarrow\; \text{팬터그래프 손상}
$$

$$
\boxed{\text{\textbf{좌우로 지그재그}} \;\Longrightarrow\; \text{\textbf{고르게 닳는다}}}
$$

$$
\text{\textbf{팬터그래프 전체를 골고루}} \;-\; \text{수명 연장}
$$

**전차선이 좌우로 흔들려 보이는 게** 그것이다. 일부러 그렇게 한다.

$$
\text{\textbf{제3레일방식}}\text{은 집전범위를 벗어나지 않게}
$$

## 전차선 및 급전선의 높이 (431.6)

$$
\text{\textbf{궤도면상 최소 높이}}\text{를 확보}
$$

$$
\text{\textbf{열차의 통과 게이지보다 높게}}
$$

$$
\text{\textbf{전기적 간격 + 팬터그래프 최소 작동높이}}\text{를 고려}
$$

$$
\text{\textbf{최대 대기온도}}\text{에서 \textbf{바람・팬터그래프 영향이 없는} 안정 상태}
$$

$$
\text{\textbf{더울수록 처진다}}(\text{pw.2.1의 이도}) \;-\; \text{그래서 최대 온도 기준}
$$

$$
\boxed{\text{\textbf{가장 처진 상태}}\text{에서도 충분히 높게}}
$$

## 전차선로 설비의 안전율 (431.10)

$$
\boxed{
\begin{array}{l|c}
\text{\textbf{합금전차선}} & \mathbf{2.0} \\
\text{\textbf{경동선}} & \mathbf{2.2} \\
\text{\textbf{조가선}} \cdot \text{장력 지탱 부품} & \mathbf{2.5} \\
\text{\textbf{복합체}} (\text{고분자 애자}) & \mathbf{2.5} \\
\text{지지물 기초} & \mathbf{2.0} \\
\text{빔・브래킷・철주} & \mathbf{1.0}
\end{array}
}
$$

$$
\text{\textbf{kec.3.4의 가공전선 안전율}}\text{과 같은 계열}
$$

### 조가선이 더 크다

$$
\boxed{\text{조가선 } 2.5 > \text{경동선 } 2.2}
$$

$$
\text{\textbf{조가선}}\text{은 \textbf{전차선을 매다는 줄}}
$$

$$
\text{\textbf{끊어지면 전차선 전체가 떨어진다}} \;-\; \text{더 안전하게}
$$

$$
\boxed{\text{\textbf{매다는 게 매달린 것보다 중요}}}
$$

$$
\text{\textbf{애자도 2.5}} \;-\; \text{절연 + 지지를 겸하니}
$$

## 급전선로 (431.4)

$$
\text{\textbf{변전소에서 전차선까지}}(\text{kec.4.2})
$$

$$
\text{\textbf{AT급전}}\text{이면 급전선이 } +25\ \mathrm{kV}, \text{ 전차선이 } -25\ \mathrm{kV}
$$

$$
\textbf{둘 사이 } \text{ 50} \  \mathrm{kV}(\text{kec.4.2})
$$

## 귀선로 (431.5)

$$
\boxed{\text{\textbf{레일이 귀선}}}
$$

$$
\text{\textbf{전차 → 레일 → 변전소}}
$$

$$
\text{\textbf{돌아오는 전류}}\text{가 레일로}
$$

### 직류의 전식

$$
\text{\textbf{레일에서 땅으로 일부 샌다}}
$$

$$
\text{\textbf{직류}} \;\Longrightarrow\; \text{\textbf{전식}}(\text{kec.4.2})
$$

$$
\text{\textbf{매설 금속이 녹는다}} \;-\; \text{수도관・가스관}
$$

$$
\text{\textbf{교류는 방향이 바뀌어 상쇄}} \;-\; \text{문제 적다}
$$

$$
\text{\textbf{대책: 배류법 ・ 레일 절연}}
$$

## 전기철도의 원격감시제어설비

> KEC **435**

$$
\boxed{\text{\textbf{SCADA}}(\text{원격감시제어시스템})}
$$

$$
\text{\textbf{열차의 안전운행}} + \text{\textbf{전철전력설비 유지보수}}
$$

| 구성 | |
|---|---|
| **중앙감시제어장치** | 관제센터 |
| **소규모감시제어장치** | 변전소·배전소 |

$$
\text{\textbf{kec.3.7의 전력보안통신}}\text{ 위에}
$$

$$
\text{\textbf{한 곳에서 전 노선의 급전을 감시・제어}}
$$

$$
\text{\textbf{pw.1.6의 계전기}}\text{를 원격으로} \;-\; \text{급전 구간을 나누고 합친다}
$$

$$
\boxed{\text{\textbf{정전 구간을 최소화}}}(\text{mc.7.6의 보호협조})
$$

$$
\text{\textbf{사고 나면 그 구간만}} \;-\; \text{전 노선을 세우지 않게}
$$

## 정리

$$
\boxed{\text{\textbf{지그재그 편위}}} \;-\; \text{팬터그래프를 고르게 마모}
$$

$$
\boxed{
\begin{array}{l|c}
\text{합금전차선} & 2.0 \\
\text{경동선} & 2.2 \\
\text{조가선・애자} & 2.5
\end{array}
}
$$

$$
\text{\textbf{조가선이 전차선보다 안전율 큼}} \;-\; \text{매다는 게 중요}
$$

$$
\text{\textbf{귀선 = 레일}} \;\Longrightarrow\; \text{직류는 전식}(\text{kec.4.2})
$$

$$
\text{\textbf{SCADA}}\text{로 급전 원격 제어} \;-\; \text{정전 구간 최소화}
$$
