---
id: ct.1.6
title: 대칭좌표법
status: reviewed
summary: 불평형 3상을 세 개의 평형 3상으로 쪼갠다. 그러면 각각은 평형이라 쉽게 풀린다.
covers:
  - ct.1.6.1
  - ct.1.6.2
  - ct.1.6.3
  - ct.1.6.4
formulas:
  - label: 대칭분 → 상전압
    tex: V_a = V_0 + V_1 + V_2, \quad V_b = V_0 + a^2V_1 + aV_2, \quad V_c = V_0 + aV_1 + a^2V_2
    note: '**영상 + 정상 + 역상**. 셋을 더하면 원래 값.'
  - label: 상전압 → 대칭분
    tex: V_0 = \dfrac{1}{3}(V_a+V_b+V_c), \quad V_1 = \dfrac{1}{3}(V_a + aV_b + a^2V_c), \quad V_2 = \dfrac{1}{3}(V_a + a^2V_b + aV_c)
    note: '**1/3이 붙는다**. 역변환이라 그렇다.'
  - label: 불평형률
    tex: \text{불평형률} = \dfrac{V_2}{V_1} \times 100\ \mathrm{[\%]}
    note: '**역상분 / 정상분**. 영상분이 아니다.'
  - label: 대칭분 전력
    tex: P = 3(V_0I_0\cos\theta_0 + V_1I_1\cos\theta_1 + V_2I_2\cos\theta_2)
    note: '**3배**가 붙는다. 같은 차수끼리만 전력을 만든다.'
traps:
  - '**불평형률은 역상분/정상분**이다. 영상분이 아니다.'
  - '**Δ결선과 비접지 Y에는 영상분이 없다.** 갈 곳이 없으니.'
  - '**대칭분 → 상전압은 1/3이 안 붙고, 상전압 → 대칭분은 1/3이 붙는다.**'
  - '**정상분만 회전자계를 만든다.** 역상분은 반대로 돌고 영상분은 안 돈다.'
related:
  - ct.1.5
  - pw.3.3
  - mc.5.6
---

## 왜 필요한가

$$
\text{\textbf{평형 3상}}\text{은 쉽다} \;-\; \text{한 상만 풀면 되니}(\text{ct.1.5})
$$

$$
\text{\textbf{불평형이면}} \;\Longrightarrow\; \text{세 상을 \textbf{따로} 풀어야} \;\Longrightarrow\; \text{복잡}
$$

$$
\boxed{\text{\textbf{불평형 3상을 세 개의 평형 3상으로 쪼갠다}}}
$$

$$
\text{\textbf{각각은 평형이니 쉽게 풀고}} \;\Longrightarrow\; \text{\textbf{나중에 더한다}}
$$

$$
\text{\textbf{ct.1.4의 푸리에}}\text{와 같은 발상} \;-\; \text{어려운 걸 \textbf{쉬운 것의 합}}\text{으로}
$$

| | 쪼개는 것 | 쪼개진 것 |
|---|---|---|
| **푸리에** | 비정현파 | **정현파들** |
| **대칭좌표법** | 불평형 3상 | **평형 3상들** |

$$
\text{\textbf{중첩의 정리}}\text{가 받쳐 준다}(\text{ct.1.2}) \;-\; \text{선형이라 가능}
$$

## 대칭좌표법

$$
\boxed{\text{\textbf{영상분} } V_0 + \text{\textbf{정상분} } V_1 + \text{\textbf{역상분} } V_2}
$$

| 대칭분 | 세 상의 모습 | 회전자계 |
|---|---|---|
| **영상분** $V_0$ | **셋이 똑같다** (동상) | **없음** |
| **정상분** $V_1$ | $120°$ 씩 **정방향** | **정방향** |
| **역상분** $V_2$ | $120°$ 씩 **역방향** | **역방향** |

$$
\text{\textbf{세 벌의 평형 3상}}
$$

### 벡터 오퍼레이터

