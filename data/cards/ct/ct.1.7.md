---
id: ct.1.7
title: 4단자 및 2단자
status: reviewed
summary: 회로 속을 안 보고 단자에서만 본다. ABCD 파라미터가 송전선 해석의 언어다.
covers:
  - ct.1.7.1
  - ct.1.7.2
  - ct.1.7.3
  - ct.1.7.4
  - ct.1.7.5
  - ct.1.7.6
formulas:
  - label: ABCD 파라미터
    tex: \begin{bmatrix} V_1 \\ I_1 \end{bmatrix} = \begin{bmatrix} A & B \\ C & D \end{bmatrix}\begin{bmatrix} V_2 \\ I_2 \end{bmatrix}
    note: '**송전선의 언어**(pw.2.3). 입력을 출력으로 표현.'
  - label: 상반 정리
    tex: AD - BC = 1
    note: '**수동 회로면 항상 성립**. 검산에 쓴다.'
  - label: 대칭 조건
    tex: A = D
    note: 좌우가 같은 회로. 뒤집어도 같다.
  - label: 영상 임피던스
    tex: Z_{01} = \sqrt{\dfrac{AB}{CD}}, \qquad Z_{02} = \sqrt{\dfrac{BD}{AC}}
    note: 대칭이면 $Z_{01} = Z_{02} = \sqrt{B/C}$.
  - label: 영상 전달정수
    tex: \theta = \log_e(\sqrt{AD} + \sqrt{BC}) = \cosh^{-1}\sqrt{AD}
    note: 감쇠와 위상을 함께 나타낸다.
traps:
  - '**AD - BC = 1**은 수동 회로면 항상 성립한다. 계산 검산에 쓴다.'
  - '**A는 무차원, B는 임피던스, C는 어드미턴스, D는 무차원**이다. 단위가 다 다르다.'
  - '**임피던스 파라미터는 개방, 어드미턴스는 단락**에서 구한다.'
  - '**정저항 회로**는 주파수와 무관하게 저항이 일정하다. $Z_1Z_2 = R^2$.'
related:
  - ct.1.8
  - pw.2.3
  - ct.1.2
---

## 왜 4단자인가

$$
\boxed{\text{\textbf{회로 속을 안 보고 단자에서만} 본다}}
$$

$$
\text{\textbf{안이 아무리 복잡해도}} \;\Longrightarrow\; \text{\textbf{네 개의 수}}\text{로 끝난다}
$$

$$
\text{\textbf{블랙박스}} \;-\; \text{입력 두 단자, 출력 두 단자}
$$

$$
\text{ct.1.2의 \textbf{테브난 등가}}\text{를 \textbf{2포트}}\text{로 확장한 것}
$$

| | 테브난 | 4단자 |
|---|---|---|
| 단자 | **2개** | **4개** |
| 파라미터 | $V_{th}, R_{th}$ | **$A, B, C, D$** |
| 쓰임 | 부하만 바꿀 때 | **입출력 관계** |

$$
\text{\textbf{송전선}}\text{이 대표적} \;-\; \text{수백 km 안을 안 보고 양 끝만}
$$

## 4단자 파라미터

$$
\boxed{
\begin{bmatrix} V_1 \\ I_1 \end{bmatrix} =
\begin{bmatrix} A & B \\ C & D \end{bmatrix}
\begin{bmatrix} V_2 \\ I_2 \end{bmatrix}
}
$$

$$
V_1 = AV_2 + BI_2, \qquad I_1 = CV_2 + DI_2
$$

$$
\text{\textbf{입력을 출력으로 표현}}\text{한다}
$$

### 각 파라미터의 뜻

| 파라미터 | 구하는 법 | 뜻 | 단위 |
|---|---|---|---|
| $A = \frac{V_1}{V_2}\Big\vert_{I_2=0}$ | **출력 개방** | **전압비** | 무차원 |
| $B = \frac{V_1}{I_2}\Big\vert_{V_2=0}$ | **출력 단락** | **전달 임피던스** | $\Omega$ |
| $C = \frac{I_1}{V_2}\Big\vert_{I_2=0}$ | **출력 개방** | **전달 어드미턴스** | $\mho$ |
| $D = \frac{I_1}{I_2}\Big\vert_{V_2=0}$ | **출력 단락** | **전류비** | 무차원 |

