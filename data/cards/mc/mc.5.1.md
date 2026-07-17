---
id: mc.5.1
title: 유도전동기의 구조 및 원리
status: reviewed
summary: 회전자계가 회전자를 끌고 간다. 다만 완전히 따라잡으면 토크가 사라져서 늘 조금 뒤진다.
covers:
  - mc.5.1.1
  - mc.5.1.2
  - mc.5.1.3
formulas:
  - label: 동기속도
    tex: N_s = \dfrac{120f}{P}\ \mathrm{[rpm]}
    note: 회전자계의 속도. **회전자는 이보다 느리다.**
  - label: 슬립
    tex: s = \dfrac{N_s - N}{N_s}
    note: '**뒤진 정도**. 정지 $s=1$, 동기속도 $s=0$, 전부하 $s = 0.025 \sim 0.05$.'
  - label: 회전자 속도
    tex: N = (1-s)N_s = (1-s)\dfrac{120f}{P}\ \mathrm{[rpm]}
    note: 슬립을 알면 속도가 나온다.
  - label: 상대속도
    tex: N_s - N = s\,N_s
    note: '**회전자계가 회전자를 앞지르는 속도**. 이게 기전력을 만든다.'
traps:
  - '**슬립이 0이면 토크가 0**이다. 따라잡는 순간 자속을 못 끊어 기전력이 사라진다.
    그래서 유도전동기는 절대 동기속도로 못 돈다.'
  - '**정지 상태가 s=1**이다. 0이 아니다. 슬립은 "뒤진 정도"다.'
  - '**회전자계는 3상 전류가 만든다.** 자석이 도는 게 아니라 자계가 도는 것.'
  - 아라고 원판이 유도전동기의 조상이다. **회전자계 → 와전류 → 힘**.
related:
  - mc.5.2
  - em.7.1
  - mc.2.1
---

## 유도전동기의 회전 원리

$$
\boxed{\text{\textbf{회전자계}가 회전자를 \textbf{끌고 간다}}}
$$

$$
\text{회전자계} \to \text{회전자에 \textbf{기전력}}(e = Blv) \to \text{\textbf{전류}} \to \text{\textbf{힘}}(F = BIl)
$$

**전자기학의 두 식이 연달아 쓰인다.** em.7.4의 $e = Blv$ 로 전류를 만들고, em.5의
$F = BIl$ 로 힘을 낸다.

### 아라고 원판

$$
\text{\textbf{유도전동기의 조상}}
$$

구리 원판 옆에서 자석을 돌리면 **원판이 따라 돈다.**

$$
\text{자석 회전} \to \text{원판에 \textbf{와전류}}(\text{em.7.1}) \to \text{렌츠의 법칙} \to \text{\textbf{자석을 따라감}}
$$

$$
\text{\textbf{렌츠의 법칙}} \;-\; \text{"상대운동을 방해하는 방향"}
$$

원판 입장에서 자석이 다가오는 걸 막으려면 **같이 도는 수밖에** 없다.

$$
\text{\textbf{자석을 3상 전류로 바꾸면} 유도전동기}
$$

### 왜 동기속도로 못 도나

$$
\boxed{\text{\textbf{따라잡으면 토크가 0}}}
$$

$$
N = N_s \;\Longrightarrow\; \text{상대속도} = 0 \;\Longrightarrow\; \text{자속을 \textbf{안 끊음}} \;\Longrightarrow\; e = 0 \;\Longrightarrow\; I_2 = 0 \;\Longrightarrow\; T = 0
$$

$$
\text{\textbf{토크가 0이면 감속}} \;\Longrightarrow\; \text{다시 뒤짐} \;\Longrightarrow\; \text{토크 부활}
$$

$$
\boxed{\text{\textbf{영원히 조금 뒤진다}} \;-\; \text{그래서 \textbf{비동기} 전동기}}
$$

**이게 유도전동기의 정체**다. 따라잡으려 애쓰지만 잡는 순간 힘이 사라져서 잡을 수
없다.

$$
\text{동기기: \textbf{같이 돈다}} \qquad / \qquad \text{유도기: \textbf{영원히 쫓아간다}}
$$

**mc.2.6의 제동권선**이 평소에 놀다가 난조 때만 일하는 것도 같은 이치다. 상대속도가
있어야 일한다.

## 슬립

$$
\boxed{s = \dfrac{N_s - N}{N_s}}
$$

$$
\text{\textbf{얼마나 뒤졌나}}\text{를 비율로}
$$

| 상태 | $s$ | $N$ |
|---|---|---|
| **정지** | **1** | 0 |
| **전부하** | **0.025 ~ 0.05** | $0.95 \sim 0.975 N_s$ |
| **무부하** | $\approx 0$ | $\approx N_s$ |
| **동기속도** | **0** | $N_s$ (불가능) |

