---
id: ct.2.6
title: 근궤적과 자동제어의 보상
status: reviewed
summary: 이득을 키우면 극이 어디로 가나. 그 자취가 근궤적이고, 원하는 데로 끌어오는 게 보상이다.
covers:
  - ct.2.6.1
  - ct.2.6.2
  - ct.2.6.3
  - ct.2.6.4
  - ct.2.6.5
formulas:
  - label: 근궤적의 조건
    tex: \angle GH = \pm180°(2k+1) \;(\text{\textbf{위상}}), \qquad |GH| = 1 \;(\text{\textbf{크기}})
    note: '**위상 조건이 궤적을 그리고, 크기 조건이 K를 정한다**.'
  - label: 점근선의 각도
    tex: \theta = \dfrac{\pm180°(2k+1)}{P - Z}
    note: '$P$ 극의 수, $Z$ 영점의 수. **$P-Z$ 개의 가지가 무한대로**.'
  - label: 점근선의 교점
    tex: \sigma = \dfrac{\sum(\text{극}) - \sum(\text{영점})}{P - Z}
    note: 실축 위의 한 점. 무게중심 같은 것.
  - label: PID 동작
    tex: u = K_p\left(e + \dfrac{1}{T_i}\int e\,dt + T_d\dfrac{de}{dt}\right)
    note: '**P는 남기고, I는 지우고, D는 앞서간다**.'
traps:
  - '**근궤적은 K가 0에서 ∞로 갈 때 극의 자취**다. K=0이면 개루프 극, K=∞면 영점으로 간다.'
  - '**진상보상은 속응성, 지상보상은 정상편차** 개선이다. 목적이 다르다.'
  - '**D 동작은 잡음을 증폭**한다. 미분이 고주파를 키우니.'
  - '**I 동작은 잔류편차를 없애지만 안정도를 나쁘게** 한다. 공짜가 아니다.'
related:
  - ct.2.5
  - ct.2.4
  - ct.2.2
---

## 근궤적

$$
\boxed{\textbf{이득 } \text{ K } \text{ 를 0에서 } \infty \text{ 로 바꿀 때 } \textbf{극의 자취}}
$$

$$
1 + KG_1H_1 = 0 \;-\; \text{\textbf{K가 변하면 근도 변한다}}
$$

$$
\text{\textbf{ct.2.5가 "안정한가"}}\text{를 물었다면}
$$

$$
\boxed{\text{\textbf{근궤적은 "K를 얼마로 하면 되나"}}\text{를 답한다}}
$$

$$
\text{\textbf{설계 도구}} \;-\; \text{판정이 아니라}
$$

### 왜 필요한가

$$
\text{\textbf{ct.2.4}}: K \uparrow \;\Longrightarrow\; \text{\textbf{정확}}\text{해진다}
$$

$$
\text{\textbf{ct.2.5}}: K \uparrow \;\Longrightarrow\; \text{\textbf{불안정}}\text{해진다}
$$

$$
\boxed{\text{\textbf{그 사이 어딘가}}\text{에 답이 있다}}
$$

$$
\text{\textbf{K를 바꾸며 극이 어디로 가나}}\text{를 보면 고를 수 있다}
$$

## 근궤적의 조건

$$
1 + KG_1H_1 = 0 \;\Longrightarrow\; KG_1H_1 = -1
$$

$$
\boxed{
\begin{aligned}
\text{\textbf{위상 조건}}: &\quad \angle G_1H_1 = \pm180°(2k+1) \\
\text{\textbf{크기 조건}}: &\quad K|G_1H_1| = 1
\end{aligned}
}
$$

$$
\text{\textbf{$-1$ 이라는 복소수}} \;-\; \text{크기 1, 각도 } 180°
$$

$$
\boxed{\text{\textbf{위상 조건이 궤적을 그리고, 크기 조건이 K를 정한다}}}
$$

