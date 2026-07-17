---
id: ct.2.3
title: 상태공간해석
status: reviewed
summary: 전달함수는 입출력만 본다. 상태공간은 속까지 본다. 그래서 다입출력과 초기값을 다룬다.
covers:
  - ct.2.3.1
  - ct.2.3.2
  - ct.2.3.3
formulas:
  - label: 상태방정식
    tex: \dot{\mathbf{x}} = \mathbf{A}\mathbf{x} + \mathbf{B}u, \qquad y = \mathbf{C}\mathbf{x} + \mathbf{D}u
    note: '**1차 미분방정식의 묶음**. n차를 n개의 1차로.'
  - label: 상태천이행렬
    tex: \phi(t) = e^{\mathbf{A}t} = \mathcal{L}^{-1}\left[(s\mathbf{I} - \mathbf{A})^{-1}\right]
    note: '**초기값이 어떻게 퍼지나**. 입력이 없을 때의 답.'
  - label: 전달함수로
    tex: G(s) = \mathbf{C}(s\mathbf{I} - \mathbf{A})^{-1}\mathbf{B} + \mathbf{D}
    note: 상태공간 → 전달함수. 반대는 유일하지 않다.
  - label: 특성방정식
    tex: '|\,s\mathbf{I} - \mathbf{A}\,| = 0'
    note: '**A의 고유값이 극**. ct.2.2의 $1+GH=0$ 과 같은 것.'
traps:
  - '**A의 고유값이 곧 극**이다. 특성방정식이 $|sI - A| = 0$.'
  - '**전달함수 → 상태방정식은 유일하지 않다.** 같은 입출력을 내는 내부 구조가 여럿.'
  - '**상태변수의 수 = 에너지 저장 소자의 수**다. L과 C의 개수.'
  - '$\phi(t) = e^{At}$ 는 **행렬 지수**다. 그냥 지수가 아니다.'
related:
  - ct.1.10
  - ct.2.2
  - ct.1.11
---

## 상태변수의 의의

$$
\boxed{\text{\textbf{전달함수는 입출력만} 본다} \;-\; \text{속은 블랙박스}}
$$

$$
\text{\textbf{상태공간은 속까지} 본다}
$$

| | **전달함수** | **상태공간** |
|---|---|---|
| **보는 것** | **입출력** | **내부 상태까지** |
| **초기값** | **0으로 가정** | **다룬다** |
| **입출력 수** | **SISO** | **MIMO** |
| **비선형·시변** | 못 함 | **가능** |
| **표현** | $G(s)$ | **행렬** |

$$
\text{\textbf{ct.1.10에서 초기값을 0으로 놓은 게}} \text{ 전달함수의 한계}
$$

$$
\boxed{\text{\textbf{상태공간은 그 제약을 푼다}}}
$$

### 상태변수란

$$
\boxed{\text{\textbf{미래를 결정하는 데 필요한 최소한의 정보}}}
$$

$$
\text{\textbf{지금 상태}} + \text{\textbf{앞으로의 입력}} \;\Longrightarrow\; \text{\textbf{미래가 정해진다}}
$$

$$
\text{\textbf{과거는 필요 없다}} \;-\; \text{상태에 다 들어 있으니}
$$

$$
\text{\textbf{회로에서는}} \;\Longrightarrow\; \boxed{i_L \text{ 과 } v_C}
$$

$$
\text{\textbf{ct.1.11의 초기조건}}\text{이 그것} \;-\; \text{L의 전류와 C의 전압}
$$

$$
\boxed{\text{\textbf{상태변수의 수 = 에너지 저장 소자의 수}}}
$$

$$
\text{\textbf{L 하나, C 하나}} \;\Longrightarrow\; \text{\textbf{상태변수 2개}} \;\Longrightarrow\; \text{\textbf{2차계}}
$$

**RLC 직렬 회로가 2차인 이유**다. 저장 소자가 둘이다.