$$
\boxed{0 < s < 1 \quad(\text{전동기})}
$$

**정지가 $s=1$** 이라는 게 헷갈린다. 슬립은 "뒤진 정도"라 **하나도 못 따라갔으면 1**이다.

$$
\textbf{전부하 슬립이 2.5~5} \% \;-\; \text{작은 값이다}
$$

$$
\text{4극 } 60\ \mathrm{Hz}: N_s = 1800 \;\Longrightarrow\; N \approx 1710 \sim 1755\ \mathrm{rpm}
$$

**거의 동기속도로 돈다.** 그래서 유도전동기도 "대체로 정속도"로 친다.

### 회전자 속도

$$
\boxed{N = (1-s)N_s = (1-s)\dfrac{120f}{P}}
$$

$$
\text{상대속도} = N_s - N = sN_s
$$

$$
\text{\textbf{세 속도}} \;-\; \text{표로 잡으면 편하다}
$$

| | 값 (동기속도를 1로) |
|---|---|
| **동기속도** (회전자계) | **1** |
| **상대속도** (미끄러짐) | **$s$** |
| **실제속도** (회전자) | **$1-s$** |

$$
\text{\textbf{1 = s + (1-s)}} \;-\; \text{당연한 항등식인데 문제 풀이에 유용}
$$

### 슬립의 범위 — 셋으로 갈린다

$$
\boxed{s < 0 \;(\text{\textbf{발전기}}) \quad 0 < s < 1 \;(\text{\textbf{전동기}}) \quad 1 < s < 2 \;(\text{\textbf{제동}})}
$$

$$
s < 0 \;\Longrightarrow\; N > N_s \;\Longrightarrow\; \text{\textbf{동기속도보다 빠름}} \;\Longrightarrow\; \text{\textbf{유도발전기}}(\text{mc.5.6})
$$

$$
s > 1 \;\Longrightarrow\; N < 0 \;\Longrightarrow\; \text{\textbf{거꾸로 돎}} \;\Longrightarrow\; \text{\textbf{역상제동}}(\text{mc.5.3})
$$

$$
\text{역회전 시: } s' = \dfrac{N_s - (-N)}{N_s} = \dfrac{N_s + N}{N_s} = 2 - s
$$

**$s' = 2 - s$** 다. 전부하($s=0.05$)에서 역상제동을 걸면 $s' = 1.95$ 다.

$$
\text{\textbf{같은 기계가 슬립에 따라 세 얼굴}}
$$

## 회전자기장 발생

$$
\boxed{\text{\textbf{3상 전류}가 \textbf{회전자계}를 만든다}}
$$

$$
\text{공간적으로 } 120° \text{ 벌린 세 코일} + \text{시간적으로 } 120° \text{ 어긋난 세 전류}
$$

$$
\Longrightarrow \text{\textbf{크기 일정, 방향만 회전}}\text{하는 자계}
$$

### 왜 도나

각 상이 만드는 자계를 벡터로 더하면

$$
\vec{H} = H_m\left[\sin\omega t \cdot \hat{a} + \sin(\omega t - 120°)\cdot\hat{b} + \sin(\omega t-240°)\cdot\hat{c}\right]
$$

$$
= \dfrac{3}{2}H_m \angle \omega t
$$

$$
\boxed{\text{크기} = \dfrac{3}{2}H_m \;(\text{\textbf{일정}}), \quad \text{각도} = \omega t \;(\text{\textbf{회전}})}
$$

**크기가 일정하고 각도만 도는 게 핵심**이다. 세 개의 진동하는 자계를 더했더니
회전하는 자계가 나온다.

$$
\text{\textbf{진동} 3개} \;\Longrightarrow\; \text{\textbf{회전} 1개}
$$

**전기기기 전체에서 가장 아름다운 결과**다. 도는 부품 없이 자계를 돌린다.

### 단상은 왜 안 되나

$$
\text{단상: } H = H_m\sin\omega t \cdot \hat{a} \;-\; \text{\textbf{방향이 고정}}\text{, 크기만 진동}
$$

$$
\text{\textbf{맥동자계}} \;-\; \text{회전자계가 아니다}
$$

$$
\text{맥동자계} = \text{\textbf{반대 방향으로 도는 두 회전자계}}\text{의 합}
$$

$$
\sin\omega t = \dfrac{1}{2}\left[\text{정방향 회전} + \text{역방향 회전}\right]
$$

**두 힘이 상쇄**되어 기동 토크가 0이다. mc.5.7의 단상유도전동기가 온갖 기동장치를
다는 이유다.

$$
\text{\textbf{3상이 우월한 근본 이유}} \;-\; \text{저절로 회전자계가 생긴다}
$$

### 회전 방향을 바꾸려면

