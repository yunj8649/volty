---
id: mc.2.4
title: 단락현상
status: reviewed
summary: 단락비 하나에 발전기의 성격이 다 들어 있다. 크면 튼튼하고 비싸다.
covers:
  - mc.2.4.1
formulas:
  - label: 단락비
    tex: K_s = \dfrac{I_{f1}}{I_{f2}} = \dfrac{I_s}{I_n} = \dfrac{100}{\%Z_s} = \dfrac{1}{Z_s[\mathrm{p.u}]}
    note: 무부하 정격전압 계자전류 / 정격전류 단락 계자전류. **%Z의 역수**.
  - label: 퍼센트 동기 임피던스
    tex: \%Z_s = \dfrac{Z_s I_n}{E_n} \times 100 = \dfrac{P\,Z_s}{10E^2}
    note: '$P\ \mathrm{[kVA]}$, $E\ \mathrm{[kV]}$ 단상. 3상은 $\frac{PZ_s}{10E^2}$ 에서 $E$ 가 선간.'
  - label: 3상 단락전류
    tex: I_s = \dfrac{E}{Z_s} = \dfrac{100}{\%Z_s} I_n
    note: 지속 단락전류. **동기 리액턴스가 제한**한다.
  - label: 단락비의 표준값
    tex: \text{수차} \; 0.9 \sim 1.25 \qquad / \qquad \text{터빈} \; 0.6 \sim 1.0
    note: '**수차가 더 크다.** 철기계라서.'
traps:
  - '**단락비가 크다 = 동기 임피던스가 작다.** 역수 관계다. 이 한 줄이 모든 문제를 푼다.'
  - '**단락곡선은 직선**이다. 단락 시 감자작용이 극심해 포화가 안 되기 때문.'
  - '**돌발 단락전류는 누설 리액턴스만**이 제한하고, 지속 단락전류는 **동기 리액턴스**가
    제한한다. 그래서 처음이 훨씬 크다.'
  - '**단락비가 큰 기계 = 철기계 = 수차발전기.** 크고 무겁고 비싸지만 안정도가 좋다.'
related:
  - mc.2.3
  - pw.3.4
  - mc.2.6
---

## 3상 단락곡선

$$
\text{3상을 단락시키고 } I_f \text{ 를 올리며 } I_s \text{ 를 잰다}
$$

$$
\boxed{\text{\textbf{직선}이 나온다}}
$$

### 왜 직선인가 — 시험 단골

무부하 포화곡선은 휘는데(mc.2.3), 단락곡선은 직선이다. 이유가 있다.

$$
\text{단락} \;\Longrightarrow\; V = 0 \;\Longrightarrow\; \text{전류가 순수 \textbf{지상}}(\text{회로가 } jx_s \text{ 뿐})
$$

$$
\text{순 지상} \;\Longrightarrow\; \text{\textbf{감자작용이 극심}} \;\Longrightarrow\; \phi \text{ 가 확 눌림}
$$

$$
\boxed{\phi \text{ 가 \textbf{포화 영역에 도달하지 못한다}} \;\Longrightarrow\; \text{직선}}
$$

**감자작용이 스스로 포화를 막는다.** 계자를 아무리 세게 해도 전기자가 그만큼 깎아
버리니, 철심이 포화될 기회가 없다.

$$
\text{포화가 없으면} \;\Longrightarrow\; \text{비례} \;\Longrightarrow\; \text{직선}
$$

## 단락비

$$
\boxed{K_s = \dfrac{I_{f1}}{I_{f2}}}
$$

| 기호 | 뜻 |
|---|---|
| $I_{f1}$ | **무부하**에서 **정격전압**을 내는 데 필요한 계자전류 |
| $I_{f2}$ | **단락**에서 **정격전류**를 흘리는 데 필요한 계자전류 |

**두 곡선에서 하나씩** 읽어 나눈 것이다. 무부하 포화곡선에서 $I_{f1}$, 단락곡선에서
$I_{f2}$ 를 읽는다.

### 세 얼굴 — 다 같은 값이다

$$
\boxed{K_s = \dfrac{I_{f1}}{I_{f2}} = \dfrac{I_s}{I_n} = \dfrac{100}{\%Z_s} = \dfrac{1}{Z_s[\mathrm{p.u}]}}
$$

**이 등식이 문제 풀이의 전부**다. 어느 형태로 주든 나머지로 넘어갈 수 있다.

