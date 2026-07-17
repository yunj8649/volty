---
id: ct.1.3
title: 교류회로
status: reviewed
summary: 페이저가 미분방정식을 사칙연산으로 바꾼다. 그 대가로 정현파 정상상태만 다룰 수 있다.
covers:
  - ct.1.3.1
  - ct.1.3.2
  - ct.1.3.3
  - ct.1.3.4
formulas:
  - label: 실효값
    tex: V = \dfrac{V_m}{\sqrt{2}} = 0.707 V_m, \qquad V_{av} = \dfrac{2V_m}{\pi} = 0.637V_m
    note: 실효값은 **제곱평균제곱근**. 평균값과 다르다.
  - label: 파형률과 파고율
    tex: \text{파형률} = \dfrac{\text{실효값}}{\text{평균값}} = 1.11, \qquad \text{파고율} = \dfrac{\text{최대값}}{\text{실효값}} = \sqrt{2}
    note: 정현파 기준. **파형률 1.11, 파고율 1.414**.
  - label: 임피던스
    tex: Z = R + jX = R + j\left(\omega L - \dfrac{1}{\omega C}\right)
    note: '**L은 +j, C는 -j**. 미분이 $j\omega$ 가 된다.'
  - label: 교류 전력
    tex: P = VI\cos\theta, \quad Q = VI\sin\theta, \quad S = VI = \sqrt{P^2+Q^2}
    note: '**유효·무효·피상**. 피타고라스로 묶인다.'
  - label: 공진
    tex: \omega_0 = \dfrac{1}{\sqrt{LC}}, \qquad Q = \dfrac{\omega_0 L}{R} = \dfrac{1}{R}\sqrt{\dfrac{L}{C}}
    note: 직렬공진은 **임피던스 최소**, 병렬공진은 **최대**.
traps:
  - '**실효값은 제곱평균제곱근**이다. 평균값(0.637)과 헷갈리면 안 된다.'
  - '**직렬공진은 임피던스 최소(전류 최대), 병렬공진은 임피던스 최대(전류 최소)**다. 정반대.'
  - '**페이저는 정현파 정상상태에서만** 쓴다. 과도 상태나 비정현파에는 못 쓴다.'
  - '**유도결합의 극성**: 가동결합이면 $+2M$, 차동결합이면 $-2M$.'
related:
  - ct.1.1
  - ct.1.4
  - ct.1.11
---

## 정현파 교류

$$
v = V_m\sin(\omega t + \theta)
$$

$$
\omega = 2\pi f\ \mathrm{[rad/s]}, \qquad T = \dfrac{1}{f}
$$

### 실효값

$$
\boxed{V = \sqrt{\dfrac{1}{T}\int_0^T v^2 dt} = \dfrac{V_m}{\sqrt{2}} = 0.707V_m}
$$

$$
\text{\textbf{제곱평균제곱근}}(\text{RMS})
$$

**왜 제곱인가.** 전력이 $i^2R$ 이라 **제곱의 평균**이 열을 정한다.

$$
\boxed{\text{\textbf{실효값 = 같은 열을 내는 직류의 값}}}
$$

$$
\text{\textbf{정의가 목적에서 나왔다}} \;-\; \text{열을 재려고 만든 값}
$$

### 평균값

$$
\boxed{V_{av} = \dfrac{1}{T/2}\int_0^{T/2} v \, dt = \dfrac{2V_m}{\pi} = 0.637V_m}
$$

$$
\text{\textbf{반주기 평균}} \;-\; \text{한 주기면 0이 되니}
$$

$$
\text{\textbf{mc.3.2의 정류 전압}}\text{이 이것} \;-\; 0.45E \text{ 와 } 0.9E \text{ 의 뿌리}
$$

$$
\text{단상 전파 } E_d = \dfrac{2\sqrt{2}E}{\pi} \;-\; \text{실효값 } E \text{ 를 최대값 } \sqrt{2}E \text{ 로 바꾼 뒤 평균}
$$

**정류 회로의 숫자가 여기서 나온다.** 평균값의 정의가 그대로 직류 출력이다.

### 파형률과 파고율

