---
id: mc.4.8
title: 변압기의 손실, 효율, 온도상승 및 정격
status: reviewed
summary: 철손 = 동손일 때 최대 효율. 부하율이 낮으면 철손을 줄여야 하고, 그게 전일효율이다.
covers:
  - mc.4.8.1
  - mc.4.8.2
  - mc.4.8.3
  - mc.4.8.4
formulas:
  - label: 최대 효율 조건 (전부하)
    tex: P_i = P_c \quad(\text{\textbf{철손} = \textbf{동손}})
    note: 회전기의 "고정손 = 가변손"과 같다(mc.1.9).
  - label: 최대 효율 조건 (1/m 부하)
    tex: P_i = \left(\dfrac{1}{m}\right)^2 P_c \;\Longrightarrow\; \dfrac{1}{m} = \sqrt{\dfrac{P_i}{P_c}}
    note: '**부하율 1/m 에서 최대**가 되게 설계한다.'
  - label: 효율
    tex: \eta = \dfrac{P\cos\theta}{P\cos\theta + P_i + P_c} \times 100
    note: 분모에 손실을 더한다. **규약효율**.
  - label: 전일효율
    tex: \eta_d = \dfrac{\sum(\text{출력} \times h)}{\sum(\text{출력} \times h) + 24P_i + \sum(P_c \times h)} \times 100
    note: '**철손에만 24를 곱한다.** 하루 종일 걸려 있으니.'
traps:
  - '**전일효율에서 철손은 24시간, 동손은 부하 걸린 시간만** 곱한다. 이 비대칭이 핵심.'
  - '**부하율이 낮으면 철손을 줄여야** 전일효율이 오른다. 배전변압기가 아몰퍼스를 쓰는 이유.'
  - '**최대 효율은 전부하가 아니다.** 보통 3/4 부하 근처에서 최대가 되게 설계한다.'
  - '**철손은 전압의 제곱, 동손은 전류의 제곱**에 비례한다. 헷갈리면 안 된다.'
related:
  - mc.4.2
  - mc.4.9
  - mc.1.9
---

## 손실

$$
\boxed{\text{\textbf{철손}}(\text{고정손}) + \text{\textbf{동손}}(\text{가변손})}
$$

$$
\text{\textbf{기계손이 없다}} \;-\; \text{도는 게 없으니}
$$

**mc.1.9의 직류기에서 기계손만 빼면 된다.** 그래서 효율이 99%다.

| 구분 | 손실 | 비례 | 시험 |
|---|---|---|---|
| **고정손** | **철손** $P_i$ | $V^2$ | **무부하 시험** |
| **가변손** | **동손** $P_c$ | $I^2$ | **단락 시험** |

$$
\boxed{\text{철손은 \textbf{전압}의 제곱, 동손은 \textbf{전류}의 제곱}}
$$

### 철손

$$
P_i = P_h + P_e
$$

$$
P_h = \sigma_h f B_m^{1.6} \quad(\text{히스테리시스}), \qquad P_e = \sigma_e (f B_m t)^2 \quad(\text{와전류})
$$

**em.6.7의 그것**이다. 주파수 지수가 1과 2로 갈린다.

$$
B_m \propto \dfrac{V}{f} \;\Longrightarrow\; P_h \propto f\left(\dfrac{V}{f}\right)^{1.6} = \dfrac{V^{1.6}}{f^{0.6}}
$$

$$
P_e \propto \left(f \cdot \dfrac{V}{f}\right)^2 = V^2 \quad(\text{\textbf{주파수와 무관}})
$$

$$
\boxed{\text{\textbf{와전류손은 주파수와 무관}}\text{하다} \;-\; V \text{ 만 같으면}}
$$

**시험에 나온다.** $B_m \propto V/f$ 를 넣으면 $f$ 가 약분된다(mc.4.1).

$$
\text{전체적으로 } P_i \propto V^2 \text{ 로 본다}
$$

### 동손

$$
P_c = I_1^2 r_1 + I_2^2 r_2 = I_2^2 r_{21} \quad(\text{환산})
$$

$$
\text{\textbf{부하의 제곱}}\text{에 비례}
$$

$$
\text{부하} \dfrac{1}{m} \;\Longrightarrow\; \text{동손} \left(\dfrac{1}{m}\right)^2 P_c
$$

**반부하면 동손은 1/4**이다. 이 비선형성이 최대 효율 조건을 만든다.

### 표유부하손

$$
\text{누설자속이 \textbf{탱크・클램프}에 와전류를 만듦}
$$

보통 무시하거나 동손에 포함시킨다.

## 효율

