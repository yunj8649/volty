---
id: mc.7.2
title: 제어기기의 구조 및 원리
status: reviewed
summary: 서보는 관성을 줄이려 가늘고 길게, 스테핑은 돌기 수로 스텝각을 정한다.
covers:
  - mc.7.2.1
  - mc.7.2.2
formulas:
  - label: 스텝각
    tex: \theta_s = \dfrac{360°}{\text{상수} \times \text{회전자 이수}}
    note: 돌기가 많을수록 세밀하다. HB형은 $1.8°$(200스텝).
  - label: 스테핑모터 속도
    tex: N = \dfrac{\theta_s \times f_p}{360°} \times 60 = \dfrac{\theta_s f_p}{6}\ \mathrm{[rpm]}
    note: '$f_p$ 는 **펄스 주파수**. 펄스가 곧 속도.'
  - label: 서보의 각가속도
    tex: \alpha = \dfrac{T}{J} \;-\; \text{\textbf{토크는 크게, 관성은 작게}}
    note: $J \propto mr^2$ 이라 **지름을 줄이면 제곱으로** 준다.
traps:
  - '**스텝각은 상수 × 회전자 이수**로 정해진다. 돌기가 많을수록 세밀.'
  - '**스테핑모터의 속도는 펄스 주파수**가 정한다. 전압이 아니다.'
  - '**서보모터는 가늘고 길다.** 관성을 줄이려고. 일반 전동기와 반대 설계.'
  - '**BLDC는 정류자를 홀센서 + 인버터로** 대체한 것이다. 원리는 직류기와 같다.'
related:
  - mc.7.1
  - mc.2.10
  - mc.1.6
---

## 구조

### 서보모터

$$
\boxed{\text{\textbf{가늘고 길다}} \;-\; \text{관성을 줄이려고}}
$$

$$
\alpha = \dfrac{T}{J} \;-\; \text{\textbf{각가속도}}
$$

$$
J \propto m r^2 \;\Longrightarrow\; \text{\textbf{지름을 반으로} 하면 관성이 } \dfrac{1}{4}
$$

$$
\text{\textbf{같은 토크에 4배 빠른 응답}}
$$

$$
\text{\textbf{길이로 출력을 벌충}}\text{한다} \;-\; \text{지름을 줄인 만큼}
$$

**mc.2.1의 터빈발전기와 모양이 같다.** 거기는 원심력 때문이었고 여기는 관성 때문이다.

$$
\text{\textbf{다른 이유, 같은 결론}} \;-\; \text{빨리 도는 것과 빨리 반응하는 것}
$$

### 직류 서보

| 부분 | |
|---|---|
| **전기자** | 회전자 + **정류자** |
| **계자** | **영구자석** (대부분) |
| **브러시** | |

$$
\text{\textbf{계자를 영구자석}}\text{으로} \;\Longrightarrow\; \phi \text{ 가 \textbf{완전히 일정}}
$$

$$
T = K\phi I_a \;\Longrightarrow\; \boxed{T \propto I_a} \;-\; \text{\textbf{전류가 곧 토크}}
$$

$$
\text{\textbf{제어가 쉽다}} \;-\; \text{전류만 조절하면 토크가 정해진다}
$$

**mc.1.6의 직류전동기**가 서보에 맞는 이유다. 토크와 전류가 정비례한다.

| 특수 구조 | |
|---|---|
| **코어리스**(coreless) | 철심을 없애 관성 최소 |
| **평판형**(pancake) | 축 방향으로 납작 |
| **무철심 전기자** | |

$$
\text{\textbf{철심을 없애면}} \;\Longrightarrow\; \text{관성 최소 ・ 철손 없음} \;\Longrightarrow\; \text{\textbf{초고속 응답}}
$$

$$
\text{\textbf{대신 방열이 나쁘고 비싸다}}
$$

### 교류 서보 (BLDC)

$$
\boxed{\text{\textbf{정류자를 홀센서 + 인버터}}\text{로 대체}}
$$

| 부분 | |
|---|---|
| **회전자** | **영구자석** |
| **고정자** | 3상 권선 |
| **홀센서** / 엔코더 | **회전자 위치 검출** |
| **인버터** | 전류 방향 전환 |