$$
\boxed{\text{\textbf{파형률}} = \dfrac{\text{실효값}}{\text{평균값}} = \dfrac{0.707}{0.637} = \mathbf{1.11}}
$$

$$
\boxed{\text{\textbf{파고율}} = \dfrac{\text{최대값}}{\text{실효값}} = \dfrac{1}{0.707} = \mathbf{1.414} = \sqrt{2}}
$$

| 파형 | 실효값 | 평균값 | 파형률 | 파고율 |
|---|---|---|---|---|
| **정현파** | $\frac{V_m}{\sqrt{2}}$ | $\frac{2V_m}{\pi}$ | **1.11** | **1.414** |
| **정현 반파** | $\frac{V_m}{2}$ | $\frac{V_m}{\pi}$ | **1.57** | **2** |
| **삼각파** | $\frac{V_m}{\sqrt{3}}$ | $\frac{V_m}{2}$ | **1.155** | **1.732** |
| **구형파** | $V_m$ | $V_m$ | **1** | **1** |
| 구형 반파 | $\frac{V_m}{\sqrt{2}}$ | $\frac{V_m}{2}$ | 1.414 | 1.414 |

$$
\text{\textbf{구형파는 둘 다 1}} \;-\; \text{최대값・실효값・평균값이 다 같으니}
$$

$$
\text{\textbf{뾰족할수록 파고율이 크다}} \;-\; \text{삼각파} > \text{정현파} > \text{구형파}
$$

**파고율이 절연에 중요**하다. 실효값이 같아도 뾰족하면 최대값이 커서 절연이 위험하다.

## 교류 회로의 페이저 해석

$$
\boxed{\text{\textbf{미분방정식}} \;\longrightarrow\; \text{\textbf{사칙연산}}}
$$

$$
\dfrac{d}{dt} \;\longrightarrow\; j\omega, \qquad \int dt \;\longrightarrow\; \dfrac{1}{j\omega}
$$

$$
\text{\textbf{이게 페이저의 전부}}
$$

### 왜 되나

$$
v = V_m e^{j\omega t} \;\Longrightarrow\; \dfrac{dv}{dt} = j\omega V_m e^{j\omega t} = j\omega v
$$

$$
\text{\textbf{지수함수는 미분해도 자기 자신}} \;\times\; j\omega
$$

$$
\boxed{\text{\textbf{미분이 곱셈이 된다}}}
$$

$$
\text{\textbf{정현파이기 때문에} 가능} \;-\; \text{다른 파형은 안 된다}
$$

### 임피던스

$$
\boxed{Z = R + jX = R + j\left(\omega L - \dfrac{1}{\omega C}\right)}
$$

| 소자 | 시간 영역 | 페이저 |
|---|---|---|
| **R** | $v = Ri$ | $Z = R$ |
| **L** | $v = L\frac{di}{dt}$ | $Z = j\omega L$ |
| **C** | $i = C\frac{dv}{dt}$ | $Z = \frac{1}{j\omega C} = -j\frac{1}{\omega C}$ |

$$
\boxed{\text{\textbf{L은 } +j, \text{ C는 } -j}}
$$

$$
\text{\textbf{L은 전류가 뒤지고}}(90° \text{ 뒤짐}), \qquad \text{\textbf{C는 전류가 앞선다}}(90° \text{ 앞섬})
$$

$$
\text{\textbf{"엘디씨"}} \;-\; \text{L은 뒤(Delay), C는 앞(Current lead)}
$$

**pw.2.5의 페란티**, **mc.2.3의 증자작용**이 다 C의 진상 전류에서 나왔다.

### 페이저의 한계

$$
\boxed{\text{\textbf{정현파 정상상태}}\text{에서만}}
$$

| 못 쓰는 경우 | 대신 |
|---|---|
| **과도 상태** | **라플라스 변환** (ct.1.9) |
| **비정현파** | **푸리에 급수** (ct.1.4) |
| 비선형 소자 | — |

$$
\text{\textbf{공짜가 아니다}} \;-\; \text{편해진 대신 범위가 좁아졌다}
$$

