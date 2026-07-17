---
id: kec.3.7
title: 전력보안통신설비
status: reviewed
summary: 통신선은 전력선보다 낮게 달아도 된다. 전압이 없으니까. 다만 유도를 막아야 한다.
covers:
  - kec.3.7.1
  - kec.3.7.2
  - kec.3.7.3
  - kec.3.7.4
  - kec.3.7.5
formulas:
  - label: 가공통신선의 높이 (KEC 362.2)
    tex: \text{도로 } \mathbf{5}\ \mathrm{m} \;/\; \text{철도 } \mathbf{6.5}\ \mathrm{m} \;/\; \text{횡단보도교 } \mathbf{3}\ \mathrm{m} \;/\; \text{기타 } \mathbf{3.5}\ \mathrm{m}
    note: 전력선(6/6.5/3.5/5)보다 낮다. 전압이 없으니.
  - label: 전력유도의 방지 (KEC 362.4)
    tex: \text{\textbf{이격} ・ \textbf{연가} ・ \textbf{차폐} ・ \textbf{피뢰기}}
    note: pw.7.3의 유도장해 대책과 같다.
  - label: 무선용 안테나 (KEC 364)
    tex: \text{목적은 \textbf{전력보안통신}} \;-\; \text{일반 통신이 아니다}
    note: 계통 운영·보호를 위한 것.
traps:
  - '**통신선은 도로 5m**로 전력선(6m)보다 낮다. 전압이 없으니 접촉해도 감전 안 된다.'
  - '**철도는 6.5m로 같다.** 통신선이든 전력선이든 기차 높이는 같으니.'
  - '**전력유도 방지가 핵심**이다 — 이격·연가·차폐(pw.7.3).'
related:
  - kec.3.4
  - pw.7.3
  - kec.1.2
---

> KEC **360** (361 일반사항 · 362 시설 · 363 지중통신선로 · 364 무선용 안테나 ·
> 365 식별) — 시행 2026. 1. 5. 기준

## 전력보안통신설비의 일반사항

> KEC **361**

$$
\boxed{\text{\textbf{전력계통의 운영・보호를 위한 통신}}}
$$

$$
\text{\textbf{일반 통신이 아니다}} \;-\; \text{계통을 위한 것}
$$

| 용도 | |
|---|---|
| **급전 지령** | 발·변전소 제어 |
| **보호계전** | pw.1.6의 원격 트립 |
| **감시·계측** | SCADA |
| **비상 연락** | |

$$
\text{\textbf{계통이 하나로 움직이려면}}(\text{pw.4.3}) \;-\; \text{통신이 필요}
$$

$$
\text{\textbf{정전 시에도 살아 있어야}} \;-\; \text{kec.1.2의 113.7}
$$

## 전력보안통신설비의 시설

> KEC **362**

### 가공통신선의 높이 (362.2)

$$
\boxed{
\begin{array}{l|c}
\text{\textbf{도로}} & \mathbf{5}\ \mathrm{m} \;(\text{교통 지장 없으면 } 4.5\ \mathrm{m}) \\
\text{\textbf{철도・궤도}} & \mathbf{6.5}\ \mathrm{m} \\
\text{\textbf{횡단보도교}} & \mathbf{3}\ \mathrm{m} \\
\text{\textbf{기타}} & \mathbf{3.5}\ \mathrm{m}
\end{array}
}
$$

### 전력선보다 낮다

$$
\boxed{
\begin{array}{l|c|c}
& \text{\textbf{전력선}}(\text{kec.3.4}) & \text{\textbf{통신선}} \\ \hline
\text{도로} & 6 & \mathbf{5} \\
\text{철도} & 6.5 & 6.5 \\
\text{횡단보도교} & 3.5 & \mathbf{3} \\
\text{기타} & 5 & \mathbf{3.5}
\end{array}
}
$$

$$
\boxed{\text{\textbf{통신선이 더 낮다}}}
$$

### 왜 낮아도 되나

$$
\text{\textbf{통신선은 전압이 없다}}
$$

$$
\text{\textbf{닿아도 감전이 안 된다}} \;-\; \text{신호 전류뿐}
$$

$$
\boxed{\text{\textbf{높이는 위험이 정한다}}}
$$

$$
\text{\textbf{전력선은 감전 ・ 통신선은 물리적 접촉}}\text{만}
$$

