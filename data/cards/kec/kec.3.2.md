---
id: kec.3.2
title: 안전을 위한 보호
status: reviewed
summary: 저압의 기본보호·고장보호가 고압·특고압에서도 그대로다. 다만 전위경도와 아크가 더 문제다.
covers:
  - kec.3.2.1
formulas:
  - label: 기본보호와 고장보호 (KEC 311.2~311.3)
    tex: \text{\textbf{기본보호}}(\text{직접접촉}) + \text{\textbf{고장보호}}(\text{간접접촉})
    note: kec.1.1과 같은 체계. 이름도 같다.
  - label: 고압 특유의 위험
    tex: \text{\textbf{전위경도}}(\text{보폭・접촉전압}) \cdot \text{\textbf{아크}} \cdot \text{\textbf{유도}}
    note: 전압이 높으니 닿지 않아도 위험.
traps:
  - '**고압·특고압도 기본보호·고장보호** 체계는 같다(kec.1.1).'
  - '**보폭전압·접촉전압**이 고압에서 특히 문제다. 닿지 않아도 위험.'
related:
  - kec.1.1
  - kec.3.3
  - pw.4.1
---

> KEC **310** (311 안전보호) — 시행 2026. 1. 5. 기준

## 안전보호

> KEC **311**

$$
\text{\textbf{kec.1.1의 감전 보호}}\text{를 고압・특고압에}
$$

### 절연수준의 선정 (311.1)

$$
\text{\textbf{기기최고전압 또는 충격내전압}}\text{을 고려}(\text{kec.3.1})
$$

### 기본보호 (311.2)

$$
\boxed{\text{\textbf{직접접촉에 대한 보호}}}
$$

$$
\text{\textbf{충전부에 무심코 접촉}}\text{하거나 \textbf{위험구역에 도달}}\text{하는 것을 방지}
$$

$$
\text{\textbf{kec.1.1의 기본보호}}\text{와 같다}
$$

$$
\boxed{\text{\textbf{위험구역}}\text{이 추가}} \;-\; \text{닿지 않아도 위험}
$$

$$
\text{\textbf{고압은 접근만으로 방전}}(\text{pw.4.2})
$$

### 고장보호 (311.3)

$$
\boxed{\text{\textbf{간접접촉에 대한 보호}}}
$$

$$
\text{\textbf{노출도전부}}\text{가 고장으로 충전되는 것}(\text{kec.1.1})
$$

## 고압 특유의 위험

$$
\text{\textbf{저압에 없던 것}}\text{들}
$$

### 전위경도 — 보폭·접촉전압

$$
\boxed{\text{\textbf{지락 시 대지 표면에 전위 분포}}}
$$

$$
\text{\textbf{접지극 근처}}\text{의 땅에 전압이 걸린다}
$$

| | 무엇 |
|---|---|
| **보폭전압** | **두 발 사이** (걸음 폭) |
| **접촉전압** | **손과 발 사이** |

$$
\text{\textbf{닿지 않아도 땅을 밟는 것}}\text{만으로 감전}
$$

$$
\text{\textbf{kec.1.2에서 본 가축}}\text{이 특히 위험} \;-\; \text{네 발이 넓게}
$$

$$
\boxed{\text{\textbf{대책: 등전위본딩 ・ 자갈 포설}}}(\text{kec.1.5})
$$

$$
\text{\textbf{자갈이 절연}}\text{을 높여 보폭전압을 낮춘다}
$$

$$
\text{\textbf{발전소 바닥에 자갈}}\text{을 까는 이유}
$$

### 아크

$$
\text{\textbf{차단 시 아크}} \;-\; \text{수천 도}(\text{mc.7.5})
$$

$$
\text{\textbf{kec.3.5의 아크 이격}}(\text{고압 } 1\ \mathrm{m}, \text{ 특고압 } 2\ \mathrm{m})
$$

### 유도

$$
\text{\textbf{고압 선로가 통신선에 유도}}(\text{pw.7.3})
$$

$$
\text{\textbf{전자유도 ・ 정전유도}}
$$

$$
\text{\textbf{kec.3.7의 전력보안통신}}\text{에서 다룬다}
$$

## 정리

$$
\boxed{\text{\textbf{기본보호}}(\text{직접접촉}) + \text{\textbf{고장보호}}(\text{간접접촉})} \;-\; \text{kec.1.1과 같다}
$$

$$
\text{고압 특유}: \text{\textbf{전위경도}}(\text{보폭・접촉전압}) \cdot \text{\textbf{아크}} \cdot \text{\textbf{유도}}
$$

$$
\boxed{\text{\textbf{닿지 않아도 위험}}} \;-\; \text{전압이 높으니}
$$
