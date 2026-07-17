---
id: mc.7.5
title: 보호기기의 구조 및 원리
status: reviewed
summary: 무엇으로 아크를 끄고 무엇으로 사고를 감지하느냐. 진공과 SF6가 소호의 답이다.
covers:
  - mc.7.5.1
  - mc.7.5.2
formulas:
  - label: 차단기의 일
    tex: \text{\textbf{아크를 끈다}} \;-\; \text{전류 영점에서 \textbf{절연을 회복}}
    note: 교류라 1주기에 두 번 영점이 온다. 그 순간을 노린다.
  - label: 진공차단기
    tex: \text{진공} \;\Longrightarrow\; \text{\textbf{아크 확산}} \;\Longrightarrow\; \text{소호}
    note: 매질이 없어 아크가 퍼져 사라진다. **고압의 주력**.
  - label: 계전기의 동작 원리
    tex: \text{\textbf{전자력}} \;\text{또는}\; \text{\textbf{유도원판}} \;\text{또는}\; \text{\textbf{디지털}}
    note: 요즘은 디지털(마이크로프로세서)이 표준.
  - label: 바이메탈
    tex: \text{열팽창계수가 \textbf{다른 두 금속}} \;\Longrightarrow\; \text{열에 \textbf{휜다}}
    note: THR의 원리. 열이 쌓여야 하니 느리다.
traps:
  - '**차단기는 전류 영점에서 끊는다.** 아무 때나 못 끊는다. 직류 차단이 어려운 이유.'
  - '**진공차단기는 매질이 없어** 아크가 확산으로 소멸한다. 소호 매질을 쓰는 게 아니다.'
  - '**유도원판형 계전기는 아라고 원판**(mc.5.1)과 같은 원리다.'
  - 바이메탈은 **열팽창계수 차이**로 휜다. 전류를 직접 감지하는 게 아니라 열을 감지한다.
related:
  - mc.7.4
  - pw.4.4
  - mc.5.1
---

## 구조

### 차단기

$$
\boxed{\text{\textbf{차단기의 일 = 아크를 끄는 것}}}
$$

$$
\text{\textbf{접점을 벌리면}} \;\Longrightarrow\; \text{\textbf{아크}}\text{가 이어진다} \;\Longrightarrow\; \text{전류가 안 끊긴다}
$$

$$
\text{\textbf{아크를 못 끄면 차단이 아니다}}
$$

**em.8.7의 방전현상**이 여기서 문제가 된다. 기체가 이온화되어 도체가 된다.

### 전류 영점에서 끊는다

$$
\boxed{\text{교류는 \textbf{1주기에 두 번} 전류가 0을 지난다}}
$$

$$
\text{\textbf{그 순간 아크가 저절로 꺼진다}} \;\Longrightarrow\; \text{그때 \textbf{절연을 회복}}\text{시키면 끝}
$$

$$
\text{\textbf{재점호를 막는 게 전부}}
$$

$$
\text{전류 영점 직후 \textbf{과도회복전압}}(\text{TRV})\text{이 걸린다} \;\Longrightarrow\; \text{\textbf{그걸 견뎌야}}
$$

$$
\text{\textbf{절연 회복 속도} vs \textbf{TRV 상승 속도}} \;-\; \text{이 경주에서 이겨야 차단}
$$

**pw.4.4에서 본 그것**이다. 차단기의 성능은 **얼마나 빨리 절연을 회복하느냐**다.

$$
\boxed{\text{\textbf{직류는 영점이 없다}}} \;\Longrightarrow\; \text{\textbf{차단이 훨씬 어렵다}}
$$

**mc.3.1의 SCR**이 직류를 못 끄던 것과 같은 이유다. **영점이 없으면 끊을 기회가
없다.** HVDC 차단기가 어려운 이유이기도 하다.

$$
\text{\textbf{교류가 고마운 지점}}
$$

### 소호 방식

