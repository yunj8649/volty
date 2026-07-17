---
id: ct.1.1
title: 전기회로의 기초
status: reviewed
summary: 회로이론은 맥스웰 방정식을 집중정수로 근사한 것이다. 그 근사가 언제 깨지는지 아는 게 중요하다.
covers:
  - ct.1.1.1
  - ct.1.1.2
  - ct.1.1.3
formulas:
  - label: 전류와 전압의 정의
    tex: i = \dfrac{dq}{dt}\ \mathrm{[A]}, \qquad v = \dfrac{dw}{dq}\ \mathrm{[V]}
    note: 전류는 **전하의 흐름**, 전압은 **전하당 에너지**.
  - label: 전력
    tex: p = vi = \dfrac{dw}{dq}\cdot\dfrac{dq}{dt} = \dfrac{dw}{dt}\ \mathrm{[W]}
    note: 약분하면 **에너지의 시간 변화**. 정의가 이어진다.
  - label: 수동부호규약
    tex: \text{전류가 \textbf{+ 단자로 들어가면}} \;\Longrightarrow\; p > 0 \;(\text{\textbf{소비}})
    note: 부호가 헷갈리면 이 규약으로 돌아온다.
  - label: 세 소자
    tex: v_R = Ri, \qquad v_L = L\dfrac{di}{dt}, \qquad i_C = C\dfrac{dv}{dt}
    note: '**R은 소비, L·C는 저장**. 미분이 어디 붙느냐가 전부.'
traps:
  - '**수동부호규약**: 전류가 + 단자로 들어가면 소비, 나오면 공급이다. 부호 실수의 근원.'
  - '**L은 전류가, C는 전압이 급변 못 한다.** 과도현상(ct.1.11)의 초기조건이 여기서 나온다.'
  - '**이상 전압원은 단락 금지, 이상 전류원은 개방 금지**. mc.4.10의 PT·CT와 같은 이야기.'
  - 회로이론은 **집중정수 근사**다. 파장이 회로 크기와 비슷해지면 깨진다(ct.1.8).
related:
  - ct.1.2
  - ct.1.11
  - em.4.3
---

## 회로이론이란

$$
\boxed{\text{\textbf{맥스웰 방정식}}\text{을 \textbf{집중정수}}\text{로 근사한 것}}
$$

$$
\text{전자기학}(\text{em})\text{은 \textbf{공간}}\text{을 다루고} \;\Longrightarrow\; \text{회로이론은 \textbf{점과 선}}\text{으로}
$$

$$
\text{\textbf{저항이 한 점에 몰려 있다}}\text{고 친다} \;-\; \text{실제로는 도선 전체에 퍼져 있는데}
$$

### 언제 성립하나

$$
\boxed{\text{회로의 크기} \lll \text{\textbf{파장}}}
$$

$$
\lambda = \dfrac{c}{f} \;-\; 60\ \mathrm{Hz} \;\Longrightarrow\; \lambda = 5000\ \mathrm{km}
$$

**$60\ \mathrm{Hz}$ 의 파장이 $5000\ \mathrm{km}$** 다. 웬만한 회로는 그보다 훨씬
작으니 집중정수가 통한다.

$$
\text{\textbf{그런데 송전선은}} \;-\; \text{수백 km} \;\Longrightarrow\; \text{\textbf{무시 못 한다}}
$$

$$
\boxed{\text{\textbf{분포정수회로}}(\text{ct.1.8})\text{가 필요해지는 지점}}
$$

$$
\text{\textbf{고주파}}\text{도 마찬가지} \;-\; f \uparrow \;\Longrightarrow\; \lambda \downarrow \;\Longrightarrow\; \text{회로가 상대적으로 커짐}
$$

**pw.2.3의 장거리 송전선**이 분포정수로 다뤄지는 이유가 이것이다. 근사가 깨진다.

$$
\text{\textbf{근사의 한계를 아는 게 이론을 아는 것}}
$$

## 전기회로의 기본 개념

### 전류

$$
\boxed{i = \dfrac{dq}{dt}\ \mathrm{[A]}}
$$

$$
\text{\textbf{전하가 흐르는 비율}}
$$

$$
q = \int i \, dt \;-\; \text{거꾸로 적분하면 전하량}
$$

$$
1\ \mathrm{A} = 1\ \mathrm{C/s}
$$

