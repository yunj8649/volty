---
id: mc.7.7
title: 제어장치 및 보호장치
status: reviewed
summary: 시퀀스 제어의 자기유지가 전부다. 정전되면 풀리는 게 안전 설계다.
covers:
  - mc.7.7.1
  - mc.7.7.2
formulas:
  - label: 자기유지 회로
    tex: \text{\textbf{기동 버튼}} \to \text{\textbf{a접점으로 자기 코일}}\text{을 물어 유지}
    note: 손을 떼도 계속 동작. **정전되면 풀린다** — 이게 안전.
  - label: 인터록
    tex: \text{\textbf{상대의 b접점}}\text{을 서로 물린다} \;\Longrightarrow\; \text{동시 투입 불가}
    note: 정·역회전, Y-Δ 전환에 필수.
  - label: 시퀀스 vs 피드백
    tex: \text{\textbf{시퀀스}} = \text{정해진 순서} \qquad \text{\textbf{피드백}} = \text{결과를 보고 수정}
    note: 개루프냐 폐루프냐.
  - label: 접점의 표기
    tex: \text{\textbf{a접점}}(\text{평소 열림}) \quad \text{\textbf{b접점}}(\text{평소 닫힘}) \quad \text{\textbf{c접점}}(\text{전환})
    note: NO · NC · COM.
traps:
  - '**자기유지 회로는 정전되면 풀린다.** 복전 시 저절로 안 돌아간다 — 이게 안전 설계다.'
  - '**인터록은 상대의 b접점**을 물리는 것이다. a접점이 아니다.'
  - '**a접점은 평소 열림(NO), b접점은 평소 닫힘(NC)**이다.'
  - 비상정지는 **반드시 b접점**을 쓴다. 선이 끊어져도 정지하도록.
related:
  - mc.7.4
  - mc.1.8
  - mc.5.3
---

## 제어장치

$$
\text{\textbf{시퀀스 제어}}\text{가 기본}
$$

$$
\boxed{\text{\textbf{정해진 순서}}\text{대로 진행}}
$$

| | **시퀀스 제어** | **피드백 제어** |
|---|---|---|
| **방식** | **순서대로** | **결과를 보고 수정** |
| **루프** | **개루프** | **폐루프** |
| **예** | 세탁기 · 신호등 · **전동기 기동** | 온도 · 속도 · 위치 |

$$
\text{\textbf{mc.7.1의 스테핑 vs 서보}}\text{와 같은 대비}
$$

## 접점

$$
\boxed{\text{\textbf{a접점}}(\text{NO}) \quad \text{\textbf{b접점}}(\text{NC}) \quad \text{\textbf{c접점}}(\text{전환})}
$$

| 접점 | 평소 | 동작하면 |
|---|---|---|
| **a접점** (NO) | **열림** | **닫힘** |
| **b접점** (NC) | **닫힘** | **열림** |
| **c접점** | 전환 | 반대로 |

$$
\text{\textbf{a = arbeit}}(\text{일), \textbf{b = break}}(\text{끊음})
$$

$$
\text{\textbf{"a는 눌러야 붙고, b는 눌러야 떨어진다"}}
$$

## 자기유지 회로 — 시퀀스의 핵심

$$
\boxed{\text{\textbf{손을 떼도 계속 동작}}}
$$

$$
\text{\textbf{기동 버튼}}(\text{a접점, 누름}) \to \text{릴레이 코일 여자} \to \text{\textbf{자기 a접점이 닫힘}} \to \text{\textbf{버튼을 놓아도 유지}}
$$

$$
\text{\textbf{자기 접점으로 자기를 물고 있다}} \;-\; \text{그래서 자기유지}
$$

### 정지 버튼은 b접점

$$
\text{\textbf{정지 버튼}}\text{을 \textbf{b접점}}\text{으로 직렬에}
$$