| 차단기 | 소호 매질 | 원리 |
|---|---|---|
| **VCB** | **진공** | **아크 확산** |
| **GCB** | $\mathrm{SF_6}$ | **전자 흡착** |
| **ABB** | **압축공기** | 불어 끔 |
| **OCB** | **절연유** | 유증기의 냉각 |
| **MBB** | 자기력 | 아크를 늘려 |
| **ACB** | 대기 | 아크슈트로 |

$$
\text{pw.4.4의 표}\text{와 같다}
$$

### 진공차단기 (VCB)

$$
\boxed{\text{\textbf{매질이 없어서} 아크가 \textbf{확산}}\text{으로 사라진다}}
$$

$$
\text{\textbf{소호 매질을 쓰는 게 아니다}} \;-\; \text{다른 차단기와 발상이 반대}
$$

$$
\text{진공}(10^{-4}\ \mathrm{Pa}\ \text{이하}) \;\Longrightarrow\; \text{\textbf{이온화될 기체가 없다}}
$$

$$
\text{아크는 \textbf{금속 증기}}\text{로 이어지는데} \;\Longrightarrow\; \text{영점에서 \textbf{순식간에 확산}} \;\Longrightarrow\; \text{\textbf{절연 회복}}
$$

$$
\text{\textbf{절연 회복이 가장 빠르다}} \;-\; \text{그래서 고압의 주력}
$$

| 장점 | 단점 |
|---|---|
| **소형·경량** | **재점호** 가능성 |
| **보수 불필요** | **개폐 서지** 큼 |
| **화재 위험 없음** | 진공 유지 |
| **수명 길다** | |

$$
\text{\textbf{개폐 서지가 크다}}\text{는 게 약점} \;-\; \text{너무 빨리 끊어서}
$$

$$
\text{\textbf{전류 재단}}(\text{current chopping}) \;\Longrightarrow\; L\dfrac{di}{dt} \;\Longrightarrow\; \text{\textbf{고전압}}
$$

**영점을 기다리지 않고 미리 끊어 버리는** 경우가 있다. 그러면 $L\frac{di}{dt}$ 로
큰 서지가 생긴다.

$$
\text{\textbf{서지 흡수기}}(\text{SA})\text{를 같이 단다} \;-\; \text{VCB + SA가 표준 조합}
$$

### 가스차단기 (GCB)

$$
\mathrm{SF_6} \text{ 가 \textbf{전자를 흡착}}\text{한다}
$$

$$
\text{\textbf{음전성}}(\text{electronegative}) \;\Longrightarrow\; \text{자유전자를 붙잡아} \;\Longrightarrow\; \text{\textbf{이온화 억제}}
$$

$$
\text{절연내력이 \textbf{공기의 2~3배}}, \text{ 소호 능력 \textbf{100배}}
$$

$$
\text{\textbf{초고압의 표준}} \;-\; \text{다만 } \mathrm{SF_6} \text{ 는 \textbf{온실가스}}(\text{mc.4.7})
$$

### 계전기

$$
\text{\textbf{세 세대}}\text{가 있다}
$$

| 세대 | 원리 |
|---|---|
| **전자기형** | **전자력**으로 접점 |
| **유도형** | **유도원판** |
| **정지형** | 반도체 |
| **디지털형** | **마이크로프로세서** — **주력** |

### 전자기형 계전기

$$
\text{\textbf{전자석}}\text{이 철편을 당긴다}
$$

$$
F \propto I^2 \;\Longrightarrow\; \text{전류가 크면 세게 당김} \;\Longrightarrow\; \text{\textbf{순시}} \text{ 동작}
$$

$$
\text{\textbf{빠르다}} \;-\; \text{순시 과전류(50번)에}
$$

### 유도형 계전기

$$
\boxed{\text{\textbf{아라고 원판}}(\text{mc.5.1})\text{과 같은 원리}}
$$

$$
\text{전류 → 자속 → 원판에 \textbf{와전류} → 힘 → 원판 회전 → 접점}
$$