$$
\boxed{\eta = \dfrac{\text{출력}}{\text{출력} + \text{손실}} \times 100 = \dfrac{P\cos\theta}{P\cos\theta + P_i + P_c} \times 100}
$$

**규약효율**이다(mc.1.9). 손실을 재서 계산한다.

$$
\text{변압기는 \textbf{발전기와 같은} 정의} \;-\; \text{출력 기준}
$$

### 1/m 부하일 때

$$
\eta = \dfrac{\frac{1}{m}P\cos\theta}{\frac{1}{m}P\cos\theta + P_i + \left(\frac{1}{m}\right)^2 P_c} \times 100
$$

$$
\textbf{철손엔 } \text{ 1/m } \text{ 이 안 붙고} \text{, } \text{ 동손엔 } \text{ (1/m)} ^2 \text{ 이 붙는다}
$$

**이 비대칭이 전부**다. 철손은 부하와 무관하니 그대로 있고, 동손만 제곱으로 준다.

## 최대 효율 조건

$$
\boxed{P_i = P_c \quad(\text{전부하 기준})}
$$

$$
\boxed{P_i = \left(\dfrac{1}{m}\right)^2 P_c \quad(1/m \text{ 부하})}
$$

$$
\dfrac{1}{m} = \sqrt{\dfrac{P_i}{P_c}}
$$

### 유도

$$
\eta = \dfrac{\frac{1}{m}P\cos\theta}{\frac{1}{m}P\cos\theta + P_i + (\frac{1}{m})^2P_c}
$$

분자·분모를 $\frac{1}{m}$ 으로 나누면

$$
\eta = \dfrac{P\cos\theta}{P\cos\theta + \dfrac{P_i}{1/m} + \dfrac{1}{m}P_c}
$$

**분모의 뒤 두 항을 최소화**하면 된다. 산술-기하 평균에서

$$
\dfrac{P_i}{1/m} + \dfrac{1}{m}P_c \geq 2\sqrt{P_i P_c}
$$

**등호는 두 항이 같을 때**다.

$$
\dfrac{P_i}{1/m} = \dfrac{1}{m}P_c \;\Longrightarrow\; P_i = \left(\dfrac{1}{m}\right)^2 P_c
$$

$$
\boxed{\text{\textbf{고정손 = 가변손}}}
$$

**mc.1.9·mc.2.9와 완전히 같은 조건**이다. 손실이 이 구조면 늘 그렇다.

### 어느 부하에서 최대로 설계하나

$$
\text{보통 } \dfrac{1}{m} = \dfrac{3}{4} \sim \dfrac{1}{2} \text{ 에서 최대가 되게}
$$

$$
\text{\textbf{전부하가 아니다}}
$$

**실제 부하가 정격보다 낮게 운전되기 때문**이다. 평균 부하율이 50~75%인 곳에서 최대
효율이 나야 이득이다.

$$
\dfrac{1}{m} = \dfrac{3}{4} \;\Longrightarrow\; P_i = \dfrac{9}{16}P_c \;\Longrightarrow\; P_c \approx 1.8 P_i
$$

$$
\text{\textbf{동손이 철손보다 크게} 설계된다}
$$

## 전일효율

$$
\boxed{\eta_d = \dfrac{\sum(\text{출력} \times h)}{\sum(\text{출력} \times h) + \mathbf{24}P_i + \sum(P_c \times h)} \times 100}
$$

$$
\text{\textbf{철손에만 24를 곱한다}}
$$

### 왜 비대칭인가

$$
\text{\textbf{철손}: 전압이 걸려 있으면 \textbf{항상}} \;\Longrightarrow\; \textbf{24}\text{시간}
$$
$$
\text{\textbf{동손}: 부하가 있을 때만} \;\Longrightarrow\; \text{\textbf{부하 걸린 시간}}\text{만}
$$

**배전변압기는 24시간 걸려 있는데 부하는 낮에만** 있다. 밤새 철손만 나간다.

$$
\text{\textbf{이 비대칭이 전일효율의 전부}}
$$

### 예

$100\ \mathrm{kVA}$ 변압기, $P_i = 1\ \mathrm{kW}$, 전부하 $P_c = 2\ \mathrm{kW}$.
하루 중 전부하 8시간, 반부하 8시간, 무부하 8시간이라면

$$
\text{출력} = 100 \times 8 + 50 \times 8 = 1200\ \mathrm{kWh} \quad(\cos\theta = 1)
$$

$$
\text{철손} = 1 \times \mathbf{24} = 24\ \mathrm{kWh}
$$

$$
\text{동손} = 2 \times 8 + \left(\dfrac{1}{2}\right)^2 \times 2 \times 8 = 16 + 4 = 20\ \mathrm{kWh}
$$