$$
\text{\textbf{라플라스가 페이저의 일반화}}(\text{ct.1.9}) \;-\; j\omega \to s
$$

## 교류 전력

$$
\boxed{P = VI\cos\theta\ \mathrm{[W]}, \quad Q = VI\sin\theta\ \mathrm{[Var]}, \quad S = VI\ \mathrm{[VA]}}
$$

$$
S = \sqrt{P^2 + Q^2} \;-\; \text{\textbf{피타고라스}}
$$

$$
\cos\theta = \dfrac{P}{S} \;-\; \text{\textbf{역률}}
$$

### 왜 세 가지인가

$$
p(t) = vi = V_mI_m\sin\omega t \sin(\omega t - \theta)
$$

$$
= VI\cos\theta \;-\; VI\cos(2\omega t - \theta)
$$

$$
\text{\textbf{상수 항}} + \text{\textbf{2배 주파수로 진동하는 항}}
$$

$$
\boxed{\textbf{평균이 } \text{ P = VI} \cos \theta \;-\; \text{실제로 소비되는 전력}}
$$

$$
\text{\textbf{진동 항의 평균은 0}} \;-\; \text{주고받기만 한다} \;\Longrightarrow\; \text{\textbf{무효전력}}
$$

$$
\textbf{순시 전력이 } \text{ 2} \omega \text{ 로 맥동}\text{한다} \;-\; \text{단상의 숙명}
$$

**mc.5.7의 단상 유도전동기가 진동**하는 이유다. 전력이 $2f$ 로 맥동하니 토크도 맥동한다.

$$
\text{\textbf{3상은 맥동이 없다}} \;-\; \text{세 상의 합이 \textbf{일정}}(\text{ct.1.5})
$$

### 복소전력

$$
\boxed{S = V\bar{I} = P + jQ}
$$

$$
\text{\textbf{전류의 켤레}}\text{를 곱한다}
$$

$$
\text{\textbf{켤레를 안 취하면}} \;\Longrightarrow\; \text{위상이 더해져 \textbf{엉뚱한 값}}
$$

$$
V\bar{I} \;\Longrightarrow\; \text{각도가 } \theta_v - \theta_i = \theta \;-\; \text{\textbf{정확히 역률각}}
$$

$$
\text{\textbf{지상}}(\text{L 부하}) \;\Longrightarrow\; Q > 0 \qquad \text{\textbf{진상}}(\text{C 부하}) \;\Longrightarrow\; Q < 0
$$

**pw.2.6의 역률 개선**이 $Q$ 를 상쇄하는 것이다. L의 $+Q$ 를 C의 $-Q$ 로 지운다.

## 공진

$$
\boxed{\omega_0 = \dfrac{1}{\sqrt{LC}} \;\Longrightarrow\; f_0 = \dfrac{1}{2\pi\sqrt{LC}}}
$$

$$
\text{\textbf{L과 C의 리액턴스가 같아지는} 주파수}
$$

$$
\omega L = \dfrac{1}{\omega C} \;\Longrightarrow\; \omega^2 = \dfrac{1}{LC}
$$

### 직렬공진 vs 병렬공진 — 정반대다

| | **직렬공진** | **병렬공진** |
|---|---|---|
| **임피던스** | **최소** ($Z = R$) | **최대** |
| **전류** | **최대** | **최소** |
| **다른 이름** | **전압 확대** | **전류 확대** · 반공진 |
| 위험 | **과전류** | **과전압** |

$$
\boxed{\text{\textbf{직렬은 최소, 병렬은 최대}}}
$$

$$
\text{\textbf{직렬}}: Z = R + j(\omega L - \tfrac{1}{\omega C}) \;\Longrightarrow\; \text{공진 시 허수부 } 0 \;\Longrightarrow\; Z = R \;(\text{\textbf{최소}})
$$

$$
\text{\textbf{병렬}}: Y = \tfrac{1}{R} + j(\omega C - \tfrac{1}{\omega L}) \;\Longrightarrow\; \text{공진 시 } Y \text{ 최소} \;\Longrightarrow\; Z \text{ \textbf{최대}}
$$