$$
\text{\textbf{원판이 돌아야} 하니} \;\Longrightarrow\; \text{\textbf{시간이 걸린다}}
$$

$$
\text{\textbf{전류가 크면 빨리 돈다}} \;\Longrightarrow\; \boxed{\text{\textbf{반한시 특성}}}
$$

$$
\text{\textbf{유도전동기와 같은 물리로 시간 특성}}\text{을 만든다}
$$

**mc.7.4의 반한시**가 여기서 나온다. **기계적으로 자연스럽게** 반한시가 되는 게
유도형의 매력이었다.

$$
\text{\textbf{제동 자석}}\text{으로 회전 속도를 조절} \;\Longrightarrow\; \text{시간 정정}(\text{TAP})
$$

### 디지털형 계전기

$$
\text{\textbf{전류를 샘플링}} \to \text{\textbf{계산}} \to \text{판단}
$$

| 장점 | |
|---|---|
| **여러 기능을 하나에** | OCR + GR + ... |
| **정정이 자유** | 소프트웨어로 |
| **자기진단** | |
| **통신** | SCADA 연계 |
| **사고 기록** | 파형 저장 |

$$
\boxed{\text{\textbf{또 반도체가 이겼다}}}
$$

$$
\text{\textbf{유도원판 하나 = 계전기 하나}} \;\Longrightarrow\; \text{\textbf{디지털 하나 = 계전기 수십 개}}
$$

**mc.6에서 인버터가 회전기를 지운 것**과 같은 이야기다. 마이크로프로세서가 계전기를
지웠다.

### 바이메탈

$$
\boxed{\text{\textbf{열팽창계수가 다른} 두 금속을 붙인다}}
$$

$$
\text{가열} \;\Longrightarrow\; \text{한쪽이 더 늘어남} \;\Longrightarrow\; \text{\textbf{휜다}} \;\Longrightarrow\; \text{접점}
$$

$$
\text{\textbf{THR의 원리}}(\text{mc.7.4})
$$

$$
\text{\textbf{전류가 아니라 열을 감지}}\text{한다}
$$

$$
\text{\textbf{열이 쌓여야}} \;\Longrightarrow\; \text{\textbf{느리다}} \;\Longrightarrow\; \text{단락은 못 막는다}
$$

$$
\text{\textbf{그런데 그게 장점}}\text{이기도} \;-\; \text{전동기의 \textbf{열 시정수}}\text{를 흉내낸다}
$$

**전동기가 타는 건 열 때문**이다. 바이메탈도 열로 동작하니 **전동기와 비슷한 속도로
반응**한다. 짧은 기동전류에는 안 걸리고 지속적 과부하에만 걸린다.

$$
\boxed{\text{\textbf{느린 게 오히려 맞다}} \;-\; \text{기동전류에 오동작하면 안 되니}}
$$

$$
\text{\textbf{기동전류 5~7배}}(\text{mc.5.3})\text{가 몇 초 흘러도} \;\Longrightarrow\; \text{THR은 안 걸린다}
$$

**설계가 영리하다.** 보호할 대상과 같은 물리로 반응하게 만들었다.

## 동작원리

| 기기 | 감지 | 동작 |
|---|---|---|
| **VCB** | (계전기가) | **진공 확산** |
| **THR** | **열** (바이메탈) | 접점 개방 |
| **유도형 계전기** | **와전류** (아라고) | **반한시** 회전 |
| **디지털 계전기** | **샘플링** | 계산 |
| **ELB** | **영상전류** (ZCT) | 자체 차단 |
| **피뢰기** | **전압** ($\mathrm{ZnO}$ 비직선) | 방전 |

$$
\boxed{\text{\textbf{교류의 전류 영점}}\text{이 차단을 가능하게 한다}}
$$

$$
\text{\textbf{직류는 영점이 없어 훨씬 어렵다}} \;-\; \text{mc.3.1의 SCR과 같은 사정}
$$