$$
\boxed{\text{\textbf{단위가 넷 다 다르다}}}
$$

$$
\textbf{A・D는 무차원, B는 } \Omega \text{, } \text{ C는 } \mho
$$

$$
\textbf{개방이면 } \text{ I} _2 \text{ = 0} \;\Longrightarrow\; A, C
$$
$$
\textbf{단락이면 } \text{ V} _2 \text{ = 0} \;\Longrightarrow\; B, D
$$

**개방·단락으로 하나씩 죽여서** 구한다. mc.4.9의 무부하·단락 시험과 같은 발상이다.

$$
\text{\textbf{하나를 0으로 만들면 나머지가 드러난다}}
$$

### 상반 정리

$$
\boxed{AD - BC = 1}
$$

$$
\text{\textbf{수동 회로면 항상 성립}}
$$

$$
\text{\textbf{계산 검산에 쓴다}} \;-\; \text{이게 1이 아니면 틀렸다}
$$

$$
\text{\textbf{행렬식이 1}} \;\Longrightarrow\; \text{\textbf{에너지 보존}}\text{의 표현}
$$

$$
\text{\textbf{능동 소자}}(\text{증폭기})\text{가 있으면 성립 안 함}
$$

### 대칭 조건

$$
\boxed{A = D}
$$

$$
\text{\textbf{좌우가 같은 회로}} \;-\; \text{뒤집어도 같다}
$$

$$
\textbf{T형・} \pi \text{형}\text{이 좌우 대칭이면 } A = D
$$

$$
\text{\textbf{송전선}}\text{은 당연히 대칭}(\text{pw.2.3}) \;-\; \text{어느 쪽에서 봐도 같으니}
$$

## 대표적인 4단자망의 정수

### 직렬 임피던스만

$$
\begin{bmatrix} 1 & Z \\ 0 & 1 \end{bmatrix}
$$

$$
V_1 = V_2 + ZI_2, \quad I_1 = I_2 \;-\; \text{\textbf{전류는 그대로}}
$$

### 병렬 어드미턴스만

$$
\begin{bmatrix} 1 & 0 \\ Y & 1 \end{bmatrix}
$$

$$
V_1 = V_2, \quad I_1 = YV_2 + I_2 \;-\; \text{\textbf{전압은 그대로}}
$$

$$
\text{\textbf{둘을 곱하면 어떤 회로든} 만들 수 있다}
$$

### T형 회로

$$
\begin{bmatrix} 1 + \frac{Z_1}{Z_3} & Z_1 + Z_2 + \frac{Z_1Z_2}{Z_3} \\ \frac{1}{Z_3} & 1 + \frac{Z_2}{Z_3} \end{bmatrix}
$$

$$
\text{\textbf{대칭이면}}(Z_1 = Z_2) \;\Longrightarrow\; A = D \;\checkmark
$$

### π형 회로

$$
\begin{bmatrix} 1 + \frac{Z_2}{Z_3} & Z_2 \\ \frac{1}{Z_1}+\frac{1}{Z_3}+\frac{Z_2}{Z_1Z_3} & 1 + \frac{Z_2}{Z_1} \end{bmatrix}
$$

$$
\text{\textbf{pw.2.3의 중거리 송전선}}\text{이 T형・}\pi\text{형}
$$

| 모델 | 어디에 |
|---|---|
| **단거리** | $Z$ 만 |
| **중거리** | **T형 · $\pi$형** |
| **장거리** | **분포정수** (ct.1.8) |

$$
\text{\textbf{선로가 길어질수록 정교한 모델}} \;-\; \text{정전용량을 어떻게 넣느냐}
$$

## 4단자 회로망의 각종 접속

| 접속 | 합성 |
|---|---|
| **종속**(縱續) | **행렬 곱** |
| **직렬** | $Z$ 파라미터 **합** |
| **병렬** | $Y$ 파라미터 **합** |

$$
\boxed{\text{\textbf{종속 접속}} \;\Longrightarrow\; \text{\textbf{ABCD 행렬을 곱한다}}}
$$

