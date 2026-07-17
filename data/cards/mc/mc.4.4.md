---
id: mc.4.4
title: 변압기의 3상 결선
status: reviewed
summary: Δ는 제3고조파를 가두고 Y는 중성점을 준다. 그래서 Δ-Y로 올리고 Y-Δ로 내린다.
covers:
  - mc.4.4.1
  - mc.4.4.2
  - mc.4.4.3
formulas:
  - label: Y결선
    tex: V_l = \sqrt{3}\,V_p \angle 30°, \qquad I_l = I_p
    note: '**선간전압이 √3배**, 전류는 그대로. **중성점**이 나온다.'
  - label: Δ결선
    tex: V_l = V_p, \qquad I_l = \sqrt{3}\,I_p \angle -30°
    note: 전압은 그대로, **선전류가 √3배**. **제3고조파를 가둔다**.
  - label: V결선 출력
    tex: P_V = \sqrt{3}\,P_1
    note: 변압기 2대로 3상. 3대 중 1대가 고장 나도 계속.
  - label: V결선 이용률·출력비
    tex: \text{이용률} = \dfrac{\sqrt{3}}{2} = 0.866, \qquad \text{출력비} = \dfrac{\sqrt{3}}{3} = 0.577
    note: '**86.6%와 57.7%**. 둘을 헷갈리면 안 된다.'
traps:
  - '**Δ-Y와 Y-Δ는 30° 위상변위**가 생긴다. 그래서 Δ-Δ와는 병렬운전이 안 된다(mc.4.6).'
  - '**V결선 이용률 86.6%, 출력비 57.7%.** 이용률은 2대 기준, 출력비는 3대(Δ) 기준.'
  - '**Δ가 하나라도 있어야** 제3고조파가 돌 길이 생긴다. Y-Y는 그래서 안 쓴다.'
  - '**Y-Y-Δ의 Δ는 안정권선**이다. 3권선변압기로 만들어 고조파를 가둔다.'
related:
  - mc.4.6
  - mc.4.11
  - pw.3.2
---

## 변압기의 극성

$$
\text{\textbf{어느 단자가 같은 순간에 +가 되나}}
$$

$$
\text{\textbf{감는 방향}이 정한다}
$$

| 극성 | 특징 | 표준 |
|---|---|---|
| **감극성** | 같은 쪽 단자가 **동시에 +** | **한국·일본** |
| **가극성** | 반대쪽 단자가 + | 미국 일부 |

### 어떻게 구분하나

$$
\text{1차와 2차를 \textbf{한쪽씩 연결}}\text{하고 나머지 두 단자의 전압을 잰다}
$$

$$
\text{감극성: } V = V_1 - V_2 \qquad / \qquad \text{가극성: } V = V_1 + V_2
$$

$$
\text{\textbf{빼지면 감극성, 더해지면 가극성}}
$$

**이름 그대로**다. 감(減)극성은 빼진다.

### 왜 중요한가

$$
\text{극성을 틀리면} \;\Longrightarrow\; \text{\textbf{단락}}
$$

병렬운전(mc.4.6)이나 3상 결선에서 극성을 잘못 맞추면 큰 순환전류가 흐른다. **결선
전에 반드시 확인**한다.

$$
\text{\textbf{극성 시험}}\text{이 변압기 시험의 기본 항목}(\text{mc.4.9})
$$

## 단상변압기의 3상 결선

$$
\text{단상변압기 \textbf{3대}로 3상을 만든다}
$$

$$
\text{1차와 2차를 \textbf{각각} Y 또는 } \Delta \text{ 로} \;\Longrightarrow\; \text{네 가지 조합}
$$

### Y결선과 Δ결선의 성질

$$
\boxed{\text{Y: } V_l = \sqrt{3}V_p, \; I_l = I_p \qquad / \qquad \Delta: V_l = V_p, \; I_l = \sqrt{3}I_p}
$$

**pw.3.1에서 본 그대로**다. 회로이론이 여기 그대로 쓰인다.

| | **Y결선** | **Δ결선** |
|---|---|---|
| **중성점** | **있다** | **없다** |
| **제3고조파** | **못 가둔다** | **가둔다** |
| 절연 | **유리** ($V_p$ 가 작음) | 불리 |
| 상전압 | $V_l/\sqrt{3}$ | $V_l$ |
| 한 대 고장 | 못 씀 | **V결선으로 계속** |