$$
a = 1\angle 120°, \qquad 1 + a + a^2 = 0 \quad(\text{ct.1.5})
$$

### 대칭분 → 상전압

$$
\boxed{
\begin{aligned}
V_a &= V_0 + V_1 + V_2 \\
V_b &= V_0 + a^2V_1 + aV_2 \\
V_c &= V_0 + aV_1 + a^2V_2
\end{aligned}
}
$$

$$
\text{\textbf{셋을 더하면 원래 상전압}}
$$

$$
\text{\textbf{영상분은 } a \text{ 가 안 붙는다}} \;-\; \text{세 상이 같으니}
$$

$$
\textbf{정상분은 } \text{ a} ^2 \text{, a } \text{ 순}, \qquad \textbf{역상분은 } \text{ a, a} ^2 \text{ 순} \;-\; \text{\textbf{순서가 반대}}
$$

### 상전압 → 대칭분

$$
\boxed{
\begin{aligned}
V_0 &= \dfrac{1}{3}(V_a + V_b + V_c) \\
V_1 &= \dfrac{1}{3}(V_a + aV_b + a^2V_c) \\
V_2 &= \dfrac{1}{3}(V_a + a^2V_b + aV_c)
\end{aligned}
}
$$

$$
\boxed{\text{\textbf{1/3이 붙는다}}}
$$

$$
\text{\textbf{역변환이라 그렇다}} \;-\; \text{3개를 1개로 줄이니 평균처럼}
$$

$$
\text{\textbf{시험 함정}} \;-\; \text{어느 쪽에 } \tfrac{1}{3} \text{ 이 붙는지}
$$

### 영상분의 뜻

$$
V_0 = \dfrac{1}{3}(V_a + V_b + V_c)
$$

$$
\text{\textbf{평형이면}} \;\Longrightarrow\; V_a + V_b + V_c = 0 \;\Longrightarrow\; \boxed{V_0 = 0}
$$

$$
\text{\textbf{영상분이 있다 = 세 상의 합이 0이 아니다 = 어딘가 새고 있다}}
$$

$$
\boxed{\text{\textbf{영상분 = 지락의 표지}}}
$$

**mc.4.10의 ZCT·GPT**가 정확히 이걸 검출한다. 세 상을 더해서 0이 아니면 지락이다.

$$
3V_0 = V_a + V_b + V_c \;-\; \textbf{GPT의 오픈 } \Delta \text{ 에 나타나는 전압}
$$

$$
3I_0 = I_a + I_b + I_c \;-\; \text{\textbf{ZCT가 검출하는 전류}}
$$

**이론이 그대로 기기가 되었다.** 대칭좌표법의 $3V_0$ 가 GPT 단자에 실제로 나타난다.

### 영상분이 없는 경우

$$
\boxed{\Delta \text{ 결선} \;\text{과}\; \text{\textbf{비접지 Y}} \;\Longrightarrow\; \text{\textbf{영상분 없음}}}
$$

$$
\text{\textbf{영상 전류는 세 상이 같은 방향}} \;\Longrightarrow\; \text{\textbf{돌아갈 길이 필요}}
$$

$$
\text{\textbf{중성선이나 대지}}\text{를 통해야 하는데} \;\Longrightarrow\; \Delta \text{ 나 비접지는 그 길이 없다}
$$

$$
\text{\textbf{pw.4.1의 비접지 계통}}\text{에서 지락 전류가 작은 이유}
$$

$$
\textbf{mc.4.4에서 } \Delta \text{ 가 제3고조파를 가둔 것}\text{도 같은 이야기}
$$

**제3고조파가 영상분**이라(mc.5.6) $\Delta$ 안에서 순환할 수는 있어도 **밖으로는 못
나간다.**

$$
\Delta \text{ 안에서는 \textbf{순환}}, \qquad \Delta \text{ 밖으로는 \textbf{못 나감}}
$$

## 불평형률