$$
\text{예: } \%Z_s = 80\% \;\Longrightarrow\; K_s = \dfrac{100}{80} = 1.25
$$

### 왜 %Z의 역수인가

$$
\%Z_s = \dfrac{Z_s I_n}{E_n} \times 100
$$

$$
I_s = \dfrac{E_n}{Z_s} \;\Longrightarrow\; \dfrac{I_s}{I_n} = \dfrac{E_n}{Z_s I_n} = \dfrac{100}{\%Z_s}
$$

$$
\boxed{\text{단락비} = \dfrac{100}{\%Z_s}}
$$

**단락비가 크다 = 동기 임피던스가 작다.** 이 역수 관계가 핵심이다.

$$
\boxed{K_s \uparrow \;\Longleftrightarrow\; \%Z_s \downarrow \;\Longleftrightarrow\; x_s \downarrow}
$$

## 단락비가 크면 — 철기계

$$
\text{단락비가 크다} = \text{동기 임피던스가 작다} = \text{\textbf{전기자 반작용이 작다}}
$$

$$
x_s = x_a + x_l \;\Longrightarrow\; x_s \downarrow \text{ 하려면 } x_a \downarrow
$$

**반작용을 줄이려면 어떻게 하나.**

$$
\text{계자를 \textbf{세게}} \;\Longrightarrow\; \text{전기자가 깎아도 \textbf{끄떡없음}}
$$

$$
\text{계자를 세게 하려면} \;\Longrightarrow\; \text{\textbf{공극을 넓히고} 계자 기자력을 키움} \;\Longrightarrow\; \text{\textbf{철이 많이 든다}}
$$

$$
\boxed{\text{단락비 큼} = \text{\textbf{철기계}}}
$$

### 철기계의 장단점

| 장점 | 단점 |
|---|---|
| **전기자 반작용이 작다** | **크고 무겁다** |
| **동기 임피던스가 작다** | **비싸다** |
| **전압변동률이 작다** | **철손이 커서 효율이 나쁘다** |
| **안정도가 좋다** | **선로 충전용량이 크다** |
| **과부하 내량이 크다** | |
| 자기여자 방지 | |

$$
\text{튼튼하지만 \textbf{비싸고 무겁고 효율이 나쁘다}}
$$

**전형적인 거래**다. 안정도와 전압 품질을 돈과 효율로 산다.

### 왜 안정도가 좋은가

pw.4.3에서 본 그대로다.

$$
P = \dfrac{EV}{x_s}\sin\delta
$$

$$
x_s \downarrow \;\Longrightarrow\; P_{max} \uparrow \;\Longrightarrow\; \text{같은 } P \text{ 를 } \textbf{더 작은 } \delta \text{ 로}
$$

**여유각이 커진다.** 사고가 나도 탈조까지 버틸 힘이 생긴다.

$$
\text{안정도를 높이려면 리액턴스를 줄여라} \;-\; \text{pw.4.3의 결론이 여기서도}
$$

### 왜 선로 충전용량이 큰가

$$
\text{충전전류(진상)} \;\Longrightarrow\; \text{증자작용} \;\Longrightarrow\; \text{전압 상승}
$$

단락비가 작은 기계는 반작용이 커서, 진상 전류가 조금만 흘러도 전압이 확 오른다.
**자기여자**로 폭주한다.

$$
K_s \uparrow \;\Longrightarrow\; \text{증자에 \textbf{덜 휘둘림}} \;\Longrightarrow\; \text{더 긴 선로를 충전 가능}
$$

## 수차 vs 터빈

$$
\boxed{\text{수차} \; 0.9 \sim 1.25 \qquad / \qquad \text{터빈} \; 0.6 \sim 1.0}
$$

$$
\text{\textbf{수차발전기가 더 크다}}
$$

### 왜 갈리나 — 원심력이다

mc.2.1에서 본 그대로다.

$$
\text{수차: \textbf{저속}} \;\Longrightarrow\; \text{다극} \;\Longrightarrow\; \text{지름 큼} \;\Longrightarrow\; \text{\textbf{공극을 넓게 해도 됨}}
$$

$$
\text{터빈: \textbf{고속}} \;\Longrightarrow\; \text{원심력} \;\Longrightarrow\; \text{가늘고 길게} \;\Longrightarrow\; \text{\textbf{철을 넉넉히 못 씀}}
$$

**터빈발전기는 철기계가 되고 싶어도 못 된다.** 원심력이 허락하지 않는다.