$$
\boxed{\text{\textbf{3상 중 두 상을 바꾼다}}}
$$

$$
\text{a-b-c} \to \text{a-c-b} \;\Longrightarrow\; \text{\textbf{역회전}}
$$

**상회전이 뒤집히면 자계도 반대로 돈다.** 선 두 가닥만 바꾸면 된다.

$$
\text{\textbf{역상제동}}(\text{플러깅})\text{이 이렇게 구현된다}(\text{mc.5.3})
$$

## 3상유도전동기의 구조

| 부분 | |
|---|---|
| **고정자** | 성층철심 + **3상 권선** → 회전자계 |
| **회전자** | **농형** 또는 **권선형** |
| 공극 | **작다** ($0.3 \sim 2\ \mathrm{mm}$) |

$$
\text{\textbf{정류자도 슬립링도 없다}}(\text{농형}) \;\Longrightarrow\; \text{\textbf{튼튼하고 싸다}}
$$

### 농형 vs 권선형

| | **농형** | **권선형** |
|---|---|---|
| 회전자 | **구리·알루미늄 막대** + 단락환 | **3상 권선** + **슬립링** |
| 구조 | **매우 단순** | 복잡 |
| **값** | **싸다** | 비싸다 |
| **보수** | **거의 불필요** | 슬립링 관리 |
| **기동토크** | 작다 | **크다** (저항 삽입) |
| **속도제어** | 어렵다 (인버터 필요) | **2차 저항으로** |
| 용도 | **대부분** | 대형·기동 빈번 |

$$
\boxed{\text{\textbf{농형이 압도적}}} \;-\; \text{전 세계 전동기의 대부분}
$$

**다람쥐 쳇바퀴**(squirrel cage)처럼 생겨서 농형이다. 막대를 양끝에서 단락환으로
묶은 게 전부다.

$$
\text{\textbf{권선이 없다}} \;-\; \text{절연도 필요 없다} \;\Longrightarrow\; \text{\textbf{튼튼}}
$$

**mc.1.1의 정류자**와 대비된다. 직류기의 약점이 여기엔 아예 없다.

$$
\text{\textbf{그래서 유도전동기가 이겼다}}
$$

### 권선형의 존재 이유

$$
\text{\textbf{2차에 저항을 넣을 수 있다}} \;\Longrightarrow\; \text{\textbf{비례추이}}(\text{mc.5.2})
$$

$$
\text{기동토크를 \textbf{최대}로 만들 수 있다}
$$

**슬립링으로 회전자 권선을 밖으로 뽑아** 저항을 단다. 그게 유일한 목적이다.

$$
\text{요즘은 \textbf{인버터}가 대신한다}(\text{mc.3.3}) \;\Longrightarrow\; \text{권선형이 줄어듦}
$$

### 공극이 작다

$$
\text{유도전동기 공극: } 0.3 \sim 2\ \mathrm{mm} \;-\; \text{\textbf{아주 작다}}
$$

$$
\text{공극} \uparrow \;\Longrightarrow\; \text{자기저항} \uparrow \;\Longrightarrow\; \text{\textbf{자화전류}} \uparrow \;\Longrightarrow\; \text{\textbf{역률}} \downarrow
$$

**자속을 1차에서 다 만들어야** 하기 때문이다. 동기기처럼 계자가 따로 없다.

$$
\boxed{\text{\textbf{유도전동기의 역률이 나쁜 근본 이유}}}
$$

$$
\text{공극이 작아야 역률이 그나마 유지} \;-\; \text{기계 가공이 정밀해야 한다}
$$

**동기기는 공극이 넓어도 된다.** 계자가 자속을 대주니까. 그래서 mc.2.4의 철기계는
일부러 공극을 넓힌다.

$$
\text{유도기: 공극 \textbf{최소}} \qquad / \qquad \text{동기기(철기계): 공극 \textbf{최대}}
$$

**요구가 정반대**다. 자속을 어디서 만드느냐가 갈랐다.

## 정리

$$
\boxed{s = \dfrac{N_s - N}{N_s}, \qquad N = (1-s)N_s}
$$

| | 동기속도 | 상대속도 | 실제속도 |
|---|---|---|---|
| 값 | **1** | **$s$** | **$1-s$** |

$$
\boxed{\text{\textbf{따라잡으면 토크가 0}} \;\Longrightarrow\; \text{\textbf{영원히 조금 뒤진다}}}
$$

$$
\text{3상 전류} \to \text{\textbf{회전자계}} \to e = Blv \to I_2 \to F = BIl \to \text{회전}
$$

**전자기학의 기본 두 식이 연달아** 작동하는 게 유도전동기다. 그런데 그 결과가
**정류자도 슬립링도 없는 가장 튼튼한 전동기**다.