$$
\begin{bmatrix} A & B \\ C & D \end{bmatrix} =
\begin{bmatrix} A_1 & B_1 \\ C_1 & D_1 \end{bmatrix}
\begin{bmatrix} A_2 & B_2 \\ C_2 & D_2 \end{bmatrix}
$$

$$
\text{\textbf{이게 ABCD의 최대 장점}}
$$

$$
\text{\textbf{변압기 + 송전선 + 변압기}} \;\Longrightarrow\; \text{\textbf{세 행렬을 곱하면 끝}}
$$

$$
\text{\textbf{순서가 중요}} \;-\; \text{행렬 곱은 교환 법칙이 안 된다}
$$

**계통 해석이 행렬 곱으로 끝나는 게** ABCD를 쓰는 이유다. 다른 파라미터로는 이렇게
안 된다.

$$
\text{\textbf{Z 파라미터는 직렬에, Y 파라미터는 병렬에} 편하다}
$$

$$
\text{\textbf{목적에 따라 파라미터를 고른다}}
$$

## 반복파라미터 및 영상파라미터

$$
\text{\textbf{4단자망을 무한히 이어 붙이면?}}
$$

$$
\text{\textbf{어떤 임피던스를 달면 입력 임피던스가 같아질까}}
$$

### 영상 임피던스

$$
\boxed{Z_{01} = \sqrt{\dfrac{AB}{CD}}, \qquad Z_{02} = \sqrt{\dfrac{BD}{AC}}}
$$

$$
\textbf{출력에 } \text{ Z} _{02} \text{ 를 달면 입력에서 } \text{ Z} _{01} \text{ 이 보인다}
$$

$$
\text{\textbf{반대도 성립}} \;-\; \text{입력에 } Z_{01} \text{ 을 달면 출력에서 } Z_{02}
$$

$$
Z_{01}Z_{02} = \dfrac{B}{C}, \qquad \dfrac{Z_{01}}{Z_{02}} = \dfrac{A}{D}
$$

$$
\text{\textbf{대칭이면}}(A=D) \;\Longrightarrow\; \boxed{Z_{01} = Z_{02} = \sqrt{\dfrac{B}{C}}}
$$

$$
\text{\textbf{이게 특성 임피던스}}(\text{ct.1.8})
$$

**송전선의 특성 임피던스**가 여기서 나온다. $\sqrt{Z/Y}$ 꼴이다.

$$
\text{\textbf{정합}}(\text{matching})\text{되면 \textbf{반사가 없다}}(\text{ct.1.8})
$$

### 영상 전달정수

$$
\boxed{\theta = \log_e\left(\sqrt{AD} + \sqrt{BC}\right) = \cosh^{-1}\sqrt{AD}}
$$

$$
\theta = \alpha + j\beta \;-\; \text{\textbf{감쇠정수} + \textbf{위상정수}}
$$

$$
\text{\textbf{얼마나 줄고 얼마나 늦나}}
$$

$$
\text{\textbf{ct.1.8의 전파정수}}\text{와 같은 것}
$$

$$
\dfrac{V_1}{V_2} = \sqrt{\dfrac{Z_{01}}{Z_{02}}}\,e^{\theta}
$$

$$
\text{\textbf{정합 상태에서 전압비}}\text{를 나타낸다}
$$

### 반복 임피던스

$$
\text{\textbf{같은 회로를 반복}}\text{해 이어도 임피던스가 안 변하는 값}
$$

$$
Z_{k1} = \dfrac{A - D + \sqrt{(A+D)^2 - 4}}{2C}
$$

$$
\text{\textbf{대칭이면 영상 임피던스와 같아진다}} \;-\; A = D \text{ 니}
$$

$$
\text{\textbf{필터 설계}}\text{에 쓴다} \;-\; \text{같은 단을 여러 개 이어 붙이니}
$$

## 역회로 및 정저항회로

### 역회로

$$
\boxed{Z_1 Z_2 = K^2 \;(\text{\textbf{상수}})}
$$

$$
\text{\textbf{두 회로가 서로 역}}\text{이 되는 관계}
$$