$$
\text{\textbf{철도가 6.5로 같은 이유}} \;-\; \text{기차 높이는 전압과 무관}
$$

$$
\boxed{\text{\textbf{기차에 걸리면 통신선도 위험}}} \;-\; \text{그건 같다}
$$

**규정의 숫자에 일관된 논리**가 있다. 전압이 있으면 높게, 없으면 낮게, 다만 물리적
충돌은 똑같이 막는다.

### 조가선 (362.3)

$$
\text{\textbf{통신선을 매다는 줄}}
$$

$$
\text{\textbf{통신선은 약해서}} \;-\; \text{조가선에 매단다}
$$

$$
\text{\textbf{조가선을 접지}}
$$

### 전력유도의 방지 (362.4)

$$
\boxed{\text{\textbf{전력선이 통신선에 유도}}}(\text{pw.7.3})
$$

| 유도 | 원인 |
|---|---|
| **정전유도** | **전압** (전위차) |
| **전자유도** | **전류** (자속) |
| **고조파 유도** | 왜형파 |

$$
\text{\textbf{pw.7.3에서 본 그것}} \;-\; \text{통신선에 잡음・과전압}
$$

### 대책

| 대책 | |
|---|---|
| **이격거리** | 멀리 |
| **연가** | 전력선을 꼬아 (pw.2.4) |
| **차폐선** | 사이에 접지선 |
| **피뢰기** | 과전압 흡수 |
| **광섬유** | **금속이 없어 유도 안 됨** |

$$
\boxed{\text{\textbf{광섬유가 근본 해결}}}
$$

$$
\text{\textbf{빛으로 통신}} \;\Longrightarrow\; \text{\textbf{전자유도가 원리적으로 없다}}
$$

$$
\text{\textbf{요즘 전력통신은 광섬유}} \;-\; \text{OPGW}
$$

$$
\text{\textbf{OPGW}} = \text{\textbf{가공지선 안에 광섬유}}
$$

$$
\boxed{\text{\textbf{가공지선}}(\text{pw.4.2})\text{과 통신을 겸한다}}
$$

$$
\text{\textbf{뇌 보호 + 통신}} \;-\; \text{하나로 두 일}
$$

## 지중통신선로 설비

> KEC **363**

$$
\text{\textbf{kec.3.4의 지중 전선로}}\text{와 함께 묻는다}
$$

$$
\text{\textbf{전력케이블과 통신케이블}} \;-\; \text{이격 또는 차폐}
$$

## 무선용 안테나

> KEC **364**

$$
\text{\textbf{전력보안통신용}} \;-\; \text{일반 방송이 아니다}
$$

$$
\text{\textbf{산악・도서}}\text{ 등 유선이 어려운 곳}
$$

$$
\text{\textbf{지지물의 강도}} \;-\; \text{바람・빙설}(\text{kec.3.4})
$$

$$
\text{\textbf{목적이 전력보안}}\text{이어야} \;-\; \text{다른 용도로 못 쓴다}
$$

## 통신설비의 식별

> KEC **365**

$$
\text{\textbf{통신선임을 표시}}
$$

$$
\text{\textbf{전력선과 구별}}\text{되게} \;-\; \text{작업자 안전}
$$

$$
\text{\textbf{식별 표}}\text{를 붙인다}
$$

$$
\boxed{\text{\textbf{잘못 만지면 안 되니}}}
$$

## 정리

$$
\boxed{
\begin{array}{l|c|c}
& \text{전력선} & \text{통신선} \\ \hline
\text{도로} & 6 & \mathbf{5} \\
\text{철도} & 6.5 & 6.5 \\
\text{횡단보도교} & 3.5 & \mathbf{3} \\
\text{기타} & 5 & \mathbf{3.5}
\end{array}
}
$$

$$
\text{\textbf{통신선이 낮다}} \;-\; \text{전압이 없으니} \quad / \quad \text{\textbf{철도는 같다}} \;-\; \text{기차 높이}
$$

$$
\boxed{\text{전력유도 방지}: \text{이격・연가・차폐・광섬유}}
$$

$$
\text{\textbf{OPGW}} = \text{가공지선 + 광섬유} \;-\; \text{뇌 보호와 통신을 겸한다}
$$