$$
\text{\textbf{먼저 그리고 나중에 K를 읽는다}}
$$

$$
K = \dfrac{1}{|G_1H_1|} \;-\; \text{궤적 위의 점에서 계산}
$$

$$
\text{\textbf{ct.2.5의 } GH = -1}\text{ 과 같은 식} \;-\; \text{나이퀴스트도 } -1 \text{ 을 봤다}
$$

**두 방법이 같은 조건을 다르게 본다.** 나이퀴스트는 $\omega$ 를 바꾸며 $GH$ 를 그리고,
근궤적은 $K$ 를 바꾸며 $s$ 를 그린다.

## 근궤적의 성질

| 성질 | |
|---|---|
| **가지의 수** | **$P$** (극의 수) |
| **출발점** ($K=0$) | **개루프 극** |
| **도착점** ($K=\infty$) | **개루프 영점** 또는 **무한대** |
| **실축 위** | **오른쪽 극·영점의 수가 홀수**인 구간 |
| **대칭** | **실축에 대칭** |
| **무한대로 가는 가지** | **$P - Z$ 개** |

$$
\boxed{\text{\textbf{극에서 출발해 영점으로 간다}}}
$$

### 왜 극에서 출발하나

$$
K = 0 \;\Longrightarrow\; 1 + KG_1H_1 = 1 \neq 0 ?
$$

$$
\text{\textbf{정확히는}}: 1 + K\dfrac{N(s)}{D(s)} = 0 \;\Longrightarrow\; D(s) + KN(s) = 0
$$

$$
K = 0 \;\Longrightarrow\; D(s) = 0 \;\Longrightarrow\; \boxed{\text{\textbf{개루프 극}}}
$$

$$
K = \infty \;\Longrightarrow\; N(s) = 0 \;\Longrightarrow\; \boxed{\text{\textbf{개루프 영점}}}
$$

$$
\text{\textbf{깔끔하다}} \;-\; \text{양 끝이 정해져 있다}
$$

### 영점이 모자라면

$$
P > Z \;\Longrightarrow\; \text{\textbf{갈 영점이 모자란다}}
$$

$$
\boxed{P - Z \text{ 개의 가지가 \textbf{무한대}}\text{로}}
$$

$$
\text{\textbf{무한대에 영점이 있다}}\text{고 보면 된다}
$$

$$
\text{\textbf{점근선}}\text{을 따라 간다}
$$

### 점근선

$$
\boxed{\theta = \dfrac{\pm180°(2k+1)}{P - Z}}
$$

$$
\boxed{\sigma = \dfrac{\sum(\text{\textbf{극}}) - \sum(\text{\textbf{영점}})}{P - Z}}
$$

$$
\textbf{실축 위의 한 점 } \sigma \text{ 에서 } \theta \text{ 방향으로}
$$

| $P-Z$ | 점근선 각도 |
|---|---|
| **1** | $180°$ |
| **2** | **$\pm90°$** |
| **3** | **$\pm60°, 180°$** |
| 4 | $\pm45°, \pm135°$ |

$$
\text{\textbf{$P-Z = 2$ 면 수직}}\text{으로 올라간다} \;-\; \text{허수축과 나란히}
$$

$$
\text{\textbf{$P-Z \geq 3$ 이면}} \;\Longrightarrow\; \text{\textbf{반드시 우반면으로}} \;\Longrightarrow\; \text{\textbf{K가 크면 불안정}}
$$

$$
\boxed{\text{\textbf{점근선만 봐도 안정 여부의 감이 온다}}}
$$

**$P - Z \geq 3$ 이면 이득을 계속 키울 수 없다.** 반드시 어딘가에서 불안정해진다.

### 실축 위의 궤적

$$
\boxed{\text{\textbf{그 점 오른쪽의 극・영점 수가 홀수}}\text{면 궤적}}
$$

$$
\text{\textbf{위상 조건}}\text{에서 나온다} \;-\; \text{각 극・영점이 } 180° \text{ 씩 기여}
$$

