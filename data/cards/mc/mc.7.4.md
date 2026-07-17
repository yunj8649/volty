---
id: mc.7.4
title: 보호기기의 종류
status: reviewed
summary: 무엇으로부터 무엇을 지키느냐로 갈린다. 과전류·지락·과전압이 세 축이다.
covers:
  - mc.7.4.1
formulas:
  - label: 세 가지 사고
    tex: \text{\textbf{과전류}}(\text{단락・과부하}) \cdot \text{\textbf{지락}} \cdot \text{\textbf{과전압}}(\text{뇌・개폐})
    note: 보호기기는 이 셋 중 하나를 막는다.
  - label: 차단기 vs 퓨즈
    tex: \text{차단기} = \text{\textbf{재사용}} \cdot \text{조작 가능} \qquad \text{퓨즈} = \text{\textbf{일회용}} \cdot \text{싸고 빠르다}
    note: 퓨즈는 **한류 효과**가 있어 대전류를 더 잘 끊는다.
  - label: 계전기의 역할
    tex: \text{\textbf{검출}} \to \text{\textbf{판단}} \to \text{차단기에 \textbf{명령}}
    note: 계전기는 끊지 않는다. **차단기가 끊는다**.
traps:
  - '**계전기는 사고를 끊지 않는다.** 판단해서 차단기에 명령할 뿐이다.'
  - '**퓨즈는 한류 효과**가 있다. 차단기보다 먼저 끊어 사고 전류의 피크를 낮춘다.'
  - '**ELB(누전차단기)는 지락, MCCB(배선용차단기)는 과전류**를 막는다. 역할이 다르다.'
  - 열동계전기(THR)는 **과부하**를 막지 단락은 못 막는다. 느리기 때문.
related:
  - pw.1.6
  - pw.4.4
  - mc.4.10
---

## 보호기기란

$$
\boxed{\text{\textbf{사고로부터 기기와 사람을 지키는} 것}}
$$

$$
\text{\textbf{세 가지 사고}}\text{를 막는다}
$$

| 사고 | 원인 | 막는 기기 |
|---|---|---|
| **과전류** | **단락 · 과부하** | 차단기 · 퓨즈 · **OCR** |
| **지락** | 절연 파괴 | **ELB · GR · ZCT** |
| **과전압** | **뇌 · 개폐** | **피뢰기** · SPD |

$$
\text{\textbf{pw.1.6・pw.4.4에서 계통 관점}}\text{으로 봤다면}
$$

$$
\text{\textbf{여기서는 기기 관점}} \;-\; \text{전동기・수배전반을 지키는 물건들}
$$

## 검출과 차단은 다른 일이다

$$
\boxed{\text{\textbf{계전기는 끊지 않는다}}}
$$

$$
\text{\textbf{계전기}}(\text{검출・판단}) \to \text{\textbf{차단기}}(\text{실제로 끊음})
$$

$$
\text{\textbf{역할 분담}}
$$

| | 하는 일 |
|---|---|
| **CT · PT** | **크기를 줄여** 계전기에 준다 (mc.4.10) |
| **계전기** | **판단**하고 **명령** |
| **차단기** | **아크를 끊는다** (pw.4.4) |

$$
\text{\textbf{계전기가 "끊어라"라고 하면 차단기가 끊는다}}
$$

**시험에서 헷갈리는 지점**이다. 계전기는 신호를 보낼 뿐이다.

$$
\text{\textbf{퓨즈만은 예외}} \;-\; \text{\textbf{검출과 차단을 혼자} 한다}
$$

## 과전류 보호

### 차단기

| 종류 | 용도 |
|---|---|
| **MCCB**(배선용차단기) | **저압** 과전류 |
| **ACB**(기중차단기) | 저압 대용량 |
| **VCB**(진공차단기) | **고압** — **주력** (pw.4.4) |
| **GCB**($\mathrm{SF_6}$) | 초고압 |

