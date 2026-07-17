---
id: kec.3.1
title: 통칙
status: reviewed
summary: 고압·특고압의 적용 범위와 기본원칙이다. 저압과 경계는 1kV·1.5kV로 같다.
covers:
  - kec.3.1.1
  - kec.3.1.2
formulas:
  - label: 적용범위 (KEC 301)
    tex: \text{교류 } \mathbf{1}\ \mathrm{kV} \text{ 초과 또는 직류 } \mathbf{1.5}\ \mathrm{kV} \text{ 초과}
    note: kec.2(저압)의 경계 바로 위. 전압 구분은 111.1과 같다.
  - label: 기본원칙 (KEC 302)
    tex: \text{\textbf{설비 안전}} \cdot \text{\textbf{공중 보호}} \cdot \text{\textbf{설비 보호}}
    note: 사람과 설비를 함께.
traps:
  - '**고압·특고압은 교류 1kV 초과, 직류 1.5kV 초과**다. kec.2 저압의 바로 위.'
  - '**전압 구분은 111.1의 2**를 따른다 — kec.1.1과 같은 정의.'
related:
  - kec.1.1
  - kec.2.1
  - kec.3.2
---

> KEC **300** (301 적용범위 · 302 기본원칙) — 시행 2026. 1. 5. 기준

## 적용범위

> KEC **301**

$$
\boxed{\text{교류 } \mathbf{1}\ \mathrm{kV} \text{ 초과 또는 직류 } \mathbf{1.5}\ \mathrm{kV} \text{ 초과}}
$$

$$
\text{\textbf{고압 및 특고압}}\text{ 전기설비}
$$

$$
\text{\textbf{전압 구분은 111.1의 2}}\text{에 따른다}(\text{kec.1.1})
$$

### kec.2와의 경계

$$
\text{\textbf{저압}}(\text{kec.2}): \text{교류 } 1\ \mathrm{kV} \text{ 이하}, \text{ 직류 } 1.5\ \mathrm{kV} \text{ 이하}
$$

$$
\text{\textbf{고압・특고압}}(\text{kec.3}): \text{그 \textbf{초과}}
$$

$$
\boxed{\text{\textbf{딱 맞물린다}}} \;-\; \text{빈틈이 없다}
$$

| | 교류 | 직류 |
|---|---|---|
| **저압** (kec.2) | $\leq 1\ \mathrm{kV}$ | $\leq 1.5\ \mathrm{kV}$ |
| **고압·특고압** (kec.3) | $> 1\ \mathrm{kV}$ | $> 1.5\ \mathrm{kV}$ |

## 기본원칙

> KEC **302**

$$
\text{\textbf{설비의 안전 원칙}}
$$

| 원칙 | |
|---|---|
| **설비의 안전** | 기술기준 충족 |
| **공중의 보호** | 사람이 다치지 않게 |
| **설비의 보호** | 사고로부터 |

$$
\text{\textbf{kec.1.2의 113}}\text{을 고압・특고압에}
$$

### 절연수준

$$
\text{\textbf{기기최고전압 또는 충격내전압}}\text{을 고려}
$$

$$
\text{\textbf{pw.4.2의 절연협조}}\text{와 이어진다}
$$

$$
\text{\textbf{BIL}}(\text{기준충격절연강도}) \;-\; \text{계통의 절연 설계 기준}
$$

$$
\boxed{\text{\textbf{전압이 높을수록 절연도 높게}}}
$$

## 정리

$$
\boxed{\text{교류 } \mathbf{1}\ \mathrm{kV} \text{ 초과, 직류 } \mathbf{1.5}\ \mathrm{kV} \text{ 초과} = \text{고압・특고압}}
$$

$$
\text{\textbf{저압}(\text{kec.2})\text{과 딱 맞물린다}}
$$

$$
\text{\textbf{절연수준은 충격내전압}}\text{을 고려}(\text{pw.4.2})
$$