$$
\text{\textbf{홀수 개면 합이 } 180° \text{ 의 홀수배}} \;\Longrightarrow\; \text{조건 만족}
$$

$$
\text{\textbf{복소 극・영점은 켤레쌍}}\text{이라 서로 상쇄} \;-\; \text{실축에서는 안 센다}
$$

### 이탈점

$$
\text{\textbf{두 극이 만나 복소평면으로 갈라지는 점}}
$$

$$
\dfrac{dK}{ds} = 0 \;\Longrightarrow\; \text{\textbf{이탈점}}
$$

$$
\text{\textbf{거기서부터 진동}}\text{이 시작된다} \;-\; \text{복소근이 생기니}
$$

### 허수축과의 교점

$$
\text{\textbf{라우스 판별법}}\text{으로 구한다}(\text{ct.2.5})
$$

$$
\text{\textbf{한 행이 전부 0}} \;\Longrightarrow\; \text{\textbf{허수축에 근}} \;\Longrightarrow\; \text{그때의 } K \text{ 가 \textbf{임계 이득}}
$$

$$
\boxed{K > K_{cr} \;\Longrightarrow\; \text{\textbf{불안정}}}
$$

$$
\text{\textbf{두 방법이 만난다}} \;-\; \text{근궤적의 교점을 라우스로}
$$

## 자동제어의 보상

$$
\text{\textbf{원하는 극 배치가 안 나오면}} \;\Longrightarrow\; \text{\textbf{보상기}}\text{를 넣는다}
$$

$$
\boxed{\text{\textbf{극・영점을 추가해 궤적을 끌어온다}}}
$$

$$
\text{\textbf{K만으로는 궤적 위에서만} 고를 수 있다}
$$

$$
\text{\textbf{궤적 자체를 바꾸려면}} \;\Longrightarrow\; \text{보상}
$$

## 종속보상법

$$
\text{\textbf{순방향 경로에 직렬로} 보상기를 넣는다}
$$

$$
G_c(s)G(s) \;-\; \text{가장 흔한 방식}
$$

| 보상 | 전달함수 | 목적 |
|---|---|---|
| **진상**(lead) | $\frac{s+z}{s+p}$, $z < p$ | **속응성** |
| **지상**(lag) | $\frac{s+z}{s+p}$, $z > p$ | **정상편차** |
| **진지상**(lag-lead) | 둘을 합침 | **둘 다** |

$$
\boxed{\text{\textbf{영점이 극보다 원점에 가까우면 진상}}}
$$

$$
z < p \;\Longrightarrow\; \text{\textbf{진상}} \;\Longrightarrow\; \text{위상이 \textbf{앞선다}}
$$

### 진상보상

$$
\boxed{\text{\textbf{위상을 앞세워 위상여유}}\text{를 늘린다}}
$$

| 효과 | |
|---|---|
| **위상여유 증가** | **안정도 향상** |
| **대역폭 증가** | **빨라진다** |
| **오버슈트 감소** | |
| 정상편차 | **거의 안 변함** |
| **잡음에 민감** | 고주파를 키우니 |

$$
\text{\textbf{D 동작과 비슷}} \;-\; \text{미분이 위상을 앞세우니}
$$

$$
\text{\textbf{속응성을 얻고 잡음을 얻는다}}
$$

## 지상보상의 영향

$$
\boxed{\text{\textbf{저주파 이득을 키워 정상편차}}\text{를 줄인다}}
$$

| 효과 | |
|---|---|
| **정상편차 감소** | **정확도 향상** |
| **저주파 이득 증가** | |
| **대역폭 감소** | **느려진다** |
| **잡음 억제** | 고주파를 깎으니 |
| 위상여유 | 조금 개선 |

$$
\text{\textbf{I 동작과 비슷}} \;-\; \text{적분이 저주파 이득을 키우니}
$$