$$
\text{\textbf{L과 C를 바꾸면}} \;\Longrightarrow\; \text{역회로가 된다}
$$

$$
Z_L = j\omega L, \quad Z_C = \dfrac{1}{j\omega C} \;\Longrightarrow\; Z_LZ_C = \dfrac{L}{C} = \text{\textbf{상수}}
$$

$$
\boxed{\dfrac{L}{C} = K^2} \;-\; \text{\textbf{주파수가 약분된다}}
$$

$$
\textbf{직렬 공진} \leftrightarrow \textbf{병렬 공진} \;-\; \text{서로 역회로}
$$

$$
\text{\textbf{필터 설계}}\text{에서 저역통과 ↔ 고역통과 변환에}
$$

### 정저항회로

$$
\boxed{Z_1Z_2 = R^2 \;\Longrightarrow\; Z_{in} = R \;(\text{\textbf{주파수 무관}})}
$$

$$
\text{\textbf{주파수가 변해도 저항이 일정}}
$$

$$
\text{\textbf{L과 C가 있는데도 순저항으로 보인다}}
$$

$$
\text{\textbf{역회로 조건}} + \; K = R \;\Longrightarrow\; \text{\textbf{정저항}}
$$

$$
\sqrt{\dfrac{L}{C}} = R \;\Longrightarrow\; \boxed{R = \sqrt{\dfrac{L}{C}}}
$$

$$
\text{\textbf{ct.1.8의 무손실 선로 특성 임피던스}}\text{와 같은 꼴}
$$

$$
\text{\textbf{감쇠기・등화기}}\text{에 쓴다} \;-\; \text{임피던스는 그대로 두고 신호만 조절}
$$

## 리액턴스 2단자망

$$
\text{\textbf{L과 C만}}\text{으로 된 회로} \;-\; \text{저항이 없다}
$$

$$
\text{\textbf{포스터의 리액턴스 정리}}
$$

$$
\boxed{\dfrac{dX}{d\omega} > 0 \;-\; \text{\textbf{리액턴스는 주파수에 대해 항상 증가}}}
$$

$$
\text{\textbf{극과 영점이 번갈아 나타난다}}
$$

$$
\text{\textbf{공진}}(X=0)\text{과 \textbf{반공진}}(X=\infty)\text{이 교대}
$$

$$
\text{\textbf{손실이 없으면}} \;\Longrightarrow\; X \text{ 가 } -\infty \to +\infty \text{ 로 단조증가하며 뛴다}
$$

| 특성 | |
|---|---|
| **극·영점 교대** | 공진과 반공진이 번갈아 |
| **단조증가** | $\frac{dX}{d\omega} > 0$ |
| **$j$축에만** | 극과 영점이 허수축에 |

$$
\text{\textbf{필터의 이론적 바탕}} \;-\; \text{어떤 리액턴스 함수가 실현 가능한지}
$$

## 정리

$$
\boxed{
\begin{bmatrix} V_1 \\ I_1 \end{bmatrix} =
\begin{bmatrix} A & B \\ C & D \end{bmatrix}
\begin{bmatrix} V_2 \\ I_2 \end{bmatrix}, \qquad AD - BC = 1
}
$$

| 파라미터 | 조건 | 단위 |
|---|---|---|
| $A$ | **개방** | 무차원 |
| $B$ | **단락** | $\Omega$ |
| $C$ | **개방** | $\mho$ |
| $D$ | **단락** | 무차원 |

$$
\boxed{\text{\textbf{종속 접속} = \textbf{행렬 곱}}} \;-\; \text{ABCD를 쓰는 이유}
$$

$$
\boxed{Z_{01} = \sqrt{\dfrac{AB}{CD}}, \qquad \text{대칭이면 } \sqrt{\dfrac{B}{C}}}
$$

$$
\boxed{\text{정저항}: Z_1Z_2 = R^2 \;\Longrightarrow\; R = \sqrt{\dfrac{L}{C}}}
$$

**pw.2.3의 송전선 해석**이 전부 이 위에 서 있다. 그리고 선로가 더 길어지면 ct.1.8의
분포정수로 간다.
