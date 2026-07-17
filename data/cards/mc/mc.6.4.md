---
id: mc.6.4
title: 단상분권 전동기
status: reviewed
summary: 계자와 전기자의 위상이 어긋나 토크가 안 나온다. 거의 안 쓰는 이유가 그것이다.
covers:
  - mc.6.4.1
  - mc.6.4.2
  - mc.6.4.3
formulas:
  - label: 왜 안 되나
    tex: T = K\phi I_a\cos\theta \;-\; \text{계자 인덕턴스로 } \theta \approx 90° \;\Longrightarrow\; T \approx 0
    note: 병렬이라 계자 전류가 크게 뒤진다. **직권과 결정적 차이**.
  - label: 대책
    tex: \text{\textbf{계자에 콘덴서}} \;\text{또는}\; \text{\textbf{저항}} \;\Longrightarrow\; \text{위상을 맞춘다}
    note: 단상유도전동기의 기동장치와 같은 발상(mc.5.7).
  - label: 결론
    tex: \text{\textbf{거의 안 쓴다}}
    note: 억지로 고쳐 쓸 바에 다른 기계를 쓴다.
traps:
  - '**단상 분권은 그대로는 토크가 거의 0**이다. 직권과 반대다. 이 대비가 출제 포인트.'
  - '**직권은 저절로 되고 분권은 안 된다** — 자속과 전류가 같이 뒤집히느냐의 차이.'
  - 단상 분권 정류자 전동기는 **실용성이 거의 없다.** 이름과 이유만 알면 된다.
related:
  - mc.6.2
  - mc.6.1
  - mc.5.7
---

## 개요

$$
\boxed{\text{\textbf{계자와 전기자가 병렬}}}
$$

$$
\text{\textbf{직류 분권}}(\text{mc.1.7})\text{을 교류에 그대로 가져오면?}
$$

$$
\boxed{\text{\textbf{거의 안 돈다}}}
$$

$$
\text{\textbf{이 단원의 결론이 먼저}} \;-\; \text{실용성이 없다}
$$

**시험에는 "왜 안 되는가"** 가 나온다. 그것만 알면 된다.

## 왜 안 되나

$$
T = K\phi I_a \cos\theta
$$

$\theta$ 는 **자속과 전기자 전류의 위상차**다.

### 직권과 비교하면

$$
\text{\textbf{직권}}: \text{계자와 전기자가 \textbf{직렬}} \;\Longrightarrow\; \text{\textbf{같은 전류}} \;\Longrightarrow\; \theta = 0 \;\Longrightarrow\; \cos\theta = 1
$$

$$
\boxed{\text{\textbf{직권은 저절로 위상이 맞는다}}}
$$

$$
\text{\textbf{분권}}: \text{계자와 전기자가 \textbf{병렬}} \;\Longrightarrow\; \text{\textbf{다른 전류}}
$$

| 회로 | 성격 | 전류의 위상 |
|---|---|---|
| **계자** | **권수 많음 → 인덕턴스 큼** | **거의 $90°$ 뒤짐** |
| **전기자** | 저항 성분이 큼 | 조금 뒤짐 |

$$
\theta \approx 90° \;\Longrightarrow\; \cos\theta \approx 0 \;\Longrightarrow\; \boxed{T \approx 0}
$$

$$
\text{\textbf{자속이 최대일 때 전류가 0, 전류가 최대일 때 자속이 0}}
$$

$$
\text{\textbf{힘이 나올 타이밍이 없다}}
$$

### 왜 계자 전류가 뒤지나

$$
\text{\textbf{분권 계자}}\text{는 \textbf{권수가 아주 많다}}(\text{mc.1.7})
$$

$$
\text{전압을 그대로 받으니} \;\Longrightarrow\; \text{전류를 작게 하려면} \;\Longrightarrow\; \text{\textbf{권수를 많이}}
$$

$$
L \propto N^2 \;\Longrightarrow\; \text{\textbf{인덕턴스가 매우 크다}} \;\Longrightarrow\; \tan\theta = \dfrac{X}{R} \ggg 1 \;\Longrightarrow\; \theta \to 90°
$$

