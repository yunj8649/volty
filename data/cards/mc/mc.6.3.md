---
id: mc.6.3
title: 단상반발 전동기
status: reviewed
summary: 브러시를 단락시키고 위치를 틀어서 돌린다. 기동토크가 가장 크지만 사라졌다.
covers:
  - mc.6.3.1
  - mc.6.3.2
  - mc.6.3.3
formulas:
  - label: 원리
    tex: \text{브러시를 \textbf{단락}} + \textbf{자축에서 } \alpha \text{ 만큼 이동} \;\Longrightarrow\; \text{회전}
    note: 전기자가 변압기 2차처럼 유도되어 반발한다.
  - label: 토크
    tex: T \propto \sin 2\alpha
    note: '$\alpha = 45°$ 에서 **최대**. $\alpha = 0$ 또는 $90°$ 면 **0**.'
  - label: 속도·방향 제어
    tex: \text{\textbf{브러시 위치}} \alpha \text{ 하나로}
    note: 각도로 토크도 방향도 정해진다.
  - label: 종류
    tex: \text{\textbf{애트킨슨} ・ \textbf{톰슨} ・ \textbf{데리}}
    note: 브러시와 권선 배치의 차이.
traps:
  - '**브러시가 자축과 일치(α=0)하거나 직각(α=90°)이면 토크가 0**이다. 45°에서 최대.'
  - '**브러시를 단락**시키는 게 핵심이다. 전원에 연결하는 게 아니다.'
  - '**반발기동형 단상유도전동기**(mc.5.7)가 이 원리로 기동한 뒤 농형으로 바뀐다.'
  - 종류는 **애트킨슨·톰슨·데리** 셋. "애톰데".
related:
  - mc.6.2
  - mc.5.7
  - mc.6.1
---

## 개요

$$
\boxed{\text{\textbf{브러시를 단락}}\text{시키고 \textbf{위치를 틀어} 돌린다}}
$$

$$
\text{\textbf{전원은 계자에만}} \;-\; \text{전기자는 \textbf{전원에 연결 안 함}}
$$

$$
\text{전기자는 \textbf{유도}}\text{로 전류를 받는다} \;-\; \text{\textbf{변압기 2차}}\text{처럼}
$$

**직권 정류자 전동기**(mc.6.2)와 결정적으로 다르다.

| | **단상 직권** | **단상 반발** |
|---|---|---|
| **전기자** | **전원에 직렬** | **단락** (유도로 받음) |
| **브러시** | 전류를 흘림 | **단락시킴** |
| 토크 조절 | 전압 | **브러시 각도** |

## 원리

$$
\text{계자에 교류} \;\Longrightarrow\; \text{교번 자속} \;\Longrightarrow\; \text{전기자에 \textbf{유도 기전력}}
$$

$$
\text{브러시가 \textbf{단락}}\text{되어 있으니} \;\Longrightarrow\; \text{\textbf{전류가 흐른다}}
$$

$$
\text{그 전류가 만든 자속이 \textbf{계자 자속과 반발}} \;\Longrightarrow\; \text{\textbf{회전}}
$$

$$
\boxed{\text{\textbf{반발}}(\text{repulsion})\text{이라는 이름의 유래}}
$$

**같은 극끼리 밀어내는 것**처럼 전기자가 계자를 피해 돈다.

### 브러시 위치가 전부다

$$
\boxed{T \propto \sin 2\alpha}
$$

$\alpha$ 는 **브러시 축과 계자 자축의 각도**다.

| $\alpha$ | $\sin 2\alpha$ | 토크 |
|---|---|---|
| **$0°$** | $0$ | **0** |
| **$45°$** | **$1$** | **최대** |
| **$90°$** | $0$ | **0** |
| $135°$ | $-1$ | **최대 (역방향)** |

$$
\text{\textbf{45도에서 최대}} \;-\; \text{시험 단골}
$$

### 왜 0과 90도에서 토크가 0인가

$$
\alpha = 0 \;(\text{브러시가 \textbf{자축과 일치}})
$$

$$
\text{전기자 코일의 두 변이 \textbf{대칭}} \;\Longrightarrow\; \text{기전력이 \textbf{서로 상쇄}} \;\Longrightarrow\; \text{전류 } 0 \;\Longrightarrow\; T = 0
$$

$$
\alpha = 90° \;(\text{브러시가 \textbf{자축과 직각}})
$$

$$
\text{전류는 \textbf{최대}}\text{인데} \;\Longrightarrow\; \text{그 자속이 계자 자속과 \textbf{같은 방향}} \;\Longrightarrow\; \text{\textbf{밀지 못함}} \;\Longrightarrow\; T = 0
$$