$$
\text{\textbf{구조가 뒤집혔다}} \;-\; \text{자석이 돌고 권선이 고정}
$$

$$
\text{\textbf{mc.2.1의 회전계자형}}\text{과 같은 구도}
$$

### BLDC가 왜 직류기와 같은가

$$
\text{\textbf{정류자가 하던 일}}: \text{회전자 위치에 맞춰 \textbf{전류 방향을 바꾼다}}(\text{mc.1.6})
$$

$$
\text{\textbf{BLDC}}: \text{홀센서가 위치를 읽고} \to \text{인버터가 \textbf{전류 방향을 바꾼다}}
$$

$$
\boxed{\text{\textbf{똑같은 일을 기계 대신 전자로}}}
$$

$$
\text{\textbf{정류자 = 기계식 위치 센서 + 기계식 스위치}}
$$

**이렇게 보면 정류자가 무엇이었는지 분명해진다.** 위치를 읽어서 스위칭하는 장치였다.
그걸 센서와 반도체로 나눠 구현한 게 BLDC다.

$$
\text{\textbf{그래서 Brushless "DC"}} \;-\; \text{실제로는 3상 교류가 흐르는데 이름이 DC}
$$

**직류기처럼 제어되기 때문**이다. 밖에서 보면 직류를 넣고 토크가 전류에 비례한다.

| | 정류자 | BLDC |
|---|---|---|
| **위치 검출** | **기계적 접촉** | **홀센서** |
| **스위칭** | **정류자편** | **인버터** |
| **마모** | **있다** | **없다** |
| **불꽃** | **있다** | **없다** |
| **속도 제한** | **원심력** | **없다** |

$$
\boxed{\text{\textbf{mc.1.1의 대가를 전부 지웠다}}}
$$

### 스테핑모터

$$
\boxed{\text{\textbf{돌기}}(\text{齒})\text{의 수가 스텝각을 정한다}}
$$

$$
\theta_s = \dfrac{360°}{\text{상수} \times \text{회전자 이수}}
$$

$$
\text{예: 3상, 회전자 이수 } 4 \;\Longrightarrow\; \theta_s = \dfrac{360°}{3 \times 4} = 30°
$$

$$
\text{\textbf{HB형은 } 1.8°} \;\Longrightarrow\; \dfrac{360°}{1.8°} = \mathbf{200} \text{ 스텝/회전}
$$

$$
\text{\textbf{200스텝이 표준}} \;-\; \text{프린터 ・ 3D프린터에 쓰는 그것}
$$

### 마이크로스테핑

$$
\text{\textbf{전류를 비율로 나눠} 흘리면} \;\Longrightarrow\; \text{\textbf{스텝 사이에} 세울 수 있다}
$$

$$
1.8° \to 0.1125° \;(1/16 \text{ 마이크로스텝})
$$

$$
\text{\textbf{진동과 소음이 줄고 분해능이 오른다}}
$$

**하드웨어를 안 바꾸고 제어로만** 해상도를 높인다. 인버터의 PWM(mc.3.3)과 같은 발상이다.

### 스테핑모터의 종류

| 종류 | 회전자 |
|---|---|
| **VR형** | **철심 돌기만** (자석 없음) |
| **PM형** | **영구자석** |
| **HB형** | **자석 + 돌기** — **주력** |

$$
\text{\textbf{VR형}} \;-\; \text{mc.2.10의 \textbf{반동전동기}}\text{와 같은 원리}
$$

$$
x_d > x_q \;\Longrightarrow\; \text{\textbf{릴럭턴스 토크}} \;\Longrightarrow\; \text{돌기가 자속의 길로 정렬}
$$

$$
\text{\textbf{자석이 없으니}} \;\Longrightarrow\; \text{\textbf{정지 시 유지 토크가 없다}}
$$

**전원을 끊으면 자유롭게 돈다.** PM·HB형은 자석이 있어 **전원을 끊어도 유지 토크**가
있다(디텐트 토크).

$$
\text{\textbf{HB형이 이긴 이유}} \;-\; \text{자석의 힘 + 돌기의 세밀함}
$$

## 동작원리