$$
\text{\textbf{정확도를 얻고 속도를 낸다}}
$$

$$
\boxed{\text{\textbf{진상은 빠르게, 지상은 정확하게}}}
$$

$$
\text{\textbf{목적이 정반대}} \;-\; \text{시험 함정}
$$

$$
\text{\textbf{둘 다 필요하면}} \;\Longrightarrow\; \text{\textbf{진지상 보상}}
$$

### 그 밖의 보상

| 방식 | |
|---|---|
| **피드백 보상** | 되먹임 경로에 |
| **외란 보상** | 외란을 미리 재서 |
| **전향 보상** | 목표값을 미리 |

$$
\text{\textbf{되먹임 보상}}\text{은 잡음에 강하다} \;-\; \text{순방향 잡음을 안 키우니}
$$

## 조절기의 제어동작

$$
\boxed{u = K_p\left(e + \dfrac{1}{T_i}\int e\,dt + T_d\dfrac{de}{dt}\right)}
$$

$$
\text{\textbf{PID}} \;-\; \text{산업 제어의 표준}
$$

### P 동작 (비례)

$$
u = K_pe
$$

$$
\boxed{\text{\textbf{잔류편차}}(\text{offset})\text{가 남는다}}
$$

$$
\text{\textbf{편차가 있어야 조작량이 있다}} \;\Longrightarrow\; \text{\textbf{편차가 0이면 일을 안 한다}}
$$

$$
\text{\textbf{그래서 편차가 남는다}} \;-\; \text{ct.2.4의 0형}
$$

$$
K_p \uparrow \;\Longrightarrow\; \text{편차} \downarrow \;\text{그런데}\; \text{\textbf{진동}} \uparrow
$$

$$
\text{\textbf{비례대}}(\text{PB}) = \dfrac{1}{K_p} \times 100\ \mathrm{[\%]} \;-\; \text{역수}
$$

$$
\text{\textbf{비례대가 좁으면 이득이 크다}}
$$

### I 동작 (적분)

$$
u = \dfrac{K_p}{T_i}\int e\,dt
$$

$$
\boxed{\text{\textbf{잔류편차를 없앤다}}}
$$

$$
\text{\textbf{ct.2.4에서 본 논리}} \;-\; \text{편차가 0이 될 때까지 안 멈춘다}
$$

$$
\text{\textbf{형을 하나 올린다}} \;-\; \dfrac{1}{s} \text{ 를 추가하니}
$$

| 대가 | |
|---|---|
| **안정도 악화** | 위상이 $-90°$ 늦어짐 |
| **응답이 느려짐** | |
| **와인드업** | 포화 시 적분이 계속 쌓임 |

$$
\boxed{\text{\textbf{공짜가 아니다}}}
$$

$$
\text{\textbf{적분기의 위상 지연}} \;-\; \dfrac{1}{j\omega} \;\Longrightarrow\; -90°
$$

$$
\text{\textbf{위상여유를 } 90° \text{ 깎는다}}(\text{ct.2.5}) \;\Longrightarrow\; \text{불안정해질 수 있다}
$$

**적분 와인드업**은 실무의 골칫거리다. 조작량이 포화됐는데 편차가 남아 있으면 적분이
계속 쌓여, 나중에 반대로 크게 오버슈트한다.

$$
\text{\textbf{안티 와인드업}}\text{이 필요}
$$

### D 동작 (미분)

$$
u = K_pT_d\dfrac{de}{dt}
$$

$$
\boxed{\text{\textbf{편차의 변화율}}\text{을 본다} \;-\; \text{\textbf{미래를 예측}}}
$$

$$
\text{\textbf{편차가 빨리 커지고 있으면}} \;\Longrightarrow\; \text{\textbf{미리 세게}}
$$