$$
\text{\textbf{R은 상태변수를 안 만든다}} \;-\; \text{저장을 안 하니}(\text{ct.1.1})
$$

$$
\text{\textbf{ct.1.1의 "R은 소비, L・C는 저장"}}\text{이 여기서 차수를 정한다}
$$

## 상태변수와 상태방정식

$$
\boxed{
\begin{aligned}
\dot{\mathbf{x}} &= \mathbf{A}\mathbf{x} + \mathbf{B}u \quad(\text{\textbf{상태방정식}}) \\
y &= \mathbf{C}\mathbf{x} + \mathbf{D}u \quad(\text{\textbf{출력방정식}})
\end{aligned}
}
$$

| 행렬 | 이름 | 크기 |
|---|---|---|
| $\mathbf{A}$ | **시스템 행렬** | $n \times n$ |
| $\mathbf{B}$ | **입력 행렬** | $n \times m$ |
| $\mathbf{C}$ | **출력 행렬** | $p \times n$ |
| $\mathbf{D}$ | **직결 행렬** | $p \times m$ |

$$
\boxed{\text{\textbf{n차 미분방정식} → \textbf{n개의 1차 미분방정식}}}
$$

$$
\text{\textbf{높은 차수를 낮은 차수 여럿으로}}
$$

### 왜 1차로 만드나

$$
\text{\textbf{1차 방정식은 풀기 쉽다}} \;-\; \dot{x} = ax \;\Longrightarrow\; x = x_0e^{at}
$$

$$
\text{\textbf{행렬로 묶으면}} \;\Longrightarrow\; \dot{\mathbf{x}} = \mathbf{A}\mathbf{x} \;\Longrightarrow\; \mathbf{x} = e^{\mathbf{A}t}\mathbf{x}_0
$$

$$
\text{\textbf{모양이 똑같다}} \;-\; \text{스칼라가 행렬이 됐을 뿐}
$$

$$
\boxed{\text{\textbf{컴퓨터가 풀기 좋다}}} \;-\; \text{행렬 연산이니}
$$

**현대 제어이론이 상태공간을 쓰는 이유**다. 수치 계산에 적합하다.

### 예 — RLC 직렬

$$
L\dfrac{di}{dt} + Ri + v_C = e, \qquad C\dfrac{dv_C}{dt} = i
$$

$$
x_1 = i, \quad x_2 = v_C \;-\; \text{\textbf{상태변수}}
$$

$$
\dot{x_1} = -\dfrac{R}{L}x_1 - \dfrac{1}{L}x_2 + \dfrac{1}{L}e
$$
$$
\dot{x_2} = \dfrac{1}{C}x_1
$$

$$
\begin{bmatrix} \dot{x_1} \\ \dot{x_2} \end{bmatrix} =
\begin{bmatrix} -\frac{R}{L} & -\frac{1}{L} \\ \frac{1}{C} & 0 \end{bmatrix}
\begin{bmatrix} x_1 \\ x_2 \end{bmatrix} +
\begin{bmatrix} \frac{1}{L} \\ 0 \end{bmatrix} e
$$

$$
\text{\textbf{2차 미분방정식이 1차 두 개}}\text{가 됐다}
$$

### 전달함수와의 관계

$$
\boxed{G(s) = \mathbf{C}(s\mathbf{I} - \mathbf{A})^{-1}\mathbf{B} + \mathbf{D}}
$$

$$
\text{\textbf{상태공간} → \textbf{전달함수}}\text{는 \textbf{유일}}
$$

$$
\text{\textbf{전달함수} → \textbf{상태공간}}\text{은 \textbf{유일하지 않다}}
$$

$$
\boxed{\text{\textbf{같은 입출력을 내는 내부 구조가 여럿}}}
$$

$$
\text{\textbf{정준형}}\text{이 여럿} \;-\; \text{제어・관측・대각・조던}
$$