$$
\boxed{\text{\textbf{Y는 중성점을 주고}, } \Delta \text{ \textbf{는 제3고조파를 가둔다}}}
$$

**이 두 줄이 3상 결선의 전부**다. 나머지는 여기서 나온다.

## 왜 Δ가 제3고조파를 가두나

$$
\text{자화전류에 \textbf{제3고조파}가 섞인다}(\text{mc.4.2})
$$

철심의 포화·히스테리시스 때문에, 자속을 정현파로 만들려면 **전류가 찌그러져야** 한다.

$$
\text{제3고조파는 \textbf{3상이 모두 같은 위상}}(\text{영상분})
$$

$$
\text{a상 } 3\theta, \quad \text{b상 } 3(\theta - 120°) = 3\theta - 360° = 3\theta, \quad \text{c상도 } 3\theta
$$

**$120°$ 의 3배가 $360°$ 라 한 바퀴 돌아 제자리**다. 그래서 세 상이 동상이 된다.

$$
\boxed{\Delta \text{ 는 \textbf{닫힌 고리}} \;\Longrightarrow\; \text{동상 전류가 \textbf{안에서 순환}}}
$$

$$
\text{Y는 \textbf{열린 구조}} \;\Longrightarrow\; \text{중성선이 없으면 \textbf{갈 곳이 없다}}
$$

$$
\text{제3고조파 전류가 못 흐름} \;\Longrightarrow\; \text{\textbf{자속이 찌그러짐}} \;\Longrightarrow\; \text{\textbf{전압에 제3고조파}}
$$

### Y-Y를 안 쓰는 이유

$$
\text{양쪽 다 Y} \;\Longrightarrow\; \text{제3고조파가 \textbf{돌 곳이 전혀 없다}}
$$

| 문제 | |
|---|---|
| **전압 파형 왜곡** | 제3고조파 전압 발생 |
| **중성점 전위 변동** | |
| **통신선 유도장해** | 영상분이 대지로 (pw.7.3) |

$$
\boxed{\text{Y-Y는 \textbf{실용에서 안 쓴다}}}
$$

$$
\text{쓰려면 \textbf{제3권선}}(\Delta)\text{을 달아야} \;\Longrightarrow\; \text{\textbf{Y-Y-}}\Delta
$$

**안정권선**(stabilizing winding)이라 부른다. 부하를 안 걸고 **고조파만 가두려고**
단다. mc.4.11의 3권선변압기다.

$$
\textbf{어디엔가 } \Delta \text{ 가 하나는 있어야 한다}
$$

## 네 가지 결선

### Δ-Δ

| 장점 | 단점 |
|---|---|
| **제3고조파 순환** (파형 좋음) | **중성점이 없다** |
| **V결선 가능** (1대 고장 시) | **절연이 불리** |
| 대전류에 유리 | 지락 검출 어려움 |

$$
\text{\textbf{저전압 ・ 대전류}} \;-\; \text{배전용 2차측}
$$

### Y-Y

$$
\text{\textbf{안 쓴다}} \;-\; \text{제3고조파 문제}
$$

절연은 유리하지만($V_p = V_l/\sqrt{3}$) 파형이 나빠서 실용성이 없다.

### Δ-Y — 승압용

$$
\boxed{\text{\textbf{발전소에서 승압}할 때}}
$$

$$
\text{2차가 Y} \;\Longrightarrow\; \text{선간전압이} \sqrt{3} \text{ 배} \;\Longrightarrow\; \text{\textbf{승압에 유리}}
$$

$$
\text{2차 Y의 \textbf{중성점 접지}} \;\Longrightarrow\; \text{송전선 보호}(\text{pw.4.1})
$$

$$
\text{1차 } \Delta \;\Longrightarrow\; \text{\textbf{제3고조파 순환}}
$$

**셋을 다 만족한다.** 발전기 → 승압변압기는 거의 다 Δ-Y다.

### Y-Δ — 강압용

$$
\boxed{\text{\textbf{수전단에서 강압}할 때}}
$$

$$
\text{1차 Y} \;\Longrightarrow\; \text{\textbf{절연 유리}}(\text{고압측 상전압이 } 1/\sqrt{3})
$$