| 효과 | |
|---|---|
| **속응성 향상** | 앞서가니 |
| **오버슈트 감소** | 미리 제동 |
| **안정도 향상** | 위상이 $+90°$ |
| **잡음 증폭** | **고주파를 키움** |
| 단독 사용 불가 | 정상상태에서 $\frac{de}{dt}=0$ |

$$
\boxed{\text{\textbf{D 단독으로는 못 쓴다}}}
$$

$$
\text{\textbf{편차가 일정하면}} \;\Longrightarrow\; \dfrac{de}{dt} = 0 \;\Longrightarrow\; \text{\textbf{조작량 0}}
$$

$$
\text{\textbf{편차가 있어도 일을 안 한다}} \;-\; \text{쓸모없다}
$$

$$
\text{\textbf{반드시 P나 PI와 함께}}
$$

### 잡음 문제

$$
\dfrac{d}{dt} \;\Longrightarrow\; j\omega \;\Longrightarrow\; \text{\textbf{주파수에 비례해 증폭}}
$$

$$
\text{\textbf{고주파 잡음이 크게 증폭}}
$$

$$
\text{\textbf{ct.2.2의 아날로그계산기}}\text{에서 미분기를 안 쓴 이유}\text{와 같다}
$$

$$
\textbf{실무에서 } \text{ T} _d \text{ 를 크게 못 잡는다} \;-\; \text{잡음 때문}
$$

$$
\text{\textbf{필터}}\text{를 같이 쓴다} \;-\; \dfrac{T_ds}{1 + \frac{T_d}{N}s}
$$

## 조합

| 동작 | 잔류편차 | 안정도 | 속응성 |
|---|---|---|---|
| **P** | **남음** | 보통 | 보통 |
| **PI** | **없음** | **나빠짐** | 느림 |
| **PD** | 남음 | **좋아짐** | **빠름** |
| **PID** | **없음** | **좋음** | **빠름** |

$$
\boxed{\text{\textbf{PID가 다 좋다}}} \;-\; \text{그래서 표준}
$$

$$
\text{\textbf{P는 남기고, I는 지우고, D는 앞서간다}}
$$

$$
\text{\textbf{튜닝}}\text{이 어렵다} \;-\; \text{세 파라미터를 맞춰야}
$$

$$
\text{\textbf{지글러-니콜스}}\text{법이 고전적 튜닝법}
$$

### 온-오프 동작

$$
\text{\textbf{2위치 제어}} \;-\; \text{켜거나 끄거나}
$$

$$
\text{\textbf{가장 단순}}\text{하고 \textbf{가장 싸다}}
$$

$$
\text{\textbf{반드시 진동}}\text{한다} \;-\; \text{중간이 없으니}
$$

$$
\text{\textbf{히스테리시스}}\text{를 줘서 채터링 방지}
$$

$$
\text{\textbf{가정용 온도조절기}} \;-\; \text{정밀할 필요가 없으면 이걸로 충분}
$$

## 정리

$$
\boxed{\text{\textbf{근궤적}}: K = 0 \text{ 이면 \textbf{극}}, \; K = \infty \text{ 면 \textbf{영점}}}
$$

$$
\boxed{\theta = \dfrac{\pm180°(2k+1)}{P-Z}, \qquad \sigma = \dfrac{\sum\text{극} - \sum\text{영점}}{P-Z}}
$$

| 보상 | 목적 | 부작용 |
|---|---|---|
| **진상** ($z<p$) | **속응성** | 잡음 |
| **지상** ($z>p$) | **정상편차** | 느려짐 |

| 동작 | 하는 일 | 대가 |
|---|---|---|
| **P** | 기본 | **잔류편차** |
| **I** | **편차 제거** | **안정도 악화** |
| **D** | **앞서감** | **잡음 증폭** |

$$
\boxed{\text{\textbf{P는 남기고, I는 지우고, D는 앞서간다}}}
$$

$$
\text{\textbf{제어공학 전체가 속응성과 안정도의 거래}} \;-\; \text{ct.2.1부터 여기까지}
$$
