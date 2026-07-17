---
id: mc.6.1
title: 교류정류자기의 종류, 구조 및 원리
status: reviewed
summary: 교류에 정류자를 붙여 속도를 제어하려던 기계들이다. 인버터가 나오면서 거의 다 사라졌다.
covers:
  - mc.6.1.1
  - mc.6.1.2
  - mc.6.1.3
formulas:
  - label: 존재 이유
    tex: \text{\textbf{교류}}\text{인데} \;+\; \text{\textbf{정류자}} \;\Longrightarrow\; \text{\textbf{속도 제어}}
    note: 유도전동기는 속도 제어가 안 됐다. 그 시절의 해답.
  - label: 분류
    tex: \text{\textbf{상수}}(\text{단상} / \text{3상}) \times \text{\textbf{여자}}(\text{직권} / \text{분권})
    note: 이 두 축으로 mc.6.2~6.6이 갈린다.
  - label: 직류기와 같은 점
    tex: T = K\phi I_a \;-\; \text{\textbf{자속과 전류의 곱}}
    note: 정류자가 있으니 직류기처럼 행동한다.
traps:
  - '**교류정류자기는 거의 다 사라졌다.** 인버터가 대신한다. 시험에만 남아 있다.'
  - '**단상직권은 교류·직류 겸용**(만능전동기)이다. 가정용 공구에 아직 쓴다.'
  - '**정류자가 있으면 브러시 마모·불꽃**이라는 대가를 치른다(mc.1.1).'
  - 3상 직권은 **회전 방향과 속도를 브러시 이동**으로 조절한다.
related:
  - mc.1.1
  - mc.5.4
  - mc.6.2
---

## 왜 이런 게 있었나

$$
\boxed{\text{\textbf{교류}}\text{인데} \;+\; \text{\textbf{정류자}} \;\Longrightarrow\; \text{\textbf{속도 제어}}}
$$

**옛날의 사정**을 알아야 이 단원이 이해된다.

| 기계 | 속도 제어 |
|---|---|
| **직류기** | **쉽다** ($N \propto V/\phi$, mc.1.8) |
| **유도기** | **안 된다** (인버터 이전) |
| **동기기** | **불가능** ($N_s$ 고정) |

$$
\text{계통은 \textbf{교류}}\text{인데 \textbf{속도 제어는 직류기}}\text{만 된다}
$$

$$
\boxed{\text{\textbf{교류로 직류기처럼 굴 수는 없나?}}}
$$

$$
\text{\textbf{그 물음의 답}}\text{이 교류정류자기}
$$

**직류기의 속도 제어 능력**을 교류 계통에서 쓰려는 시도였다.

## 원리

$$
T = K\phi I_a
$$

$$
\text{\textbf{자속과 전류가 \textbf{동시에} 방향을 바꾸면}} \;\Longrightarrow\; \text{\textbf{토크 방향은 그대로}}
$$

$$
T \propto (-\phi)(-I_a) = \phi I_a \;-\; \text{\textbf{음수 곱하기 음수}}
$$

$$
\boxed{\text{\textbf{직권}}\text{이면 계자와 전기자가 \textbf{직렬}} \;\Longrightarrow\; \text{항상 같이 뒤집힌다}}
$$

$$
\text{\textbf{그래서 직권은 교류에서도 돈다}}
$$

**mc.1.7의 직권전동기**가 교류에서도 작동하는 이유다. $\phi \propto I_a$ 니 둘이
동시에 뒤집힌다.

$$
\text{\textbf{분권은?}} \;-\; \text{계자와 전기자가 \textbf{병렬}}
$$

$$
\text{계자는 \textbf{인덕턴스가 커서} 전류가 많이 뒤짐} \;\Longrightarrow\; \phi \text{ 와 } I_a \text{ 의 \textbf{위상이 어긋남}}
$$

$$
T = K\phi I_a\cos\theta \;\Longrightarrow\; \text{\textbf{토크가 준다}}
$$