$$
\text{pw.4.4에서 \textbf{소호 방식}}\text{으로 나눴던 그것}
$$

$$
\text{\textbf{VCB가 고압의 표준}} \;-\; \text{진공에서 아크가 확산으로 소멸}
$$

### 퓨즈

$$
\boxed{\text{\textbf{녹아서} 끊는다} \;-\; \text{검출과 차단을 혼자}}
$$

| 장점 | 단점 |
|---|---|
| **싸다** | **일회용** |
| **작다** | **재투입 불가** |
| **빠르다** | **결상 위험** (한 상만 끊김) |
| **한류 효과** | 특성 조정 불가 |

$$
\boxed{\text{\textbf{한류 효과}}\text{가 퓨즈의 최대 무기}}
$$

$$
\text{\textbf{사고 전류가 최대에 이르기 전에} 끊는다} \;\Longrightarrow\; \text{\textbf{피크를 낮춘다}}
$$

$$
\text{차단기는 \textbf{반 주기 이상}}\text{ 걸리는데} \;\Longrightarrow\; \text{퓨즈는 \textbf{그전에} 녹는다}
$$

$$
\text{\textbf{후비 보호}}\text{에 쓴다} \;-\; \text{차단기 용량이 부족할 때 퓨즈가 먼저 끊어 준다}
$$

**pw.3.4의 차단용량**과 이어진다. 단락전류가 차단기 용량을 넘으면, 퓨즈로 한류해서
차단기를 지킨다.

$$
\text{\textbf{PF}}(\text{전력퓨즈})\text{ + VCB 조합이 흔하다}
$$

### 열동계전기 (THR)

$$
\boxed{\text{\textbf{과부하}}\text{를 막는다} \;-\; \text{\textbf{단락은 못 막는다}}}
$$

$$
\text{\textbf{바이메탈}}\text{이 열로 휘어 접점을 연다}
$$

$$
\text{\textbf{느리다}} \;-\; \text{열이 쌓여야 하니}
$$

$$
\text{\textbf{그래서 단락은 못 막는다}} \;-\; \text{단락은 순식간이라}
$$

$$
\boxed{\text{\textbf{THR}}(\text{과부하}) + \text{\textbf{퓨즈・차단기}}(\text{단락}) \;-\; \text{짝을 이룬다}}
$$

**전동기 보호의 표준 구성**이다.

$$
\text{\textbf{MC}}(\text{전자접촉기}) + \text{\textbf{THR}} = \text{\textbf{전자개폐기}}(\text{MS})
$$

$$
\text{느린 과부하는 THR, 빠른 단락은 퓨즈} \;-\; \text{\textbf{시간 영역을 나눠} 지킨다}
$$

**EOCR**(전자식 과전류 계전기)이 요즘 표준이다. 바이메탈 대신 CT와 전자회로로 재서
**더 정확하고 조정이 쉽다.**

### 과전류계전기 (OCR)

$$
\text{\textbf{CT로 전류를 받아}} \;\Longrightarrow\; \text{설정값을 넘으면} \;\Longrightarrow\; \text{\textbf{차단기에 명령}}
$$

$$
\text{\textbf{51}}(\text{과전류}), \; \text{\textbf{50}}(\text{순시 과전류}) \;-\; \text{pw.1.6의 번호}
$$

| 특성 | |
|---|---|
| **순시** | 즉시 |
| **정한시** | 일정 시간 |
| **반한시** | **전류가 클수록 빨리** |
| **반한시성 정한시** | 조합 |

$$
\text{\textbf{반한시}}\text{가 표준} \;-\; \text{사고가 클수록 급하니}
$$

## 지락 보호

$$
\boxed{\text{\textbf{나가는 전류와 돌아오는 전류의 차}}\text{를 본다}}
$$

$$
I_a + I_b + I_c \neq 0 \;\Longrightarrow\; \text{\textbf{땅으로 새고 있다}}
$$