$$
\text{2차 } \Delta \;\Longrightarrow\; \text{제3고조파 순환 + 강압}
$$

$$
\text{\textbf{Δ-Y로 올리고 Y-Δ로 내린다}}
$$

**한 계통에서 짝을 이룬다.** 올릴 때 생긴 $30°$ 위상변위를 내릴 때 되돌린다.

## 30도 위상변위

$$
\boxed{\Delta\text{-Y 와 Y-}\Delta \text{ 는 1차와 2차 사이에 } \mathbf{30°} \text{ 위상차}}
$$

$$
\text{Y의 선간전압은 상전압보다 } 30° \text{ \textbf{앞선다}}
$$

$\Delta$ 쪽은 상전압 = 선간전압이라 위상이 안 변하는데, Y 쪽은 $30°$ 가 생긴다.

$$
\Delta\text{-}\Delta, \; \text{Y-Y} \;\Longrightarrow\; \text{위상변위 } \mathbf{0}
$$
$$
\Delta\text{-Y}, \; \text{Y-}\Delta \;\Longrightarrow\; \text{위상변위 } \mathbf{30°}
$$

### 그래서 병렬운전이 갈린다

$$
\boxed{\textbf{짝수 개의 } \Delta \text{ 또는 Y}\text{끼리만 병렬운전 가능}}
$$

| 가능 | 불가능 |
|---|---|
| $\Delta$-$\Delta$ 와 Y-Y | $\Delta$-$\Delta$ 와 **$\Delta$-Y** |
| $\Delta$-Y 와 Y-$\Delta$ | Y-Y 와 **Y-$\Delta$** |
| $\Delta$-$\Delta$ 와 $\Delta$-$\Delta$ | |

$$
\text{\textbf{위상이 30도 어긋나면 순환전류}} \;\Longrightarrow\; \text{병렬 불가}
$$

**mc.2.6의 동기발전기 병렬운전**과 같은 논리다. 위상이 다르면 전류가 흐른다.

$$
\text{규칙: } \Delta \text{ 의 \textbf{개수}가 양쪽 다 짝수이거나 다 홀수여야}
$$

$$
\Delta\text{-}\Delta(\Delta \text{ 2개}) \; \text{와} \; \text{Y-Y}(\Delta \text{ 0개}) \;\Longrightarrow\; \text{\textbf{둘 다 짝수}} \;\Longrightarrow\; \text{가능}
$$
$$
\Delta\text{-Y}(\Delta \text{ 1개}) \; \text{와} \; \text{Y-}\Delta(\Delta \text{ 1개}) \;\Longrightarrow\; \text{\textbf{둘 다 홀수}} \;\Longrightarrow\; \text{가능}
$$

## V결선

$$
\boxed{\text{변압기 \textbf{2대}로 3상을 만든다}}
$$

$$
\Delta\text{-}\Delta \text{ 에서 \textbf{1대가 고장} 나도} \;\Longrightarrow\; \text{나머지 2대로 \textbf{계속 운전}}
$$

$$
\textbf{이게 } \Delta \text{ 결선의 큰 장점}
$$

### 출력

$$
\boxed{P_V = \sqrt{3}\,P_1}
$$

$P_1$ 은 변압기 1대의 용량이다. 2대를 쓰는데 $2P_1$ 이 아니라 $\sqrt{3}P_1 = 1.73P_1$ 다.

$$
\text{\textbf{2대를 쓰는데 1.73대분}}\text{밖에 못 낸다}
$$

### 이용률

$$
\boxed{\text{이용률} = \dfrac{P_V}{2P_1} = \dfrac{\sqrt{3}P_1}{2P_1} = \dfrac{\sqrt{3}}{2} = \mathbf{0.866}}
$$

$$
\textbf{2대 중 86.6} \% \textbf{만} \text{ 쓴다}
$$

**변압기가 놀고 있다.** 각 변압기가 정격의 86.6%밖에 일을 못 한다.

### 출력비

$$
\boxed{\text{출력비} = \dfrac{P_V}{P_\Delta} = \dfrac{\sqrt{3}P_1}{3P_1} = \dfrac{\sqrt{3}}{3} = \dfrac{1}{\sqrt{3}} = \mathbf{0.577}}
$$