**em.4.3에서 본 그것**이다. 전자기학은 전하의 운동으로, 회로이론은 단자의 전류로
본다.

### 전압

$$
\boxed{v = \dfrac{dw}{dq}\ \mathrm{[V]}}
$$

$$
\text{\textbf{전하 하나를 옮기는 데 드는 에너지}}
$$

$$
1\ \mathrm{V} = 1\ \mathrm{J/C}
$$

$$
\text{\textbf{전위차}}\text{다} \;-\; \text{두 점 사이의 값}
$$

**"어느 점의 전압"은 기준이 있어야** 의미가 있다. 보통 접지를 0으로 잡는다.

### 전력 — 정의가 이어진다

$$
p = vi = \dfrac{dw}{dq} \cdot \dfrac{dq}{dt} = \boxed{\dfrac{dw}{dt}\ \mathrm{[W]}}
$$

$$
\text{\textbf{$dq$ 가 약분된다}} \;\Longrightarrow\; \text{\textbf{에너지의 시간 변화율}}
$$

$$
\text{\textbf{정의가 서로 맞물려 있다}} \;-\; \text{우연이 아니라 그렇게 정의했으니}
$$

$$
w = \int p \, dt \;-\; \text{에너지}
$$

## 전압과 전류의 기준방향

$$
\boxed{\text{\textbf{수동부호규약}}(\text{passive sign convention})}
$$

$$
\text{\textbf{전류가 + 단자로 들어가면}} \;\Longrightarrow\; p = vi > 0 \;\Longrightarrow\; \text{\textbf{소비}}
$$

$$
\text{\textbf{전류가 + 단자에서 나오면}} \;\Longrightarrow\; p < 0 \;\Longrightarrow\; \text{\textbf{공급}}
$$

### 왜 규약이 필요한가

$$
\text{\textbf{전류의 방향과 전압의 극성을 미리 정해 놓지 않으면}} \;\Longrightarrow\; \text{부호가 뒤죽박죽}
$$

$$
\text{\textbf{일단 정하고 풀면}} \;\Longrightarrow\; \text{답이 음수면 \textbf{반대 방향}}\text{이라는 뜻}
$$

$$
\boxed{\text{\textbf{방향을 틀리게 잡아도 된다}} \;-\; \text{부호가 알려준다}}
$$

**이게 회로 해석의 자유**다. 미리 방향을 알 필요가 없다.

$$
\text{\textbf{다만 일관되게}} \;-\; \text{한 소자에 두 규약을 섞으면 틀린다}
$$

### 전력 수지

$$
\sum p = 0 \;-\; \text{\textbf{공급 = 소비}}
$$

$$
\text{\textbf{텔레겐의 정리}} \;-\; \text{회로 전체의 전력 합은 0}
$$

$$
\text{\textbf{에너지 보존}}\text{의 회로 버전} \;-\; \text{검산에 쓴다}
$$

## 세 소자

$$
\boxed{v_R = Ri \qquad v_L = L\dfrac{di}{dt} \qquad i_C = C\dfrac{dv}{dt}}
$$

| 소자 | 관계 | 에너지 |
|---|---|---|
| **R** | $v = Ri$ | **소비** ($p = i^2R$) |
| **L** | $v = L\frac{di}{dt}$ | **저장** ($W = \frac{1}{2}LI^2$) |
| **C** | $i = C\frac{dv}{dt}$ | **저장** ($W = \frac{1}{2}CV^2$) |

$$
\text{\textbf{R만 소비하고 L・C는 저장}}\text{한다}
$$

$$
\text{\textbf{저장한 건 돌려준다}} \;\Longrightarrow\; \text{\textbf{무효전력}}(\text{ct.1.3})
$$

**pw.2.6의 무효전력**이 여기서 나온다. L과 C가 에너지를 주고받기만 하는 게 무효전력이다.

### 미분이 어디 붙느냐

$$
\text{\textbf{L: 전압에 미분}} \;\Longrightarrow\; \text{\textbf{전류가 급변 못 한다}}
$$

$$
\text{전류가 급변하면} \; \dfrac{di}{dt} \to \infty \;\Longrightarrow\; v_L \to \infty \;-\; \text{\textbf{불가능}}
$$