$$
\text{\textbf{밖에서 같아 보여도 속은 다를 수 있다}}
$$

**이게 상태공간의 통찰**이다. 전달함수는 **보이는 것만** 나타내니, 안 보이는 부분
(제어 불가능·관측 불가능한 상태)이 숨을 수 있다.

$$
\text{\textbf{극-영점 상쇄}}\text{가 그런 경우} \;-\; \text{전달함수에서는 사라지는데 실제로는 남아 있다}
$$

$$
\text{\textbf{불안정한 극이 상쇄되면}} \;\Longrightarrow\; \text{\textbf{보이지 않게 발산}}
$$

**위험하다.** 전달함수만 보면 안정해 보이는데 실제로는 내부에서 발산한다.

## 특성방정식

$$
\boxed{|s\mathbf{I} - \mathbf{A}| = 0}
$$

$$
\text{\textbf{A의 고유값}}\text{이 곧 \textbf{극}}
$$

$$
\text{\textbf{ct.2.2의 } 1 + GH = 0}\text{ 과 같은 것}
$$

$$
G(s) = \dfrac{\mathbf{C}\,\text{adj}(s\mathbf{I}-\mathbf{A})\,\mathbf{B}}{|s\mathbf{I}-\mathbf{A}|} + \mathbf{D}
$$

$$
\textbf{분모가 } \text{ |s} \mathbf{I} \text{-} \mathbf{A} \text{|} \;\Longrightarrow\; \text{\textbf{극이 고유값}}
$$

$$
\boxed{\text{\textbf{고유값이 좌반면에 있으면 안정}}}
$$

$$
\text{\textbf{ct.2.5의 안정도}}\text{를 행렬로 판정}
$$

$$
\text{\textbf{라우스-후르비츠}}\text{를 } |s\mathbf{I}-\mathbf{A}| \text{ 에 적용하면 된다}
$$

## 상태천이행렬

$$
\boxed{\phi(t) = e^{\mathbf{A}t} = \mathcal{L}^{-1}\left[(s\mathbf{I}-\mathbf{A})^{-1}\right]}
$$

$$
\text{\textbf{입력이 없을 때}}(u=0) \;\Longrightarrow\; \mathbf{x}(t) = \phi(t)\mathbf{x}(0)
$$

$$
\boxed{\text{\textbf{초기값이 시간에 따라 어떻게 퍼지나}}}
$$

$$
\text{\textbf{천이}}(\text{transition}) \;-\; \text{상태가 어떻게 옮겨가나}
$$

### 행렬 지수

$$
e^{\mathbf{A}t} = \mathbf{I} + \mathbf{A}t + \dfrac{(\mathbf{A}t)^2}{2!} + \dfrac{(\mathbf{A}t)^3}{3!} + \cdots
$$

$$
\text{\textbf{테일러 급수를 행렬로}} \;-\; \text{그냥 지수가 아니다}
$$

$$
\text{\textbf{실제 계산은 라플라스}}\text{로} \;-\; (s\mathbf{I}-\mathbf{A})^{-1} \text{ 을 역변환}
$$

### 성질

$$
\phi(0) = \mathbf{I} \;-\; \text{처음엔 그대로}
$$

$$
\phi(t_1 + t_2) = \phi(t_1)\phi(t_2) \;-\; \text{\textbf{이어 붙일 수 있다}}
$$

$$
\phi^{-1}(t) = \phi(-t) \;-\; \text{\textbf{되돌릴 수 있다}}
$$

$$
\dfrac{d\phi}{dt} = \mathbf{A}\phi(t)
$$

$$
\text{\textbf{지수함수의 성질 그대로}} \;-\; e^{a(t_1+t_2)} = e^{at_1}e^{at_2}
$$

## 선형시스템의 과도응답