$$
\boxed{\text{\textbf{양 극단이 다 0}} \;-\; \text{한쪽은 전류가 없고, 한쪽은 방향이 안 맞다}}
$$

$$
\textbf{둘을 곱한 게 } \sin \alpha \times \cos \alpha \text{ = } \dfrac{1}{2} \sin \text{2} \alpha
$$

**전류는 $\sin\alpha$ 에, 토크로 바뀌는 성분은 $\cos\alpha$ 에 비례**한다. 곱하면
$\sin2\alpha$ 다. 그래서 **가운데(45°)가 최대**다.

$$
\text{\textbf{어느 하나만 크면 안 되고 둘의 곱이 커야}}
$$

### 방향도 각도가 정한다

$$
\alpha \text{ 를 \textbf{반대쪽으로}} \;\Longrightarrow\; \sin2\alpha < 0 \;\Longrightarrow\; \text{\textbf{역회전}}
$$

$$
\boxed{\text{\textbf{브러시 하나로 속도도 방향도}}}
$$

**결선을 안 바꾸고 브러시만 움직이면** 정회전·정지·역회전이 다 된다. 이게 반발
전동기의 매력이었다.

$$
\text{\textbf{전기 기관차}}\text{에 썼던 이유}
$$

## 특성

| 항목 | |
|---|---|
| **기동토크** | **매우 크다** (mc.5.7의 "반콘분셰"에서 1위) |
| **속도** | **가변** — 브러시로 |
| **무부하** | **폭주** (직권 특성) |
| **역률** | 나쁨 |
| **정류** | 나쁨 |

$$
\text{\textbf{직권과 비슷한 특성}} \;-\; T \propto \dfrac{1}{N^2}
$$

$$
\text{\textbf{무부하 위험}}\text{도 같다} \;-\; \text{부하가 없으면 속도가 폭주}
$$

### 왜 사라졌나

| 문제 | |
|---|---|
| **정류자·브러시** | mc.1.1의 대가 |
| **구조 복잡** | |
| **비싸다** | |
| **보수** | 브러시 위치 조정까지 |

$$
\text{\textbf{콘덴서 전동기}}\text{가 충분히 좋아졌다}(\text{mc.5.7})
$$

$$
\text{\textbf{인버터}}\text{가 나왔다}
$$

$$
\boxed{\text{\textbf{반발 전동기 자체는 사라졌다}}}
$$

**다만 흔적은 남았다.** mc.5.7의 **반발기동형 단상유도전동기**가 그것이다.

$$
\text{\textbf{기동은 반발 전동기}}(\text{큰 토크}) \to \text{속도가 오르면} \to \text{\textbf{정류자를 단락}} \to \text{\textbf{농형으로}}
$$

$$
\text{\textbf{반발의 기동토크}}\text{만 빌려 쓰고 버린다}
$$

**그것마저도 콘덴서형에 밀렸다.**

## 종류

$$
\boxed{\text{\textbf{애트킨슨} ・ \textbf{톰슨} ・ \textbf{데리}}}
$$

$$
\text{\textbf{"애톰데"}}
$$

| 종류 | 특징 |
|---|---|
| **애트킨슨형**(Atkinson) | 브러시 **2조** |
| **톰슨형**(Thomson) | **보상권선** 있음 |
| **데리형**(Deri) | 브러시 **2조**, 하나는 **고정** |

$$
\text{\textbf{브러시와 권선 배치의 차이}}\text{일 뿐}
$$

**시험에는 이름만 나온다.** 셋의 차이를 깊이 물어보지 않는다.

$$
\text{\textbf{톰슨형에 보상권선}}\text{이 있다는 것 정도}
$$

## 정리

$$
\boxed{T \propto \sin2\alpha \;-\; \alpha = 45° \text{ 에서 최대}}
$$

$$
\alpha = 0° \;(\text{전류 } 0) \qquad \alpha = 90° \;(\text{방향 안 맞음}) \;\Longrightarrow\; \text{\textbf{둘 다 } T = 0}
$$

| | |
|---|---|
| **전기자** | **단락** (유도로 전류) |
| **제어** | **브러시 각도** 하나 |
| **기동토크** | **최대** |
| **종류** | **애트킨슨 · 톰슨 · 데리** |

$$
\boxed{\text{\textbf{브러시 각도 하나로 모든 걸} 하려 했던 기계}}
$$

**발상은 우아했지만** 정류자의 대가를 못 이겼다. mc.6 전체가 그 이야기다.