$$
\boxed{\text{\textbf{교류 분권은 그대로는 안 된다}}} \;-\; \text{보상이 필요}(\text{mc.6.4})
$$

**직권은 저절로 되고 분권은 손을 봐야 한다.** 이 차이가 mc.6.2와 mc.6.4를 가른다.

## 종류

$$
\text{\textbf{두 축}}\text{으로 갈린다}
$$

$$
\boxed{\text{\textbf{상수}}(\text{단상} / \text{3상}) \;\times\; \text{\textbf{여자}}(\text{직권} / \text{분권})}
$$

| 종류 | 카드 | 살아남았나 |
|---|---|---|
| **단상 직권 정류자 전동기** | mc.6.2 | **O** (만능전동기) |
| **단상 반발 전동기** | mc.6.3 | X |
| **단상 분권 정류자 전동기** | mc.6.4 | X (거의 안 씀) |
| **3상 직권 정류자 전동기** | mc.6.5 | X |
| **3상 분권 정류자 전동기** | mc.6.6 | X (셰르비우스만) |
| **정류자형 주파수 변환기** | mc.6.7 | X |

$$
\boxed{\text{\textbf{단상 직권만 살아남았다}}}
$$

### 왜 다 사라졌나

$$
\text{\textbf{인버터}}\text{가 나왔다}(\text{mc.3.3} \cdot \text{mc.5.4})
$$

$$
\text{유도전동기 + 인버터} \;\Longrightarrow\; \text{\textbf{속도 제어가 자유}} \;\Longrightarrow\; \text{\textbf{정류자가 필요 없어짐}}
$$

$$
\text{\textbf{정류자의 대가}}(\text{mc.1.1})\text{를 안 치러도 된다}
$$

| 정류자의 대가 | |
|---|---|
| **마모** | 주기적 교체 |
| **불꽃** | 폭발 위험 장소 불가 |
| **보수 비용** | |
| **고속 제한** | |
| **교류에서는 정류가 더 나쁨** | 변압기 기전력 (mc.6.2) |

$$
\text{\textbf{교류정류자기는 정류가 직류기보다 더 어렵다}}
$$

**직류기의 정류 문제**(mc.1.3)에 **변압기 기전력**이라는 문제가 하나 더 붙는다.
그래서 더 나쁘다.

$$
\boxed{\text{\textbf{시험에만 남아 있는 단원}}}
$$

**솔직히 그렇다.** 실무에서 볼 일이 거의 없다. 다만 **출제기준에 7개 항목**이 있으니
공부해야 한다.

$$
\text{\textbf{만능전동기만은 예외}} \;-\; \text{드릴 ・ 믹서 ・ 청소기에 지금도}
$$

## 구조

$$
\text{\textbf{직류기와 같다}} \;-\; \text{전기자 + 계자 + \textbf{정류자} + 브러시}
$$

$$
\text{\textbf{차이는 철심}}
$$

| | **직류기** | **교류정류자기** |
|---|---|---|
| **전기자 철심** | 성층 | **성층** |
| **계자 철심** | **통짜 가능** | **반드시 성층** |

$$
\boxed{\text{\textbf{계자도 성층해야 한다}}}
$$

### 왜인가

$$
\text{\textbf{직류기}}: \text{계자 자속이 \textbf{일정}} \;\Longrightarrow\; \text{철손 없음} \;\Longrightarrow\; \text{통짜도 OK}(\text{mc.1.9})
$$

$$
\text{\textbf{교류정류자기}}: \text{계자 자속이 \textbf{교번}} \;\Longrightarrow\; \text{\textbf{철손 발생}} \;\Longrightarrow\; \text{성층 필수}
$$

$$
\text{\textbf{교류를 넣으니 계자 자속도 교류}}
$$

**mc.1.9에서 "계자 철심은 통짜도 가능"** 이라고 한 게 여기서는 안 통한다. 자속이
뒤집히니 와전류가 생긴다.