$$
\text{누르면} \to \text{회로가 끊김} \to \text{코일 소자} \to \text{\textbf{자기유지 해제}}
$$

$$
\boxed{\text{\textbf{정지가 우선}}} \;-\; \text{기동 버튼을 누르고 있어도 정지가 이긴다}
$$

### 정전되면 풀린다 — 이게 핵심

$$
\boxed{\textbf{정전} \Longrightarrow \textbf{코일 소자} \Longrightarrow \textbf{자기유지 해제}}
$$

$$
\text{\textbf{복전되어도 저절로 안 돌아간다}}
$$

$$
\text{\textbf{사람이 다시 기동 버튼을 눌러야}}
$$

$$
\text{\textbf{이게 안전 설계}}
$$

**정전 중에 사람이 기계에 손을 댔는데** 복전과 함께 저절로 돌면 큰일이다. 자기유지가
그걸 막는다.

$$
\text{\textbf{mc.1.8의 3점 기동기 무전압 코일}}\text{과 같은 사상}
$$

**직류기의 기동기**도 정전되면 손잡이가 튕겨 나왔다. 같은 생각이다.

$$
\text{\textbf{mc.5.3의 무여자 작동형 브레이크}}\text{도 마찬가지}
$$

$$
\boxed{\text{\textbf{전기가 끊기면 안전한 쪽으로}}} \;-\; \text{페일세이프}
$$

**전기기기 전체를 관통하는 안전 사상**이다. 세 카드에서 같은 원리가 나왔다.

## 인터록

$$
\boxed{\text{\textbf{상대의 b접점}}\text{을 서로 물린다}}
$$

$$
\text{A가 동작 중이면} \;\Longrightarrow\; \text{\textbf{A의 b접점이 열림}} \;\Longrightarrow\; \text{\textbf{B가 못 동작}}
$$

$$
\text{\textbf{동시 투입 불가}}
$$

### 어디에 쓰나

| 용도 | 왜 |
|---|---|
| **정·역회전** | **동시 투입 = 단락** |
| **Y-$\Delta$ 전환** | 동시 투입 = 단락 (mc.5.3) |
| **주회로 · 비상발전** | 동시 투입 = **역송전** |
| 상용 · 예비 전원 | |

$$
\text{\textbf{정회전 MC와 역회전 MC가 동시에}} \;\Longrightarrow\; \text{\textbf{2상이 단락}}
$$

**mc.5.1에서 "두 상을 바꾸면 역회전"** 이라고 했다. 정회전 접촉기와 역회전 접촉기가
동시에 붙으면 **그 두 상이 단락**된다.

$$
\text{\textbf{반드시 인터록}}
$$

$$
\text{\textbf{전기적 인터록}}(\text{b접점}) + \text{\textbf{기계적 인터록}}(\text{물리적 걸쇠})
$$

$$
\text{\textbf{둘 다 쓴다}} \;-\; \text{전기가 실패해도 기계가 막게}
$$

**중요한 곳은 이중으로** 한다. 단락은 되돌릴 수 없다.

## 주요 기기

| 기기 | 하는 일 |
|---|---|
| **MC**(전자접촉기) | 주회로 개폐 |
| **MS**(전자개폐기) | **MC + THR** |
| **릴레이**(R) | 보조 접점 |
| **타이머**(T) | 시간 지연 |
| **PB**(누름버튼) | 기동·정지 |
| **LS**(리밋스위치) | 위치 검출 |
| **PLC** | **프로그램**으로 시퀀스 |

$$
\boxed{\text{\textbf{MS = MC + THR}}} \;-\; \text{전동기 보호의 표준}(\text{mc.7.4})
$$

### PLC

$$
\text{\textbf{배선 대신 프로그램}}
$$

$$
\text{옛날: 릴레이 수십 개 \textbf{배선}} \;\Longrightarrow\; \text{지금: \textbf{PLC 하나}}
$$

