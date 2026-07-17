---
id: kec.5.2
title: 전기저장장치
status: reviewed
summary: 이차전지가 핵심이고, 최대 걱정은 열폭주다. 리튬계는 폭주하면 스스로 타므로 특별히 엄하게 다룬다.
covers:
  - kec.5.2.1
  - kec.5.2.2
formulas:
  - label: 옥내 대지전압 (KEC 511.1.3)
    tex: \text{주택 옥내 직류전로 대지전압 } \mathbf{600}\ \mathrm{V} \text{ 까지}
    note: 단, 지락 시 자동차단 + 은폐 시공 조건.
  - label: 이차전지 종류 (KEC 512)
    tex: \text{리튬계・나트륨계} \;/\; \text{납계・니켈계・바나듐계} \;/\; \text{흐름전지}
    note: 리튬계가 열폭주 위험이 가장 크다.
  - label: 열폭주 (KEC 512.1.3)
    tex: \text{\textbf{한 셀의 발열}} \;\Longrightarrow\; \text{\textbf{이웃 셀로 연쇄}} \;\Longrightarrow\; \text{\textbf{폭주}}
    note: 리튬계 이차전지의 최대 위험. 물로 끄기 어렵다.
traps:
  - '**최대 걱정은 열폭주**다 — 한 셀이 타면 옆 셀로 번진다.'
  - '**주택 옥내 직류 대지전압 600V까지** — 지락 자동차단 + 은폐 조건.'
  - '**리튬계는 특별히 엄하게** — 전용건물·CCTV 등 추가 규제.'
related:
  - kec.5.1
  - kec.5.3
  - pw.5.4
---

> KEC **510** (511 일반사항·전기저장장치의 시설 · 512 이차전지의 시설) — 시행 2026. 1. 5. 기준

## 일반사항

> KEC **511.1**

$$
\boxed{\text{\textbf{전기저장장치}}(\text{ESS})}
$$

$$
\text{\textbf{전기를 저장했다 필요할 때 쓴다}}
$$

$$
\text{\textbf{남을 때 충전, 모자랄 때 방전}} \;-\; \text{계통의 완충기}
$$

$$
\text{\textbf{재생에너지의 짝}}(\text{kec.5.1}) \;-\; \text{태양광・풍력은 들쭉날쭉하니}
$$

### 왜 필요한가

$$
\text{\textbf{태양광은 낮에만}}, \; \text{\textbf{풍력은 바람 불 때만}}
$$

$$
\text{\textbf{생산과 소비의 시차}}\text{를 메운다}
$$

$$
\boxed{\text{\textbf{피크 부하 완화}} + \text{\textbf{주파수 조정}} + \text{\textbf{비상전원}}}
$$

## 시설장소·안전 요구사항

> KEC **511.1.1~511.1.2**

$$
\text{\textbf{화재・폭발 시 확산을 막는 구조}}
$$

$$
\text{\textbf{사람이 있는 곳과 이격}} \;-\; \text{열폭주 대비}
$$

### 옥내 대지전압 제한

> KEC **511.1.3**

$$
\boxed{\text{주택 옥내 직류전로 대지전압 } \mathbf{600}\ \mathrm{V} \text{ 까지}}
$$

$$
\text{\textbf{조건 1}} \;-\; \text{지락 시 \textbf{자동차단}}
$$

$$
\text{\textbf{조건 2}} \;-\; \text{사람이 못 닿는 \textbf{은폐 장소}}
$$

$$
\text{\textbf{직류라 교류보다 위험}}(\text{kec.1.2}) \;-\; \text{그래서 조건부}
$$

## 전기저장장치의 시설

> KEC **511.2**

| 항목 | |
|---|---|
| **전기배선** | 충분한 굵기·내열 |
| **전력변환장치** | PCS (인버터·kec.5.1) |
| **제어·보호장치** | 과충전·과방전 차단 |
| **충·방전 기능** | 과충전 방지가 핵심 |
| **계측장치** | 전압·전류·온도 감시 |

$$
\boxed{\text{\textbf{과충전 방지}}\text{가 안전의 핵심}}
$$

### 과충전이 왜 위험한가

$$
\text{\textbf{과충전}} \;\Longrightarrow\; \text{\textbf{내부 발열}} \;\Longrightarrow\; \text{\textbf{열폭주}}
$$

$$
\text{\textbf{전압・전류・온도를 계측}}\text{해 한계 넘으면 차단}
$$

$$
\boxed{\text{\textbf{BMS}}(\text{배터리 관리 시스템)}\text{가 감시}}
$$

## 이차전지의 시설 — 종류별

> KEC **512**

| 종류 | 특징 |
|---|---|
| **리튬계·나트륨계** | 에너지 밀도↑, **열폭주 위험↑** |
| **납계·니켈계·바나듐계** | 오래된 방식, 상대적 안전 |
| **흐름전지** | 액체 전해질 순환, 대용량 |

$$
\boxed{\text{\textbf{리튬계가 가장 엄하게 규제}}}
$$

### 열폭주 — 최대 위험

> KEC **512.1.3**

$$
\boxed{\text{\textbf{한 셀의 발열}} \;\Longrightarrow\; \text{\textbf{이웃 셀로 연쇄}} \;\Longrightarrow\; \text{\textbf{폭주}}}
$$

$$
\text{\textbf{리튬은 물로 끄기 어렵다}} \;-\; \text{산소 없이도 탄다}
$$

$$
\text{\textbf{한 번 시작되면}} \;-\; \text{못 멈춘다}
$$

$$
\boxed{\text{\textbf{애초에 시작을 막는다}}} \;-\; \text{과충전・과열 차단}
$$

### 리튬계 추가 규제

$$
\text{\textbf{전용건물}}\text{에 시설}(\text{512.1.5}) \;-\; \text{대용량은 독립 건물}
$$

$$
\text{\textbf{전용건물 이외}}\text{는 랙 } 50\ \mathrm{kWh} \text{ 이하 ・ 건물 총 } 600\ \mathrm{kWh} \text{ 이하}(\text{512.1.6})
$$

$$
\text{\textbf{CCTV}}\text{로 감시} \;-\; \text{영상 최소 7일 보관}
$$

$$
\text{\textbf{다른 설비와 이격}} \;-\; \text{번지지 않게}
$$

$$
\boxed{\text{\textbf{위험이 크니 규제도 세다}}} \;-\; \text{규정은 위험에 비례}(\text{kec.1.1})
$$

## 재사용 이차전지

> KEC **511.2.5**

$$
\text{\textbf{전기차 폐배터리}}(\text{kec.4.5의 회생})\text{를 재사용}
$$

$$
\text{\textbf{성능・안전 검증}}\text{을 거쳐야}
$$

$$
\boxed{\text{\textbf{회생 → 저장 → 재사용}}\text{의 순환}}(\text{kec.4.5})
$$

## 정리

$$
\boxed{\text{\textbf{ESS}}: \text{충전・방전으로 계통을 완충}}
$$

$$
\boxed{\text{\textbf{최대 위험은 열폭주}}} \;-\; \text{리튬계가 가장 엄하게}
$$

$$
\text{주택 옥내 직류 대지전압 } \mathbf{600}\ \mathrm{V} \text{ 까지} \;-\; \text{지락 차단・은폐 조건}
$$

$$
\text{\textbf{과충전 방지} → \textbf{열폭주 방지}} \;-\; \text{계측・BMS로}
$$

$$
\boxed{\text{\textbf{재생에너지의 짝}}}(\text{kec.5.1}) \;-\; \text{들쭉날쭉을 메운다}
$$