$$
\eta_d = \dfrac{1200}{1200 + 24 + 20} \times 100 = \dfrac{1200}{1244} \times 100 \approx 96.5\%
$$

$$
\text{\textbf{철손 24 > 동손 20}} \;-\; \text{무부하 시간이 길면 철손이 이긴다}
$$

### 전일효율 최대 조건

$$
\boxed{24 P_i = \sum(P_c \times h)}
$$

**하루치 철손 = 하루치 동손**이다. 같은 논리다.

$$
\text{부하율이 \textbf{낮을수록}} \;\Longrightarrow\; \text{\textbf{철손을 줄여야} 전일효율이 오른다}
$$

$$
\boxed{\text{\textbf{아몰퍼스 변압기}}\text{가 배전용인 이유}(\text{mc.4.7})}
$$

**철손이 1/3**이면 밤새 나가는 손실이 1/3이 된다. 부하율이 낮은 배전변압기에서
연간 절감이 크다.

$$
\text{\textbf{부하율이 낮다}} \;\Longrightarrow\; \text{\textbf{철손이 지배}} \;\Longrightarrow\; \text{철손을 줄여라}
$$
$$
\text{\textbf{부하율이 높다}} \;\Longrightarrow\; \text{\textbf{동손이 지배}} \;\Longrightarrow\; \text{동손을 줄여라}
$$

**설계가 용도를 따른다.** 이게 전일효율이라는 개념이 존재하는 이유다.

## 온도상승

$$
\text{\textbf{유입변압기는 두 온도}를 본다}
$$

| 온도 | 한도 (A종) |
|---|---|
| **권선 온도상승** | $55\ \mathrm{K}$ (저항법) |
| **유온 상승** | $50\ \mathrm{K}$ (온도계법) |

$$
\text{\textbf{기름이 권선보다 시원하다}} \;-\; \text{열이 권선에서 기름으로 가니}
$$

### 측정

| 방법 | 무엇 |
|---|---|
| **저항법** | **권선** — 정확 (mc.1.10) |
| **온도계법** | **기름** — 상부 유온 |

$$
\text{권선은 \textbf{저항법}, 기름은 \textbf{온도계}}
$$

**권선 속은 온도계를 못 넣는다.** 그래서 저항 변화로 잰다(em.4.4의 온도계수).

$$
\text{\textbf{핫스팟}}(\text{최고온점})\text{이 실제 수명을 정한다}
$$

평균 온도가 괜찮아도 어딘가 뜨거운 점이 있으면 거기서 절연이 먼저 죽는다.

$$
10°\mathrm{C} \text{ 마다 \textbf{수명 절반}}(\text{아레니우스}, \text{mc.1.9})
$$

## 정격

$$
\boxed{\text{정격은 } \mathrm{kVA}, \; \text{정격을 정하는 건 \textbf{온도}}}
$$

**mc.4.7에서 다룬 그대로**다.

$$
\text{냉각} \uparrow \;\Longrightarrow\; \text{정격} \uparrow \;-\; \text{ONAN } 30\ \mathrm{MVA} \to \text{ONAF } 40\ \mathrm{MVA}
$$

### 과부하 운전

$$
\text{\textbf{단시간이면 정격을 넘겨도} 된다}
$$

$$
\text{열에는 \textbf{시간 상수}가 있다} \;-\; \text{온도가 오르는 데 몇 시간}
$$

**변압기의 열 시간상수는 2~4시간**이다. 30분 과부하는 온도를 별로 못 올린다.

$$
\text{\textbf{피크 시간에만} 과부하} \;\Longrightarrow\; \text{용량을 작게 잡아 \textbf{경제적}}
$$

**다만 수명을 갉아먹는다.** 과부하 운전은 절연 수명을 앞당긴다.

## 정리 — 세 기계 나란히

| | **변압기** | **직류기**(mc.1.9) | **동기기**(mc.2.9) |
|---|---|---|---|
| 고정손 | **철손** | 철손 + **기계손** | 철손 + 기계손 + **여자손** |
| 가변손 | 동손 | 동손 | 동손 |
| **최대 효율** | **철손 = 동손** | **고정손 = 가변손** | **고정손 = 가변손** |
| 효율 | **99%** | 90~95% | 97~98% |
| 정격 | **kVA** | kW | **kVA** |

$$
\boxed{\text{도는 게 없으면 \textbf{기계손이 없고}, 그래서 \textbf{효율이 가장 높다}}}
$$

$$
\boxed{\eta_d \text{ 에서 철손은 } \times 24, \text{ 동손은 } \times \text{부하 시간}}
$$