### ELB (누전차단기)

$$
\text{\textbf{ZCT}}(\text{mc.4.10})\text{로 영상전류를 검출} \;\Longrightarrow\; \text{\textbf{스스로 끊는다}}
$$

$$
\text{\textbf{검출 + 차단을 한 몸에}} \;-\; \text{퓨즈처럼}
$$

| 정격감도전류 | 용도 |
|---|---|
| **15 mA** | **인체 보호** (고감도·고속형) |
| **30 mA** | **일반** (인체 보호) |
| 100~200 mA | 화재 보호 |

$$
\boxed{30\ \mathrm{mA} \cdot 0.03 \text{ 초}} \;-\; \text{가정용의 표준}
$$

$$
\text{\textbf{인체가 견디는 한계}}\text{에서 나온 숫자}
$$

**심실세동 전류**가 대략 $50\ \mathrm{mA}$ 수준이라 그 아래에서 끊는다. **시간도
중요**해서 감도와 속도를 같이 규정한다.

### 지락계전기 (GR · SGR · DGR)

| 계전기 | |
|---|---|
| **GR** | 지락 검출 (**영상전류**만) |
| **SGR** | **선택** 지락 — **어느 회선**인지 |
| **DGR** | **방향성** 지락 |
| **OVGR** | 지락 **과전압** (**영상전압**) |

$$
\text{\textbf{ZCT}}(\text{영상전류}) + \text{\textbf{GPT}}(\text{영상전압}) \;\Longrightarrow\; \text{\textbf{방향}}\text{을 안다}(\text{mc.4.10})
$$

$$
\text{\textbf{전류만으로는 어느 쪽인지 모른다}} \;-\; \text{전압과 비교해야 방향이 나온다}
$$

**pw.4.1의 비접지 계통**에서 지락 검출이 어려운 이유가 이것이다.

## 과전압 보호

### 피뢰기 (LA)

$$
\text{\textbf{뇌 서지}}\text{를 대지로 흘린다}(\text{pw.4.2})
$$

$$
\text{\textbf{제한전압}}\text{ 이하로 눌러 기기를 지킨다}
$$

$$
\text{\textbf{속류를 차단}}\text{하고 원상 복귀}
$$

| 종류 | |
|---|---|
| **갭형** | 직렬 갭 + 특성요소 |
| **갭리스**(ZnO) | **주력** — 갭이 없다 |

$$
\text{\textbf{산화아연}}(\mathrm{ZnO})\text{의 \textbf{비직선 저항}} \;-\; \text{전압이 오르면 저항이 급감}
$$

$$
\text{\textbf{갭이 필요 없다}} \;-\; \text{평소엔 절연체, 서지엔 도체}
$$

### SPD (서지보호장치)

$$
\text{\textbf{저압}}\text{용 피뢰기} \;-\; \text{콘센트・통신선에}
$$

$$
\text{\textbf{피뢰기는 고압, SPD는 저압}} \;-\; \text{하는 일은 같다}
$$

## 정리

$$
\boxed{\text{\textbf{계전기는 판단, 차단기는 차단}} \;-\; \text{퓨즈・ELB만 혼자 다 한다}}
$$

| 사고 | 기기 |
|---|---|
| **단락** | **퓨즈** · 차단기 · **OCR(50/51)** |
| **과부하** | **THR · EOCR** |
| **지락** | **ELB · ZCT · GR** |
| **과전압** | **피뢰기 · SPD** |

$$
\text{\textbf{전동기 보호} = MC + THR + 퓨즈} \;-\; \text{\textbf{시간 영역을 나눠} 지킨다}
$$

$$
\text{느린 과부하} \to \text{THR} \qquad \text{빠른 단락} \to \text{퓨즈}
$$

**하나의 기기로 다 못 막는다.** 사고의 성격과 시간 규모가 다르기 때문이다.
