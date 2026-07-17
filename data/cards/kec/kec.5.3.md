---
id: kec.5.3
title: 태양광발전설비
status: reviewed
summary: 모듈이 심장이고 인버터가 뇌다. 직렬군은 같은 단락전류로 맞춰야 하고, MPPT로 최대 전력을 뽑는다.
covers:
  - kec.5.3.1
  - kec.5.3.2
formulas:
  - label: 옥내 대지전압 (KEC 521.3)
    tex: \text{주택 옥내 대지전압 } \mathbf{600}\ \mathrm{V} \text{ 까지} \;-\; \text{511.1.3 준용}
    note: 전기저장장치(kec.5.2)와 같은 조건.
  - label: 직렬군 (KEC 522.2.1)
    tex: \text{한 직렬군은 \textbf{동일 단락전류}} \;-\; \text{2병렬 이상이면 전압・전류 동일}
    note: 다르면 약한 모듈로 전류가 몰려 손실·발열.
  - label: 보호장치 (KEC 522.3.2)
    tex: \text{\textbf{과전류}} + \text{\textbf{지락}} + \text{\textbf{아크}} \text{ 보호}
    note: 태양광 특유의 아크(직류) 화재를 막는다.
traps:
  - '**직렬군은 같은 단락전류로** 구성한다 — 안 맞으면 약한 모듈에 몰린다.'
  - '**직류 아크 보호**가 태양광 특유다 — 직류는 아크가 안 꺼진다.'
  - '**MPPT로 최대 전력**을 뽑는다(kec.5.1) — 인버터가 승압 초퍼로.'
related:
  - kec.5.1
  - kec.5.2
  - mc.3.3
---

> KEC **520** (521 일반사항 · 522 태양광설비의 시설) — 시행 2026. 1. 5. 기준

## 일반사항

> KEC **521**

$$
\boxed{\text{\textbf{태양전지 모듈}} \to \text{\textbf{인버터}} \to \text{\textbf{계통}}}
$$

$$
\text{\textbf{모듈이 심장}}, \; \text{\textbf{인버터가 뇌}}
$$

$$
\textbf{빛} \to \text{직류}(\text{모듈}) \to \text{\textbf{교류}}(\text{인버터}) \to \text{\textbf{계통}}
$$

### 설치장소·안전 요구사항

> KEC **521.1~521.2**

$$
\text{\textbf{자체중량・적설・풍압・지진}}\text{에 견디게}
$$

$$
\text{\textbf{모듈은 옥외 노출}} \;-\; \text{환경 하중이 크다}
$$

### 옥내 대지전압 제한

> KEC **521.3**

$$
\boxed{\text{주택 옥내 대지전압 } \mathbf{600}\ \mathrm{V} \text{ 까지}}(\text{511.1.3 준용})
$$

$$
\text{\textbf{전기저장장치와 같은 조건}}(\text{kec.5.2}) \;-\; \text{지락 차단・은폐}
$$

## 태양광설비의 시설

> KEC **522**

## 모듈의 시설 — 핵심

> KEC **522.2.1**

$$
\boxed{\text{\textbf{한 직렬군은 동일 단락전류}}}
$$

$$
\text{\textbf{모듈을 직렬로 잇는다}} \;-\; \text{전압을 높이려고}
$$

$$
\text{\textbf{직렬이면 전류는 하나}} \;-\; \text{가장 약한 모듈이 전체를 정한다}
$$

### 왜 같은 단락전류여야 하나

$$
\text{\textbf{직렬군의 전류}} = \text{\textbf{가장 약한 모듈의 전류}}
$$

$$
\text{\textbf{그늘・불량으로 한 장이 약하면}} \;\Longrightarrow\; \text{\textbf{전체 전류가 준다}}
$$

$$
\text{\textbf{약한 모듈에 역전압}} \;\Longrightarrow\; \text{\textbf{핫스팟}}(\text{발열・손상})
$$

$$
\boxed{\text{\textbf{바이패스 다이오드}}\text{로 우회}} \;-\; \text{약한 셀을 건너뛴다}
$$

$$
\text{\textbf{2병렬 이상}}\text{이면 각 직렬군의 \textbf{전압・전류를 동일}}\text{하게}
$$

$$
\text{\textbf{안 맞으면 병렬 간 순환전류}} \;-\; \text{손실}(\text{mc.4.6의 병렬운전과 같은 원리})
$$

## 인버터(전력변환장치)

> KEC **522.2.2**

$$
\boxed{\textbf{직류} \to \text{교류}}(\text{mc.3.3의 인버터})
$$

$$
\text{\textbf{MPPT}}\text{로 최대 전력점 추종}(\text{kec.5.1})
$$

$$
\text{\textbf{일사량이 변해도}} \;-\; \text{매 순간 최대로}
$$

$$
\text{\textbf{계통 정전 시 분리}}(\text{kec.5.1의 단독운전 방지})
$$

## 개폐기·보호장치

> KEC **522.3**

| 장치 | 역할 |
|---|---|
| **어레이 출력 개폐기** | 점검 시 분리 |
| **과전류 보호** | 단락·과부하 |
| **지락 보호** | 누전 |
| **아크 보호** | **직류 아크 화재** |
| **피뢰설비** | 옥외 뇌 서지 |

### 직류 아크 — 태양광 특유

$$
\boxed{\text{\textbf{직류는 아크가 안 꺼진다}}}
$$

$$
\text{\textbf{교류}}\text{는 매주기 0을 지나 아크가 자연 소호}(\text{mc.7.5})
$$

$$
\text{\textbf{직류}}\text{는 0점이 없다} \;\Longrightarrow\; \text{\textbf{아크가 계속}}
$$

$$
\text{\textbf{모듈・커넥터 접촉 불량}} \;\Longrightarrow\; \text{\textbf{아크 → 화재}}
$$

$$
\boxed{\text{\textbf{아크 검출・차단이 필수}}} \;-\; \text{태양광 화재의 주원인}
$$

## 계측장치

> KEC **522.3.6**

$$
\text{\textbf{전압・전류・전력}}\text{을 계측}
$$

$$
\text{\textbf{발전량 감시}} \;-\; \text{고장 조기 발견}
$$

## 정리

$$
\boxed{\text{\textbf{모듈}}(\text{직류}) \to \text{\textbf{인버터}}(\text{교류}) \to \text{\textbf{계통}}}
$$

$$
\boxed{\text{\textbf{직렬군은 동일 단락전류}}} \;-\; \text{약한 모듈이 전체를 정하니}
$$

$$
\boxed{\text{\textbf{직류 아크 보호}}} \;-\; \text{0점이 없어 안 꺼진다}
$$

$$
\text{\textbf{MPPT}} + \text{\textbf{단독운전 방지}}(\text{kec.5.1}) \;-\; \text{인버터가 다 한다}
$$

$$
\boxed{\text{\textbf{모듈은 물리, 인버터는 반도체}}}(\text{mc.3.3}) \;-\; \text{둘이 만나 발전}
$$