$$
\boxed{\text{불평형률} = \dfrac{V_2}{V_1} \times 100 = \dfrac{\text{\textbf{역상분}}}{\text{\textbf{정상분}}} \times 100\ \mathrm{[\%]}}
$$

$$
\text{\textbf{영상분이 아니다}} \;-\; \text{시험 단골}
$$

### 왜 역상분인가

$$
\text{\textbf{역상분이 회전기에 해롭다}}
$$

$$
\text{역상분} \;\Longrightarrow\; \text{\textbf{반대로 도는 회전자계}} \;\Longrightarrow\; \text{\textbf{제동 토크 + 과열}}
$$

$$
\text{\textbf{슬립이 } 2-s} \;\Longrightarrow\; \text{거의 } 2 \;\Longrightarrow\; \text{\textbf{2차 동손 폭증}}(\text{mc.5.2})
$$

$$
\boxed{\text{\textbf{역상분이 전동기를 태운다}}}
$$

**mc.5.7의 단상 유도전동기**가 효율이 나쁜 이유와 같다. 역방향 성분이 계속 제동하며
열을 낸다.

$$
\text{\textbf{영상분은 회전자계를 안 만드니}} \;\Longrightarrow\; \text{회전기에는 덜 해롭다}
$$

$$
\text{\textbf{다만 영상분은 통신선 유도장해}}\text{를 일으킨다}(\text{pw.7.3})
$$

| 대칭분 | 누구에게 해로운가 |
|---|---|
| **역상분** | **회전기** (제동·과열) |
| **영상분** | **통신선** (유도장해) |
| 정상분 | (정상이니 해롭지 않다) |

$$
\text{\textbf{그래서 불평형률은 역상분으로}} \;-\; \text{회전기 관점}
$$

$$
\text{\textbf{역상 과전류 계전기}}(46\text{번}, \text{pw.1.6})\text{가 이걸 감시}
$$

## 3상 교류기기의 기본식

$$
\boxed{
\begin{aligned}
V_0 &= -Z_0 I_0 \\
V_1 &= E_a - Z_1 I_1 \\
V_2 &= -Z_2 I_2
\end{aligned}
}
$$

$$
\text{\textbf{정상분에만 기전력} } E_a \text{ 가 있다}
$$

### 왜 정상분에만인가

$$
\text{\textbf{발전기는 평형 3상을 만든다}}(\text{mc.2.1})
$$

$$
\text{\textbf{평형 = 정상분만}} \;\Longrightarrow\; \text{발전기의 기전력은 \textbf{정상분}}\text{뿐}
$$

$$
\text{\textbf{역상・영상은 사고 때 생긴다}} \;-\; \text{발전기가 만드는 게 아니라}
$$

$$
\boxed{\text{\textbf{정상분은 원인, 역상・영상은 결과}}}
$$

### 세 임피던스

$$
\text{일반적으로 } Z_1 \neq Z_2 \neq Z_0
$$

| 임피던스 | 크기 |
|---|---|
| $Z_1$ (정상) | 보통 |
| $Z_2$ (역상) | $Z_1$ 과 비슷하거나 작다 |
| $Z_0$ (영상) | **접지 방식에 따라 크게 다름** |

$$
\text{\textbf{정지 기기}}(\text{변압기・선로})\text{는 } Z_1 = Z_2
$$

$$
\text{\textbf{회전 기기}}\text{는 } Z_1 \neq Z_2 \;-\; \text{회전자계의 방향이 다르니}
$$

**mc.2.7의 안정도 대책**에서 "정상분은 작게, 영상·역상은 크게"라고 한 게 이것이다.

$$
Z_1 \downarrow \;\Longrightarrow\; \text{평소 전력 전달이 잘 됨}
$$
$$
Z_0, Z_2 \uparrow \;\Longrightarrow\; \text{사고 전류가 제한됨}
$$

### 사고별 대칭분

$$
\text{\textbf{pw.3.3에서 본 그것}}
$$