$$
\text{\textbf{어드미턴스로 보면 병렬도 같은 꼴}} \;-\; \text{그래서 뒤집힌다}
$$

### 선택도 Q

$$
\boxed{Q = \dfrac{\omega_0 L}{R} = \dfrac{1}{\omega_0 CR} = \dfrac{1}{R}\sqrt{\dfrac{L}{C}}}
$$

$$
\text{\textbf{얼마나 날카로운가}} \;-\; \text{공진의 예민함}
$$

$$
Q = \dfrac{f_0}{BW} \;-\; \text{\textbf{대역폭의 역수}}
$$

$$
Q \uparrow \;\Longrightarrow\; \text{\textbf{좁고 뾰족}} \;\Longrightarrow\; \text{선택성 좋음}
$$

$$
\text{\textbf{직렬공진에서 } Q \text{ 는 전압 확대율}} \;-\; V_L = V_C = Q \times V
$$

$$
Q = 100 \;\Longrightarrow\; \text{\textbf{L과 C에 100배 전압}} \;-\; \text{절연 파괴 위험}
$$

**pw.7.3의 고조파 공진**이 무서운 이유다. 계통에서 공진이 나면 전압이 몇 배로 뛴다.

$$
\text{\textbf{mc.4.10의 GPT 중성점 불안정}}\text{도 직렬공진}
$$

## 유도결합회로

$$
\boxed{M = k\sqrt{L_1L_2}}
$$

$$
k = \text{\textbf{결합계수}} \;(0 \leq k \leq 1)
$$

$$
k = 1 \;-\; \text{\textbf{완전결합}}(\text{누설 없음}) \qquad k = 0 \;-\; \text{\textbf{무결합}}
$$

$$
\text{\textbf{변압기}}(\text{mc.4.1})\text{가 } k \approx 1 \text{ 을 노린다} \;-\; \text{누설이 적을수록}
$$

### 가동결합과 차동결합

$$
\boxed{\text{\textbf{가동}}: L = L_1 + L_2 + 2M \qquad \text{\textbf{차동}}: L = L_1 + L_2 - 2M}
$$

$$
\text{\textbf{자속이 더해지면 가동, 빼면 차동}}
$$

$$
\text{\textbf{2M}}\text{인 이유} \;-\; \text{1이 2에 주고, 2가 1에 주니 \textbf{두 번}}
$$

$$
\text{\textbf{점 표기}}(\text{dot convention})\text{로 극성을 나타낸다}
$$

$$
\text{\textbf{둘 다 점으로 들어가거나 둘 다 나오면}} \;\Longrightarrow\; \text{\textbf{가동}}
$$

**mc.4.4의 변압기 극성**이 이것이다. 감극성·가극성이 점 표기로 표현된다.

$$
\text{\textbf{두 식을 빼면}}: L_{\text{가동}} - L_{\text{차동}} = 4M \;\Longrightarrow\; M = \dfrac{L_{\text{가동}} - L_{\text{차동}}}{4}
$$

$$
\text{\textbf{두 번 재서 } M \text{ 을 구하는 방법}} \;-\; \text{실용적}
$$

## 정리

$$
\boxed{\text{실효값 } \dfrac{V_m}{\sqrt{2}}, \quad \text{평균값 } \dfrac{2V_m}{\pi}, \quad \text{파형률 } 1.11, \quad \text{파고율 } 1.414}
$$

$$
\boxed{Z = R + j\left(\omega L - \dfrac{1}{\omega C}\right) \;-\; \text{\textbf{L은 } +j, \text{ C는 } -j}}
$$

$$
\boxed{S = P + jQ = V\bar{I}, \qquad S = \sqrt{P^2+Q^2}}
$$

| 공진 | 임피던스 | 전류 | 위험 |
|---|---|---|---|
| **직렬** | **최소** | **최대** | **과전류·과전압**($Q$배) |
| **병렬** | **최대** | **최소** | 과전압 |

$$
\boxed{\dfrac{d}{dt} \to j\omega} \;-\; \text{\textbf{페이저의 전부}}\text{이자 \textbf{정현파에서만} 되는 이유}
$$
