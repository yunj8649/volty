---
id: kec.5.4
title: 풍력발전설비
status: reviewed
summary: 바람이 로터를 돌려 나셀 속 발전기를 돌린다. 위험 시 자동정지가 핵심이고, 해상 풍력은 더 엄하게 다룬다.
covers:
  - kec.5.4.1
  - kec.5.4.2
formulas:
  - label: 자동정지 (KEC 532.5)
    tex: \text{\textbf{과속・과진동・계통 이상}} \;\Longrightarrow\; \text{\textbf{자동정지}}
    note: 폭풍·고장 시 스스로 멈춰야 한다.
  - label: 구성 (KEC 502)
    tex: \text{\textbf{로터}}(\text{날개}) \to \text{\textbf{나셀}}(\text{발전기 집}) \to \text{\textbf{타워}}
    note: 나셀 안에 증속기·발전기·제어장치.
  - label: 접지·피뢰 (KEC 532.4)
    tex: \text{\textbf{높은 구조물}} \;\Longrightarrow\; \text{\textbf{피뢰가 필수}}
    note: 날개 끝이 뇌를 부른다.
traps:
  - '**자동정지가 핵심**이다 — 과속·과진동·계통 이상 시 스스로 멈춘다.'
  - '**나셀은 발전기 집**이다 — 로터가 돌리는 발전기가 그 안에.'
  - '**날개 끝에 피뢰**가 필수다 — 가장 높아 뇌를 부른다.'
related:
  - kec.5.1
  - mc.5.6
  - pw.1.1
---

> KEC **530** (531 일반사항 · 532 풍력설비의 시설 · 533 해상 풍력) — 시행 2026. 1. 5. 기준

## 일반사항

> KEC **531**

$$
\boxed{\text{\textbf{바람}} \to \text{\textbf{로터}} \to \text{\textbf{발전기}} \to \text{\textbf{계통}}}
$$

$$
\text{\textbf{운동에너지}}(\text{바람}) \to \text{\textbf{회전}}(\text{로터}) \to \text{\textbf{전기}}
$$

$$
\text{\textbf{태양광은 정지}}, \; \text{\textbf{풍력은 회전}} \;-\; \text{기계가 있어 더 복잡}
$$

## 용어 — 구성

> KEC **502**

| 용어 | 뜻 |
|---|---|
| **로터** | 바람을 받는 날개 |
| **나셀** | 발전기·증속기가 든 집 |
| **타워** | 나셀을 받치는 기둥 |
| **풍력터빈** | 바람 → 기계 에너지 |
| **자동정지** | 이상 시 스스로 정지 |

$$
\boxed{\text{\textbf{나셀}}\text{ 안에 증속기 + 발전기 + 제어}}
$$

$$
\text{\textbf{로터는 느리게}}(\text{수 rpm}) \;-\; \text{증속기로 발전기 속도까지}
$$

## 풍력설비의 시설

> KEC **532**

| 항목 | |
|---|---|
| **하중·하중조합** | 바람·중력·지진 |
| **로터 날개** | 원심력·피로 |
| **기계 시스템** | 증속기·베어링 |
| **전기 시스템** | 발전기·변환장치 |
| **제어 시스템** | **자동정지** |
| **지지 구조물** | 타워·기초 |
| **계측장치** | 풍속·회전·진동 |

## 제어 시스템 — 자동정지가 핵심

> KEC **532.5**

$$
\boxed{\text{\textbf{과속・과진동・계통 이상}} \;\Longrightarrow\; \text{\textbf{자동정지}}}
$$

### 왜 자동정지가 중요한가

$$
\text{\textbf{바람은 통제 불가}} \;-\; \text{폭풍이 오면 과속}
$$

$$
\text{\textbf{과속}} \;\Longrightarrow\; \text{\textbf{원심력}} \;\Longrightarrow\; \text{\textbf{날개 파손}}
$$

$$
\text{\textbf{피치 제어}} \;-\; \text{날개 각도를 틀어 바람을 흘림}
$$

$$
\text{\textbf{요 제어}} \;-\; \text{나셀을 바람 반대로 돌림}
$$

$$
\boxed{\text{\textbf{정격 초과 시 출력 제한, 위험 시 정지}}}
$$

$$
\text{\textbf{계통 정전 시}}\text{도 정지}(\text{kec.5.1의 단독운전 방지})
$$

## 전기 시스템

> KEC **532.4**

$$
\text{\textbf{발전기}}\text{는 보통 유도발전기・동기발전기}(\text{mc.5.6})
$$

$$
\text{\textbf{유도발전기}}\text{는 계통이 없으면 저절로 정지}(\text{mc.5.6})
$$

$$
\text{\textbf{변환장치}}(\text{인버터})\text{로 계통에 맞춘다}(\text{mc.3.3})
$$

### 접지·피뢰

$$
\boxed{\text{\textbf{가장 높은 구조물}} \;\Longrightarrow\; \text{\textbf{뇌를 부른다}}}
$$

$$
\text{\textbf{날개 끝에 수뢰부}} \;-\; \text{뇌전류를 타워로}
$$

$$
\text{\textbf{나셀・타워를 통해 대지로}}(\text{kec.1.6의 피뢰시스템})
$$

$$
\text{\textbf{회전하는 날개}} \;-\; \text{피뢰 설계가 까다롭다}
$$

## 계측장치

> KEC **532.7**

$$
\text{\textbf{풍속・회전속도・진동}}\text{을 계측}
$$

$$
\text{\textbf{한계 넘으면 자동정지 신호}}
$$

## 유지보수·해상 풍력

> KEC **532.8 · 533**

$$
\text{\textbf{나셀은 높은 곳}} \;-\; \text{점검・정비가 위험}
$$

| 해상 | |
|---|---|
| **고정식** | 해저에 기초 (533.1) |
| **부유식** | 물에 떠서 (533.2) |

$$
\text{\textbf{해상은 염해・파랑・접근 곤란}} \;-\; \text{더 엄한 기준}
$$

$$
\boxed{\text{\textbf{바다 위라 유지보수가 최대 난제}}}
$$

## 정리

$$
\boxed{\textbf{바람} \to \text{로터} \to \text{나셀} \text{(} \text{발전기} \text{) } \to \text{계통}}
$$

$$
\boxed{\text{\textbf{자동정지가 핵심}}} \;-\; \text{과속・과진동・계통 이상 시}
$$

$$
\text{\textbf{날개 끝 피뢰}} \;-\; \text{가장 높아 뇌를 부른다}(\text{kec.1.6})
$$

$$
\text{\textbf{유도발전기}}(\text{mc.5.6})\text{는 단독운전 저절로 방지} \;-\; \text{계통 없으면 못 도니}
$$

$$
\boxed{\text{\textbf{태양광과 달리 기계가 돈다}}} \;-\; \text{그래서 정지・제어가 관건}
$$