$$
\text{\textbf{상을 순서대로 여자}} \;\Longrightarrow\; \text{회전자가 \textbf{한 칸씩} 따라온다}
$$

$$
\text{A상 → B상 → C상 → A상} \cdots \;\Longrightarrow\; \text{\textbf{회전}}
$$

$$
\boxed{\text{\textbf{회전자계를 펄스로 한 칸씩 옮기는 것}}}
$$

$$
\text{\textbf{동기전동기의 극단}} \;-\; \text{연속 회전자계 대신 \textbf{계단식}}
$$

**mc.2.7의 동기전동기와 같은 물리**다. 자석이 자계를 따라간다. 다만 자계가 **뚝뚝
끊어져** 움직인다.

$$
\text{\textbf{그래서 탈조도 같다}}(\text{mc.7.1})
$$

### 여자 방식

| 방식 | |
|---|---|
| **1상 여자** | 한 번에 한 상 — 토크 작음 |
| **2상 여자** | 두 상 동시 — **토크 큼** |
| **1-2상 여자** | 번갈아 — **스텝각 절반** |

$$
\text{\textbf{1-2상 여자}}\text{로 \textbf{하프 스텝}} \;\Longrightarrow\; 1.8° \to 0.9°
$$

$$
\text{\textbf{배선을 안 바꾸고 제어로만} 분해능 2배}
$$

### 속도

$$
\boxed{N = \dfrac{\theta_s \times f_p}{360°} \times 60 = \dfrac{\theta_s f_p}{6}\ \mathrm{[rpm]}}
$$

$f_p$ 는 **펄스 주파수**[pps]다.

$$
\text{예: } \theta_s = 1.8°, f_p = 1000\ \mathrm{pps} \;\Longrightarrow\; N = \dfrac{1.8 \times 1000}{6} = 300\ \mathrm{rpm}
$$

$$
\boxed{\text{\textbf{펄스 주파수가 속도를 정한다}}} \;-\; \text{전압이 아니다}
$$

$$
\text{\textbf{보통 전동기와 완전히 다른 사고방식}}
$$

**mc.5.4에서 유도전동기는 $V/f$ 로 속도를 정했다.** 스테핑은 **펄스를 세는 것**만으로
속도와 위치가 다 정해진다.

$$
\text{\textbf{디지털과 궁합이 좋은 이유}}
$$

### 고속에서 토크가 급감한다

$$
\text{펄스가 빨라지면} \;\Longrightarrow\; \text{권선 \textbf{인덕턴스}}\text{가 전류를 못 따라오게 함}
$$

$$
L\dfrac{di}{dt} \;\Longrightarrow\; \text{\textbf{전류가 못 오름}} \;\Longrightarrow\; \text{\textbf{토크} } \downarrow
$$

$$
\boxed{\text{\textbf{스테핑모터의 근본 한계}}}
$$

| 대책 | |
|---|---|
| **높은 전압 + 전류 제한**(초퍼 구동) | 전류를 빨리 세운다 |
| 유니폴라 → **바이폴라** | |
| 가감속 프로파일 | |

$$
\text{\textbf{초퍼 구동}} \;-\; \text{mc.3.3의 초퍼가 여기서도}
$$

**정격보다 높은 전압으로 때려서** 전류를 빨리 세우고, 목표 전류에 닿으면 초퍼로
끊는다. 반도체 없이는 못 하던 것이다.

## 정리

| | **서보모터** | **스테핑모터** |
|---|---|---|
| **구조** | **가늘고 길게** (관성↓) | **돌기** 수로 스텝각 |
| **제어** | **폐루프** (센서 필수) | **개루프** (펄스만) |
| **속도** | 전압·전류 | **펄스 주파수** |
| **위치** | 센서로 확인 | **펄스 수를 믿는다** |
| **약점** | 비쌈 | **탈조** · 고속 토크 |

$$
\boxed{\theta_s = \dfrac{360°}{\text{상수} \times \text{이수}}, \qquad N = \dfrac{\theta_s f_p}{6}}
$$

$$
\text{\textbf{BLDC = 정류자를 홀센서 + 인버터로}} \;-\; \text{mc.1.1의 대가를 지운 결말}
$$