| 장점 | |
|---|---|
| **변경이 쉽다** | 프로그램만 |
| **작다** | |
| **신뢰성** | 접점 마모 없음 |
| **통신·감시** | |

$$
\text{\textbf{래더 다이어그램}} \;-\; \text{릴레이 회로도를 그대로 흉내낸 언어}
$$

$$
\text{\textbf{기존 기술자가 바로 쓸 수 있게}} \;-\; \text{영리한 설계}
$$

$$
\boxed{\text{\textbf{또 반도체가}}} \;-\; \text{릴레이 반, 계전기, 정류자, 회전기에 이어}
$$

## 보호장치

$$
\text{\textbf{제어와 보호는 한 몸}}\text{으로 설계된다}
$$

### 전동기 회로의 표준 구성

$$
\text{전원} \to \text{\textbf{차단기}}(\text{단락}) \to \text{\textbf{MC}}(\text{개폐}) \to \text{\textbf{THR}}(\text{과부하}) \to \text{전동기}
$$

| 기기 | 막는 것 |
|---|---|
| **차단기 · 퓨즈** | **단락** (빠름) |
| **THR · EOCR** | **과부하** (느림) |
| **ELB** | **지락** |
| **결상 계전기** | **결상** |

$$
\boxed{\text{\textbf{시간 영역을 나눠} 지킨다}}(\text{mc.7.4})
$$

### 결상 보호

$$
\text{\textbf{3상 중 한 상이 끊기면}} \;\Longrightarrow\; \text{\textbf{단상 운전}} \;\Longrightarrow\; \text{\textbf{소손}}
$$

$$
\text{남은 두 상에 \textbf{과전류}} \;\Longrightarrow\; \text{과열}
$$

$$
\text{\textbf{돌고 있으면 계속 돈다}} \;-\; \text{mc.5.7의 단상 원리로}
$$

**이게 무서운 점**이다. 결상이 나도 **이미 돌고 있으면 멈추지 않는다.** 소리만 조금
달라지고 계속 돌다가 탄다.

$$
\text{\textbf{정지 상태에서 결상이면}} \;\Longrightarrow\; \text{\textbf{기동 못 함}}(\text{단상은 기동토크 0})
$$

$$
\text{\textbf{퓨즈의 결상 위험}}(\text{mc.7.4})\text{이 이것} \;-\; \text{한 상만 녹으면}
$$

$$
\text{\textbf{그래서 3상은 차단기}}\text{가 낫다} \;-\; \text{3상을 동시에 끊으니}
$$

**mc.5.6의 게르게스 현상**과도 이어진다. 결상은 여러 형태로 말썽을 부린다.

## 정리

$$
\boxed{\text{\textbf{자기유지}} \;-\; \text{손을 떼도 유지, \textbf{정전되면 풀림}}}
$$

$$
\boxed{\text{\textbf{인터록}} \;-\; \text{\textbf{상대의 b접점}}\text{을 물어 동시 투입 방지}}
$$

| 접점 | 평소 |
|---|---|
| **a** (NO) | **열림** |
| **b** (NC) | **닫힘** |

$$
\text{\textbf{비상정지는 반드시 b접점}} \;-\; \text{\textbf{선이 끊어져도 정지}}\text{하도록}
$$

**a접점으로 만들면** 배선이 끊겼을 때 비상정지가 안 눌린다. **b접점이면 선이 끊기는
것 자체가 정지 신호**다.

$$
\boxed{\text{\textbf{고장이 나면 안전한 쪽으로}}} \;-\; \text{페일세이프}
$$

$$
\text{\textbf{무전압 코일}}(\text{mc.1.8}) \cdot \text{\textbf{무여자 브레이크}}(\text{mc.5.3}) \cdot \text{\textbf{자기유지}} \cdot \text{\textbf{b접점 비상정지}}
$$

**네 곳에서 같은 사상**이 나왔다. 전기기기를 관통하는 하나의 원칙이다.