$$
\text{\textbf{C: 전류에 미분}} \;\Longrightarrow\; \text{\textbf{전압이 급변 못 한다}}
$$

$$
\boxed{\text{\textbf{L은 전류를, C는 전압을 붙잡는다}}}
$$

$$
i_L(0^+) = i_L(0^-), \qquad v_C(0^+) = v_C(0^-)
$$

$$
\text{\textbf{ct.1.11 과도현상의 초기조건}}\text{이 전부 여기서}
$$

**이 한 줄이 회로이론의 절반**이다.

| 어디서 | 무엇 |
|---|---|
| **mc.3.1의 환류 다이오드** | $L$ 이 전류를 붙잡아 서지 |
| **mc.3.2의 평활 회로** | $C$ 는 전압, $L$ 은 전류를 매끄럽게 |
| **mc.3.3의 승압 초퍼** | $L$ 이 전류를 유지하려 전압을 밀어올림 |
| **mc.7.5의 전류 재단** | $L\frac{di}{dt}$ 로 고전압 |

$$
\text{\textbf{전기기기 전체에서 되풀이된} 그 성질}
$$

## 전원

### 이상 전원

| 전원 | 성질 | 금기 |
|---|---|---|
| **이상 전압원** | **전압이 고정** (전류는 부하가 정함) | **단락 금지** |
| **이상 전류원** | **전류가 고정** (전압은 부하가 정함) | **개방 금지** |

$$
\boxed{\text{\textbf{전압원은 단락, 전류원은 개방이 위험}}}
$$

$$
\text{\textbf{mc.4.10의 PT ・ CT}}\text{와 정확히 같은 이야기}
$$

$$
\text{PT} \approx \text{전압원} \;\Longrightarrow\; \text{\textbf{단락 금지}} \qquad \text{CT} \approx \text{전류원} \;\Longrightarrow\; \text{\textbf{개방 금지}}
$$

**회로이론의 상식이 실물 기기의 안전수칙**이 된다.

### 실제 전원

$$
\text{\textbf{이상 전원은 없다}} \;-\; \text{\textbf{내부저항}}\text{이 있다}
$$

| 등가 | |
|---|---|
| **테브난 등가** | 전압원 + **직렬** 저항 |
| **노턴 등가** | 전류원 + **병렬** 저항 |

$$
\boxed{V_{th} = I_N R, \qquad R_{th} = R_N}
$$

$$
\text{\textbf{둘은 서로 변환된다}} \;-\; \text{같은 회로의 다른 표현}
$$

$$
\text{\textbf{내부저항이 작으면 전압원답고, 크면 전류원답다}}
$$

$$
R_{int} \to 0 \;\Longrightarrow\; \text{\textbf{이상 전압원}} \qquad R_{int} \to \infty \;\Longrightarrow\; \text{\textbf{이상 전류원}}
$$

### 종속전원

$$
\text{\textbf{다른 곳의 전압・전류에 따라} 값이 변하는 전원}
$$

| 종류 | |
|---|---|
| **VCVS** | 전압 제어 전압원 |
| **VCCS** | 전압 제어 전류원 |
| **CCVS** | 전류 제어 전압원 |
| **CCCS** | 전류 제어 전류원 |

$$
\text{\textbf{트랜지스터 ・ 연산증폭기}}\text{를 회로로 모형화할 때}
$$

$$
\text{\textbf{중첩의 정리를 쓸 때 종속전원은 죽이면 안 된다}} \;-\; \text{시험 함정}(\text{ct.1.2})
$$

## 정리

$$
\boxed{i = \dfrac{dq}{dt}, \quad v = \dfrac{dw}{dq}, \quad p = vi = \dfrac{dw}{dt}}
$$

$$
\boxed{v_R = Ri, \quad v_L = L\dfrac{di}{dt}, \quad i_C = C\dfrac{dv}{dt}}
$$

| 기억할 것 | |
|---|---|
| **수동부호규약** | + 단자로 들어가면 **소비** |
| **L은 전류, C는 전압**을 붙잡는다 | 과도현상의 초기조건 |
| **전압원은 단락, 전류원은 개방** 금지 | PT·CT의 안전수칙 |
| **집중정수 근사** | 파장보다 작아야 성립 |

$$
\text{\textbf{회로이론은 근사다}} \;-\; \text{그 근사가 깨지는 곳이 ct.1.8}
$$