$$
\text{\textbf{규칙은 하나}} \;-\; \text{\textbf{교번 자속이 지나는 곳은 성층}}
$$

**mc.2.9의 동기기**에서도 같은 규칙이었다. 어느 기계든 자속이 뒤집히는 쪽을 성층한다.

### 추가되는 것들

| 부품 | 왜 |
|---|---|
| **보상권선** | 전기자 반작용 상쇄 (역률 개선) |
| **보극** | 정류 개선 |
| **저항 리드** | 브러시와 정류자편 사이에 저항 삽입 |

$$
\text{\textbf{저항 리드}}\text{가 교류정류자기 특유}
$$

$$
\text{\textbf{단락 전류를 제한}}\text{해 정류를 돕는다} \;-\; \text{변압기 기전력 때문}(\text{mc.6.2})
$$

**직류기보다 정류가 어려우니 부품이 더 붙는다.** 그만큼 복잡하고 비싸다.

## 정류가 왜 더 어려운가

$$
\text{\textbf{직류기의 정류 방해}}: \text{리액턴스 전압} \; e_L = L\dfrac{2I_c}{T_c} \quad(\text{mc.1.3})
$$

$$
\text{\textbf{교류정류자기는 하나 더}}: \text{\textbf{변압기 기전력}}
$$

$$
\text{계자 자속이 \textbf{교번}} \;\Longrightarrow\; \text{정류 중인 코일에 } e = -N\dfrac{d\phi}{dt} \text{ 유기}
$$

$$
\boxed{\text{\textbf{가만히 있어도} 기전력이 생긴다}}
$$

**직류기는 코일이 중성축에 있으면 기전력이 0**인데, 교류정류자기는 **자속 자체가
변하니** 어디 있든 기전력이 생긴다.

$$
\text{\textbf{정류 중인 코일이 단락}}\text{되어 있는데 기전력이 생김} \;\Longrightarrow\; \text{\textbf{큰 단락 전류}} \;\Longrightarrow\; \text{\textbf{불꽃}}
$$

| 대책 | |
|---|---|
| **저항 리드** (탄소 브러시) | 단락 전류 제한 |
| **보극** | |
| **주파수를 낮춤** | $e \propto f$ 니까 |

$$
\textbf{전기철도가 } \text{ 16} \dfrac{2}{3} \  \mathrm{Hz} \text{ 를 쓴 이유}
$$

**유럽 철도의 $16\frac{2}{3}\ \mathrm{Hz}$** 가 여기서 나왔다. $50\ \mathrm{Hz}$ 의
$1/3$ 이다. 주파수를 낮추면 변압기 기전력이 줄어 정류가 좋아진다.

$$
\text{\textbf{계통 주파수를 바꿔가면서까지} 정류자를 쓰려 했다}
$$

**그만큼 속도 제어가 절실했다.** 지금은 인버터로 해결되니 이런 궁리가 다 사라졌다.

## 정리

$$
\boxed{\text{\textbf{교류} + \textbf{정류자}} = \text{그 시절의 \textbf{속도 제어} 해법}}
$$

$$
\text{\textbf{직권}: 저절로 됨}(\phi \text{ 와 } I_a \text{ 가 같이 뒤집힘})
$$
$$
\text{\textbf{분권}: 위상이 어긋나 \textbf{보상 필요}}
$$

| 구조 | 직류기와 |
|---|---|
| 전기자·계자·정류자·브러시 | **같다** |
| **계자 철심 성층** | **다르다** (교번 자속) |
| **저항 리드** | **추가** (변압기 기전력) |

$$
\boxed{\text{\textbf{인버터가 이 단원 전체를 지웠다}}}
$$

**mc.1.1의 정류자, mc.5.1의 권선형, mc.5.5의 특수 농형**에 이어 **네 번째**다.
반도체가 기계적 궁리를 차례로 대체하는 이야기의 마지막 장이다.