$$
\Delta\text{-}\Delta \text{ 3대 중 1대가 고장 나면 출력이 } \textbf{57.7} \% \text{로}
$$

$$
\text{\textbf{절반이 아니다}} \;-\; \text{3대 중 1대를 잃었는데 출력은 57.7} \%
$$

### 둘을 헷갈리지 마라

$$
\boxed{\textbf{이용률 86.6} \%(\text{2대 기준}) \qquad / \qquad \textbf{출력비 57.7} \%(\text{3대 기준})}
$$

| | 분모 | 값 |
|---|---|---|
| **이용률** | **2대**의 용량 ($2P_1$) | **0.866** |
| **출력비** | **3대**($\Delta$)의 출력 ($3P_1$) | **0.577** |

$$
\text{\textbf{기준이 다르다}} \;-\; \text{"2대를 얼마나 쓰나" vs "3대에 비해 얼마나 내나"}
$$

**시험 단골**이다. 문제가 뭘 묻는지 봐야 한다.

### 왜 √3인가

두 변압기의 전압 벡터가 $60°$ 를 이루기 때문이다.

$$
\text{Δ에서 한 변을 빼면} \;\Longrightarrow\; \text{남은 두 변이 } 60° \;\Longrightarrow\; \text{합성이 } \sqrt{3}
$$

$$
\text{각 변압기가 \textbf{역률 0.866과 0.5}로 다르게 부담}
$$

**두 대가 똑같이 일하지도 않는다.** 하나는 역률 0.866, 하나는 0.5로 일한다. 그래서
이용률이 떨어진다.

### 용도

| 용도 | |
|---|---|
| **사고 시 응급** | $\Delta$-$\Delta$ 1대 고장 |
| **소용량 3상** | 2대로 충분할 때 |
| **증설 예정** | 나중에 1대 추가해 $\Delta$ 로 |

$$
\text{\textbf{장래 증설}}\text{을 내다보고 처음부터 V결선을 쓰기도}
$$

## 특수변압기의 3상 결선

### Y-Y-Δ (3권선)

$$
\text{Y-Y의 \textbf{고조파 문제}를 } \Delta \text{ \textbf{안정권선}으로 해결}
$$

$$
\text{안정권선} = \text{\textbf{부하를 안 거는} } \Delta \text{ 권선}
$$

| 하는 일 | |
|---|---|
| **제3고조파 순환** | **주목적** |
| **소내 전력 공급** | 발전소 자체 사용 |
| **조상설비 연결** | |

**mc.4.11의 3권선변압기**다. 실제 대형 변전소는 대부분 Y-Y-$\Delta$ 다.

### 스코트 결선 (T결선)

$$
\text{\textbf{3상} → \textbf{2상}}(\text{mc.4.5})
$$

### 지그재그 결선

$$
\text{각 상의 권선을 \textbf{반씩 나눠 다른 철심}에}
$$

$$
\text{\textbf{영상분 임피던스가 작다}} \;\Longrightarrow\; \text{\textbf{접지용}}\text{으로}
$$

**접지변압기**(GT)로 쓴다. 중성점이 없는 $\Delta$ 계통에 **인위적으로 중성점**을
만들어 준다.

$$
\Delta \text{ 계통} \;\Longrightarrow\; \text{중성점 없음} \;\Longrightarrow\; \text{지락 검출 곤란} \;\Longrightarrow\; \text{\textbf{지그재그 변압기로 중성점 제공}}
$$

## 정리

$$
\boxed{\text{\textbf{Y는 중성점}, } \Delta \text{ \textbf{는 제3고조파}}}
$$

| 결선 | 위상변위 | 쓰임 |
|---|---|---|
| $\Delta$-$\Delta$ | $0°$ | 저압 대전류, **V결선 가능** |
| Y-Y | $0°$ | **안 씀** (고조파) |
| **$\Delta$-Y** | **$30°$** | **승압** (발전소) |
| **Y-$\Delta$** | **$30°$** | **강압** (수전단) |
| Y-Y-$\Delta$ | — | 대형 변전소 (안정권선) |

$$
\boxed{\text{V결선: } P_V = \sqrt{3}P_1, \quad \text{이용률 } 0.866, \quad \text{출력비 } 0.577}
$$