$$
\boxed{\text{\textbf{분권 계자의 숙명}}}
$$

**직류에서는 문제가 안 됐다.** 직류는 위상이라는 게 없으니 인덕턴스가 아무리 커도
정상 상태에서는 저항만 작용한다.

$$
\text{\textbf{교류로 오니 인덕턴스가 드러났다}}
$$

$$
\text{\textbf{직류에서 장점이던 것}}(\text{계자 권수가 많아 } I_f \text{ 가 작음})\text{이 \textbf{교류에서 치명상}}
$$

## 대책

$$
\boxed{\text{\textbf{위상을 맞춰 주면 된다}}}
$$

| 방법 | |
|---|---|
| **계자에 콘덴서 직렬** | 진상으로 당김 |
| **계자에 저항 직렬** | $R$ 을 키워 덜 뒤지게 |
| **계자 권수 감소** | 인덕턴스 감소 |

$$
\text{\textbf{mc.5.7의 단상유도전동기 기동장치와 같은 발상}}
$$

$$
\text{\textbf{콘덴서로 앞서게}} \;\text{또는}\; \text{\textbf{저항으로 덜 뒤지게}}
$$

**분상기동형과 콘덴서기동형이 하던 그 일**이다. 위상차를 만들거나 없애는 수단은
어디서나 같다.

$$
\text{\textbf{저항을 넣으면}} \;\Longrightarrow\; \text{손실} \;\Longrightarrow\; \text{효율} \downarrow
$$
$$
\text{\textbf{콘덴서를 넣으면}} \;\Longrightarrow\; \text{값 ・ 크기}
$$

$$
\boxed{\text{\textbf{고쳐 봐야 다른 기계보다 나을 게 없다}}}
$$

$$
\text{\textbf{그래서 안 쓴다}}
$$

**억지로 고쳐 쓸 바에** 직권 정류자 전동기(mc.6.2)나 콘덴서 전동기(mc.5.7)를 쓴다.

## 종류

$$
\text{\textbf{실용 예가 거의 없어} 분류가 의미 없다}
$$

| 형태 | |
|---|---|
| 보상권선 있는 것 | 역률 개선 |
| 콘덴서 부착형 | 위상 보정 |

$$
\text{\textbf{시험에는 "왜 안 되는가"}}\text{만 나온다}
$$

## 특성

$$
\text{\textbf{만약 위상을 맞춘다면}} \;-\; \text{직류 분권과 비슷}
$$

| 항목 | |
|---|---|
| **속도** | **거의 일정** (정속도) |
| **기동토크** | 보통 |
| **역률** | **나쁨** |
| **효율** | **나쁨** |

$$
\text{\textbf{정속도}}\text{가 유일한 장점}
$$

$$
\text{그런데 \textbf{정속도가 필요하면 유도전동기}}\text{를 쓰면 된다} \;-\; \text{더 싸고 튼튼하다}
$$

$$
\boxed{\text{\textbf{존재 이유가 없다}}}
$$

## 정리 — 직권과 분권의 대비

$$
\boxed{\text{\textbf{직권: 저절로 된다}} \qquad \text{\textbf{분권: 안 된다}}}
$$

| | **단상 직권**(mc.6.2) | **단상 분권** |
|---|---|---|
| **계자 결선** | **직렬** | **병렬** |
| **위상차** $\theta$ | **$0$** (같은 전류) | **$\approx 90°$** |
| **토크** | **$T \propto I_a^2$** | **$\approx 0$** |
| **교류 운전** | **가능** | **불가** (보정 필요) |
| **실용** | **만능전동기로 생존** | **없음** |

$$
\text{\textbf{자속과 전류가 같이 뒤집히느냐}} \;-\; \text{이 한 줄이 둘의 운명을 갈랐다}
$$

$$
(-\phi)(-I_a) = \phi I_a \quad(\text{직권}) \qquad / \qquad \phi \perp I_a \;\Longrightarrow\; 0 \quad(\text{분권})
$$

**mc.6.1에서 예고한 그것**이다. 교류정류자기에서 **직권만 자연스럽고 분권은 억지**다.