$$
\boxed{\mathbf{x}(t) = \underbrace{\phi(t)\mathbf{x}(0)}_{\text{\textbf{영입력 응답}}} + \underbrace{\int_0^t \phi(t-\tau)\mathbf{B}u(\tau)d\tau}_{\text{\textbf{영상태 응답}}}}
$$

$$
\text{\textbf{초기값 때문}} + \text{\textbf{입력 때문}}
$$

$$
\text{\textbf{중첩}}(\text{ct.1.2})\text{이 성립하니 나눠서 더한다}
$$

$$
\text{\textbf{ct.1.10에서 말한 그것}} \;-\; \text{전달함수는 \textbf{영상태 응답}}\text{만}
$$

$$
\boxed{\text{\textbf{상태공간은 둘 다} 다룬다}}
$$

### 합성곱

$$
\int_0^t \phi(t-\tau)\mathbf{B}u(\tau)d\tau \;-\; \text{\textbf{합성곱}}(\text{convolution})
$$

$$
\text{\textbf{과거의 입력이 지금까지 미치는 영향을 다 더한 것}}
$$

$$
\text{\textbf{라플라스에서는 곱셈}}\text{이 된다} \;-\; \text{그래서 } s \text{ 영역이 편하다}
$$

$$
\mathcal{L}[f * g] = F(s)G(s)
$$

$$
\boxed{\text{\textbf{시간 영역의 합성곱} = \textbf{s 영역의 곱}}}
$$

$$
\text{\textbf{ct.1.9가 왜 값어치가 있는지}}\text{가 여기서 또}
$$

## 제어성과 관측성

$$
\text{\textbf{상태공간에서만 물을 수 있는 질문}}
$$

| | 묻는 것 |
|---|---|
| **제어성** | **입력으로 모든 상태를 움직일 수 있나** |
| **관측성** | **출력으로 모든 상태를 알 수 있나** |

$$
\text{\textbf{제어성 행렬}}: [\mathbf{B} \;\; \mathbf{AB} \;\; \mathbf{A}^2\mathbf{B} \cdots] \;-\; \text{\textbf{계수가 } n \text{ 이면 제어 가능}}
$$

$$
\text{\textbf{관측성 행렬}}: [\mathbf{C} \;\; \mathbf{CA} \;\; \mathbf{CA}^2 \cdots]^T \;-\; \text{\textbf{계수가 } n \text{ 이면 관측 가능}}
$$

$$
\boxed{\text{\textbf{전달함수로는 못 묻는 질문}}}
$$

$$
\text{\textbf{극-영점 상쇄}}\text{가 일어나면 \textbf{제어 불가능이거나 관측 불가능}}
$$

$$
\text{\textbf{숨은 상태가 있다는 뜻}}
$$

**현대 제어이론의 출발점**이다. 고전 제어(전달함수)로는 볼 수 없던 것을 본다.

## 정리

$$
\boxed{\dot{\mathbf{x}} = \mathbf{A}\mathbf{x} + \mathbf{B}u, \qquad y = \mathbf{C}\mathbf{x} + \mathbf{D}u}
$$

$$
\boxed{\text{\textbf{상태변수의 수 = 에너지 저장 소자의 수}}} \;-\; i_L, \; v_C
$$

$$
\boxed{|s\mathbf{I}-\mathbf{A}| = 0 \;-\; \text{\textbf{고유값이 극}}}
$$

$$
\boxed{\phi(t) = e^{\mathbf{A}t} = \mathcal{L}^{-1}[(s\mathbf{I}-\mathbf{A})^{-1}]}
$$

| | 전달함수 | 상태공간 |
|---|---|---|
| 초기값 | **0** | **다룸** |
| 입출력 | SISO | **MIMO** |
| 내부 | **안 보임** | **보임** |
| 유일성 | 상태→전달 **유일** | 전달→상태 **여럿** |

$$
\text{\textbf{ct.1.11의 초기조건}}(i_L, v_C)\text{이 \textbf{상태변수}}\text{가 되었다}
$$