| 사고 | 나타나는 대칭분 |
|---|---|
| **3상 단락** | **정상분만** |
| **선간 단락** | **정상 + 역상** |
| **1선 지락** | **정상 + 역상 + 영상** |
| 2선 지락 | 정상 + 역상 + 영상 |

$$
\boxed{\text{\textbf{3상 단락은 평형 사고}}} \;-\; \text{대칭좌표법이 필요 없다}
$$

$$
\text{\textbf{1선 지락}}: I_0 = I_1 = I_2 = \dfrac{E_a}{Z_0+Z_1+Z_2}
$$

$$
I_g = 3I_0 = \dfrac{3E_a}{Z_0+Z_1+Z_2}
$$

$$
\text{\textbf{세 임피던스를 다 더한다}} \;-\; \text{직렬 접속}
$$

**$Z_0$ 가 지락전류를 좌우한다.** 그래서 접지 방식(pw.4.1)이 중요하다.

$$
\text{\textbf{직접접지}}: Z_0 \text{ 작음} \;\Longrightarrow\; \text{지락전류 \textbf{큼}}
$$
$$
\text{\textbf{비접지}}: Z_0 \to \infty \;\Longrightarrow\; \text{지락전류 \textbf{거의 0}}
$$

## 대칭분에 의한 전력표시

$$
\boxed{P = 3(V_0I_0\cos\theta_0 + V_1I_1\cos\theta_1 + V_2I_2\cos\theta_2)}
$$

$$
S = 3(V_0\bar{I_0} + V_1\bar{I_1} + V_2\bar{I_2})
$$

$$
\boxed{\text{\textbf{3배가 붙는다}}}
$$

### 왜 3배인가

$$
\text{\textbf{대칭분 하나가 세 상 전부}}\text{를 나타내니}
$$

$$
V_1 \text{ 은 \textbf{한 상의 정상분}}\text{인데, 세 상에 다 있다} \;\Longrightarrow\; \times 3
$$

$$
\text{\textbf{같은 차수끼리만 전력을 만든다}} \;-\; \text{ct.1.4의 직교성과 같은 구조}
$$

$$
V_1 \text{ 과 } I_2 \text{ 는 전력을 못 만든다} \;-\; \text{\textbf{직교}}
$$

**푸리에에서 3차 전압과 5차 전류가 전력을 못 만든 것**과 같다. 직교하는 성분은 서로
일을 안 한다.

$$
\boxed{\text{\textbf{직교 분해의 공통 성질}}}
$$

| 어디서 | 직교하는 것 |
|---|---|
| **ct.1.3** | $P$ 와 $Q$ ($S = \sqrt{P^2+Q^2}$) |
| **ct.1.4** | 서로 다른 고조파 |
| **ct.1.6** | 영상·정상·역상 |
| **mc.4.2** | 철손전류와 자화전류 |

$$
\text{\textbf{같은 수학이 네 곳에서}}
$$

## 정리

$$
\boxed{V_a = V_0+V_1+V_2, \qquad V_0 = \dfrac{1}{3}(V_a+V_b+V_c)}
$$

$$
\textbf{합성에는 } \tfrac{1}{3} \text{ 이 없고, 분해에는 있다}
$$

| 대칭분 | 회전자계 | 해로운 곳 | 검출 |
|---|---|---|---|
| **영상** | **없음** | **통신선** | **ZCT · GPT** |
| **정상** | **정방향** | — | — |
| **역상** | **역방향** | **회전기** | **46번 계전기** |

$$
\boxed{\text{불평형률} = \dfrac{V_2}{V_1} \times 100} \;-\; \text{\textbf{역상분}}\text{이 기준}
$$

$$
\boxed{\Delta \text{ 와 비접지 Y에는 영상분이 없다}} \;-\; \text{갈 길이 없으니}
$$

$$
\textbf{ct.1.5의 } \text{ 1+a+a} ^2 \text{=0}\text{ 하나가 이 모든 걸 떠받친다}
$$
