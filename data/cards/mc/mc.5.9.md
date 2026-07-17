---
id: mc.5.9
title: 원선도
status: reviewed
summary: 1차 전류의 궤적이 원이다. 그 원 하나에 전류·역률·출력·토크·슬립·효율이 다 들어 있다.
covers:
  - mc.5.9.1
  - mc.5.9.2
  - mc.5.9.3
  - mc.5.9.4
formulas:
  - label: 원선도의 근거
    tex: I_1 = I_0 + \dfrac{V_1}{\sqrt{\left(r_1 + \frac{r_2'}{s}\right)^2 + x^2}} \;\Longrightarrow\; \text{\textbf{원}}
    note: 슬립을 0→1 로 바꾸면 전류 끝점이 **원을 그린다**.
  - label: 필요한 시험
    tex: \text{\textbf{무부하 시험} + \textbf{구속 시험} + \textbf{저항 측정}}
    note: '**"무구저"**. 원선도 문제의 단골.'
  - label: 원선도에서 읽는 것
    tex: \text{1차입력} \cdot \text{2차입력} \cdot \text{출력} \cdot \text{토크} \cdot \text{슬립} \cdot \text{효율} \cdot \text{역률}
    note: 세로 길이가 전력, 각도가 역률.
  - label: 못 읽는 것
    tex: \text{\textbf{기계손} ・ \textbf{속도}}
    note: 원선도의 한계. 기계손은 별도로 알아야 한다.
traps:
  - '**원선도로 기계손과 속도는 못 구한다.** 이게 시험에 나온다.'
  - '**원선도를 그리는 시험은 무부하·구속·저항 측정** 셋이다. "무구저".'
  - '**원의 지름은 V₁/x** 다. 누설 리액턴스가 작을수록 원이 크다.'
  - 원선도의 **세로 길이가 곧 전력**이다. $P = V_1 I_1 \cos\theta$ 에서 $V_1$ 이 상수니까.
related:
  - mc.5.8
  - mc.5.2
  - mc.5.1
---

## 원선도란

$$
\boxed{\text{\textbf{1차 전류의 궤적}}\text{이 \textbf{원}을 그린다}}
$$

$$
\text{\textbf{하이랜드 원선도}}(\text{Heyland})
$$

$$
\text{슬립을 } 0 \to 1 \text{ 로 바꾸면} \;\Longrightarrow\; I_1 \text{ 의 \textbf{끝점}이 원 위를 움직인다}
$$

$$
\text{\textbf{그 원 하나에 모든 특성}}\text{이 들어 있다}
$$

## 1차전류의 궤적

$$
I_1 = I_0 + I_2'
$$

$$
I_2' = \dfrac{V_1}{\sqrt{\left(r_1 + \frac{r_2'}{s}\right)^2 + (x_1 + x_2')^2}}
$$

### 왜 원인가

$$
\textbf{s 를 바꾸면 } \dfrac{r_2'}{s} \text{ 만 변한다} \;-\; \text{리액턴스는 고정}
$$

$$
\text{\textbf{저항만 변하고 리액턴스가 일정한 회로}}\text{의 전류 궤적은 \textbf{반원}}
$$

**회로이론의 기본 결과**다. $R$ 을 0에서 $\infty$ 로 바꾸면 전류 페이저의 끝이 반원을
그린다.

$$
s = 1 \;\Longrightarrow\; \dfrac{r_2'}{s} = r_2' \;(\text{최소}) \;\Longrightarrow\; \text{전류 \textbf{최대}} \;-\; \text{\textbf{구속점}}
$$

$$
s \to 0 \;\Longrightarrow\; \dfrac{r_2'}{s} \to \infty \;\Longrightarrow\; I_2' \to 0 \;\Longrightarrow\; I_1 \to I_0 \;-\; \text{\textbf{무부하점}}
$$

$$
\boxed{\text{\textbf{두 점}이 원의 \textbf{양 끝}}}
$$

$$
\text{\textbf{무부하 시험} → 시작점} \qquad / \qquad \text{\textbf{구속 시험} → 끝점}
$$

**mc.5.8의 두 시험이 원의 두 점을 준다.** 그래서 원선도를 그릴 수 있다.

### 원의 지름

$$
\boxed{\text{지름} = \dfrac{V_1}{x_1 + x_2'}}
$$

$$
\text{\textbf{누설 리액턴스가 작을수록 원이 크다}}
$$

$$
\text{원이 크다} \;\Longrightarrow\; \text{최대토크・최대출력이 크다}
$$

**mc.5.5의 특수 농형**이 누설 리액턴스가 커서 최대토크가 작았던 이유가 여기 보인다.
원이 작아진다.

$$
T_{max} = \dfrac{E_2^2}{2(x_1+x_2)} \;-\; \text{\textbf{지름과 같은 구조}}
$$

## 원선도 그리기

$$
\text{\textbf{세 시험}}\text{이 필요하다}(\text{mc.5.8})
$$

| 시험 | 주는 것 |
|---|---|
| **무부하 시험** | $I_0$ 의 **크기와 위상** → 원의 시작점 |
| **구속 시험** | $I_s$ 의 **크기와 위상** → 원의 끝점 |
| **저항 측정** | $r_1$ → **출력선과 토크선을 가르는 점** |

$$
\boxed{\text{\textbf{"무구저"}}}
$$

**시험 단골**이다.

### 왜 저항 측정이 필요한가

$$
\text{구속 시험의 전력} = I_s^2(r_1 + r_2')
$$

$$
\text{\textbf{1차 동손과 2차 동손이 섞여 있다}}
$$

$$
r_1 \text{ 을 알아야} \;\Longrightarrow\; \text{둘을 나눌 수 있고} \;\Longrightarrow\; \text{\textbf{출력선과 토크선}}\text{을 구분}
$$

$$
\text{\textbf{토크선}}\text{과 \textbf{출력선}}\text{의 차이가 곧 \textbf{2차 동손}}
$$

**저항 측정 없이는 그 선을 못 긋는다.** 그래서 세 시험이 다 필요하다.

## 1차입력

$$
P_1 = V_1 I_1 \cos\theta_1
$$

$$
V_1 \text{ 이 \textbf{상수}} \;\Longrightarrow\; P_1 \propto I_1\cos\theta_1 = \text{\textbf{전류의 세로 성분}}
$$

$$
\boxed{\text{\textbf{세로 길이가 곧 전력}}}
$$

**이게 원선도의 마법**이다. 전압을 가로축 기준으로 잡으면, **전류 페이저의 수직
성분이 유효분**이고 그게 전력에 비례한다.

$$
\text{\textbf{자로 재면 전력이 나온다}}
$$

$$
\text{\textbf{가로 성분}} = I_1\sin\theta_1 \;\Longrightarrow\; \text{\textbf{무효전력}}
$$

## 토크의 출력

$$
\text{원 위의 한 점에서 \textbf{아래로 수선}}\text{을 내리면 \textbf{여러 선}과 만난다}
$$

| 선 | 이름 |
|---|---|
| 가장 위 | **원주** (운전점) |
| | **출력선** |
| | **토크선** |
| | **1차 입력선** (가로축) |

$$
\text{\textbf{선 사이의 간격}}\text{이 각각의 전력}
$$

| 구간 | 무엇 |
|---|---|
| 운전점 ~ **출력선** | **기계적 출력** $P_o$ |
| 출력선 ~ **토크선** | **2차 동손** $P_{c2}$ |
| 토크선 ~ 가로축 | **1차 손실**(동손 + 철손) |

$$
\boxed{\text{운전점 ~ 토크선} = P_o + P_{c2} = \text{\textbf{2차 입력}} P_2 = \text{\textbf{동기와트}}}
$$

$$
\text{\textbf{토크선까지의 거리가 곧 토크}} \;-\; \text{동기와트니까}(\text{mc.5.2})
$$

**mc.5.2에서 $T \propto P_2$** 라고 한 게 원선도에서는 **길이**가 된다.

$$
\text{\textbf{그래서 "토크선"}}
$$

## 슬립 및 효율

$$
\boxed{s = \dfrac{P_{c2}}{P_2} = \dfrac{\text{출력선 ~ 토크선}}{\text{운전점 ~ 토크선}}}
$$

**mc.5.2의 $P_{c2} = sP_2$** 가 그대로 **길이의 비**가 된다.

$$
\boxed{\eta = \dfrac{P_o}{P_1} = \dfrac{\text{운전점 ~ 출력선}}{\text{운전점 ~ 가로축}}}
$$

$$
\boxed{\eta_2 = 1 - s = \dfrac{P_o}{P_2} = \dfrac{\text{운전점 ~ 출력선}}{\text{운전점 ~ 토크선}}}
$$

$$
\text{\textbf{모든 비율이 길이의 비}}
$$

$$
\text{\textbf{역률}} = \cos\theta_1 \;-\; \text{원점에서 운전점까지의 \textbf{각도}}
$$

## 원선도로 못 구하는 것

$$
\boxed{\text{\textbf{기계손}}\text{과 \textbf{속도}}}
$$

$$
\text{\textbf{시험에 나온다}}
$$

### 왜 못 구하나

$$
\text{\textbf{기계손}}\text{은 무부하 입력에 \textbf{철손과 섞여} 들어간다}(\text{mc.5.8})
$$

$$
\text{원선도는 그 둘을 \textbf{합쳐서} 처리} \;\Longrightarrow\; \text{\textbf{따로 못 뽑는다}}
$$

$$
\text{\textbf{속도}}\text{는 슬립에서 계산해야} \;-\; N = (1-s)N_s
$$

$$
\text{원선도는 \textbf{전류의 궤적}}\text{이라 속도 축이 없다}
$$

**슬립은 읽을 수 있지만 속도는 계산해야** 한다. 엄밀히 말하면 "원선도에서 직접 읽을
수 없다"는 뜻이다.

$$
\text{\textbf{읽을 수 있는 것}: 전류 ・ 역률 ・ 1차입력 ・ 2차입력 ・ 출력 ・ 토크 ・ 슬립 ・ 효율}
$$
$$
\text{\textbf{못 읽는 것}: \textbf{기계손} ・ \textbf{속도}}
$$

## 원선도의 값어치

$$
\text{\textbf{부하를 안 걸고} 모든 특성을 안다}
$$

$$
\text{\textbf{세 시험}}(\text{무부하 ・ 구속 ・ 저항})\text{만 하면} \;\Longrightarrow\; \text{\textbf{전 부하 범위}}\text{의 특성}
$$

**mc.1.10의 반환부하법과 같은 사상**이다. 큰 기계에 실제 부하를 안 걸고 특성을 알아낸다.

$$
\text{\textbf{손실만 재서 효율을 계산}}\text{하는 규약효율}(\text{mc.1.9})\text{의 연장}
$$

$$
\text{\textbf{전기기기 시험의 일관된 철학}} \;-\; \text{부하를 걸지 않고 알아낸다}
$$

**요즘은 컴퓨터로 계산**하니 원선도를 손으로 그릴 일이 없다. 그래도 **시험에는 나온다**.

## 정리

$$
\boxed{\text{\textbf{무구저}} \;-\; \text{무부하 ・ 구속 ・ 저항 측정}}
$$

$$
\boxed{\text{지름} = \dfrac{V_1}{x_1 + x_2'}}
$$

| 읽는 것 | 어디서 |
|---|---|
| **1차 입력** | 운전점 ~ **가로축** |
| **2차 입력**(= 토크) | 운전점 ~ **토크선** |
| **출력** | 운전점 ~ **출력선** |
| **2차 동손** | 출력선 ~ 토크선 |
| **슬립** | $\frac{P_{c2}}{P_2}$ = 길이의 비 |
| **효율** | $\frac{P_o}{P_1}$ = 길이의 비 |
| **역률** | **각도** |

$$
\boxed{\text{\textbf{못 읽는 것: 기계손 ・ 속도}}}
$$

$$
\text{\textbf{세로 길이 = 전력}} \;-\; V_1 \text{ 이 상수라서 가능한 마법}
$$