$$
\text{터빈 = \textbf{동기계}(구리를 많이 쓴 기계)} \qquad / \qquad \text{수차 = \textbf{철기계}}
$$

| | **철기계** | **동기계** |
|---|---|---|
| 대표 | **수차발전기** | **터빈발전기** |
| **단락비** | **크다** (0.9~1.25) | **작다** (0.6~1.0) |
| $x_s$ | 작다 | 크다 |
| 크기 | 크고 무겁다 | 작고 가볍다 |
| 효율 | 나쁘다 (철손) | **좋다** |
| 안정도 | **좋다** | 나쁘다 |

## 돌발 단락전류 vs 지속 단락전류

$$
\text{단락 순간과 나중이 \textbf{다르다}}
$$

| 구간 | 제한하는 것 | 크기 |
|---|---|---|
| **돌발**(순간) | **누설 리액턴스** $x_l$ 만 | **매우 크다** |
| 과도 | 과도 리액턴스 $x'_d$ | 중간 |
| **지속**(영구) | **동기 리액턴스** $x_s$ | **작다** |

$$
\boxed{I_s' = \dfrac{E}{x_l} \;\ggg\; I_s = \dfrac{E}{x_s}}
$$

### 왜 처음이 더 큰가

$$
\text{전기자 반작용은 \textbf{즉시 나타나지 않는다}}
$$

반작용이 자리 잡으려면 자속이 변해야 하는데, **자속은 갑자기 못 변한다**(렌츠의
법칙, 계자 회로의 인덕턴스가 자속을 붙잡는다).

$$
\text{단락 순간: } x_a \text{ 가 \textbf{아직 없음}} \;\Longrightarrow\; \text{누설 } x_l \text{ 만 제한} \;\Longrightarrow\; \text{전류 폭주}
$$

$$
\text{시간이 지나면: } x_a \text{ 가 자리 잡음} \;\Longrightarrow\; x_s = x_a + x_l \;\Longrightarrow\; \text{전류 감소}
$$

$$
\boxed{\text{돌발 단락전류를 제한하는 건 \textbf{누설 리액턴스}뿐}}
$$

**시험 단골**이다. 그래서 **한류 리액터**를 넣어 $x_l$ 을 키운다(pw.3.4).

$$
\text{차단기는 \textbf{돌발} 단락전류를 기준으로 고른다}
$$

pw.3.4의 차단용량이 이것이다. 처음의 큰 전류를 못 끊으면 소용이 없다.

## 자기여자 현상

$$
\text{무부하 장거리 선로} \;\Longrightarrow\; \text{충전전류(\textbf{진상})} \;\Longrightarrow\; \text{\textbf{증자}} \;\Longrightarrow\; V \uparrow \;\Longrightarrow\; \text{충전전류} \uparrow \;\Longrightarrow\; \cdots
$$

$$
\boxed{\text{전압이 \textbf{스스로 올라간다}}}
$$

**양의 되먹임**이다. 계자를 안 걸었는데도 잔류자기에서 시작해 전압이 정격을 넘어
버린다.

### 대책

| 대책 | 왜 |
|---|---|
| **단락비를 크게** | 증자에 덜 휘둘림 |
| **발전기를 여러 대 병렬** | 한 대당 충전전류 부담 감소 |
| **분로 리액터**(shunt reactor) | **진상을 지상으로 상쇄** |
| **동기조상기를 부족여자로** | 지상 전류를 흡수 (mc.2.8) |
| 변압기를 병렬로 | |

$$
\text{핵심: \textbf{진상 전류를 없애거나, 진상에 안 휘둘리게}}
$$

**분로 리액터**가 pw.2.5의 페란티 대책과 같다. 원인이 같으니 대책도 같다.

$$
\text{자기여자} \equiv \text{페란티} \equiv \text{\textbf{진상 전류의 증자작용}}
$$

## 정리

$$
\boxed{K_s = \dfrac{I_{f1}}{I_{f2}} = \dfrac{I_s}{I_n} = \dfrac{100}{\%Z_s}}
$$

$$
K_s \uparrow \;\Longleftrightarrow\; x_s \downarrow \;\Longleftrightarrow\; \text{철기계} \;\Longleftrightarrow\; \text{튼튼 ・ 비쌈 ・ 저효율}
$$

**단락비 하나에 발전기의 성격이 다 들어 있다.** 크기, 값, 효율, 안정도, 전압변동률이
전부 이 숫자와 묶여 있다.
