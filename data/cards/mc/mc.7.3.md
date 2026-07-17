---
id: mc.7.3
title: 제어기기의 특성 및 시험
status: reviewed
summary: 얼마나 빨리 · 정확히 · 안정하게 따라가느냐. 그걸 재는 게 시험이다.
covers:
  - mc.7.3.1
  - mc.7.3.2
formulas:
  - label: 서보의 세 지표
    tex: \text{\textbf{속응성}}(\text{빠른가}) \cdot \text{\textbf{정확도}}(\text{맞는가}) \cdot \text{\textbf{안정도}}(\text{안 흔들리나)}
    note: 셋이 서로 상충한다. 빠르면 흔들리고 안정하면 느리다.
  - label: 기계적 시정수
    tex: \tau_m = \dfrac{J R_a}{K_t K_e}
    note: '**관성에 비례**. 서보가 가늘고 긴 이유.'
  - label: 토크정수와 역기전력정수
    tex: T = K_t I_a, \qquad E = K_e \omega
    note: SI 단위계에서 **$K_t = K_e$** (수치가 같다).
  - label: 스테핑모터의 두 토크
    tex: \text{\textbf{홀딩 토크}}(\text{여자 시}) \;>\; \text{\textbf{디텐트 토크}}(\text{무여자 시})
    note: 디텐트는 자석만의 힘이라 VR형엔 없다.
traps:
  - '**속응성·정확도·안정도는 서로 상충**한다. 빠르게 하면 오버슈트가 생긴다.'
  - '**기계적 시정수는 관성에 비례**한다. 관성을 줄이는 게 응답을 빠르게 하는 길.'
  - '**홀딩 토크는 여자 시, 디텐트 토크는 무여자 시**다. VR형은 디텐트 토크가 없다.'
  - '**SI 단위에서 토크정수와 역기전력정수가 수치상 같다.** 우연이 아니라 에너지 보존.'
related:
  - mc.7.1
  - mc.7.2
  - mc.1.6
---

## 특성

$$
\boxed{\text{\textbf{속응성}} \cdot \text{\textbf{정확도}} \cdot \text{\textbf{안정도}}}
$$

| 지표 | 묻는 것 |
|---|---|
| **속응성** | **얼마나 빨리** 따라가나 |
| **정확도** | **얼마나 정확히** 맞추나 |
| **안정도** | **안 흔들리나** |

$$
\boxed{\text{\textbf{셋이 서로 상충한다}}}
$$

$$
\text{빠르게 하면} \;\Longrightarrow\; \text{\textbf{오버슈트}} \;\Longrightarrow\; \text{안정도} \downarrow
$$

$$
\text{안정하게 하면} \;\Longrightarrow\; \text{\textbf{느려진다}}
$$

**mc.2.6에서 본 딜레마와 같다.** 거기서도 속응여자가 과도안정도에는 좋고 난조에는
나빴다. **제어의 일반적 긴장**이다.

$$
\text{\textbf{튜닝이란 이 셋의 균형을 잡는 일}}
$$

## 응답 특성

### 과도 응답의 지표

| 지표 | 뜻 |
|---|---|
| **지연시간** ($T_d$) | 목표의 **50%**까지 |
| **상승시간** ($T_r$) | **10% → 90%** |
| **정정시간** ($T_s$) | 오차 **±5% 안에** 들어와 머무를 때까지 |
| **오버슈트** | 목표를 **넘어선** 최대량 |
| **정상편차** | 최종적으로 **남는 오차** |

$$
\text{\textbf{ct 과목}}(\text{제어공학})\text{에서 수학으로 다시 나온다}
$$

$$
\text{여기서는 \textbf{기계의 물성}}\text{이 그 값을 어떻게 정하는지가 관심}
$$

### 기계적 시정수

$$
\boxed{\tau_m = \dfrac{J R_a}{K_t K_e}}
$$

$$
\text{\textbf{관성에 비례}} \;\Longrightarrow\; \text{\textbf{관성을 줄이면 빨라진다}}
$$

$$
\text{mc.7.2의 \textbf{"가늘고 길게"}}\text{가 이 식에서 나온다}
$$

$$
J \propto mr^2 \;\Longrightarrow\; \text{지름} \downarrow \;\Longrightarrow\; J \downarrow \;\Longrightarrow\; \tau_m \downarrow
$$

$$
\text{\textbf{전기적 시정수}} \; \tau_e = \dfrac{L_a}{R_a} \;-\; \text{보통 } \tau_m \text{ 보다 \textbf{훨씬 작다}}
$$

$$
\text{\textbf{기계가 전기보다 느리다}} \;\Longrightarrow\; \text{응답을 지배하는 건 } \tau_m
$$

**전류는 순식간에 세우는데 회전자는 천천히 움직인다.** 그래서 관성이 병목이다.

## 토크정수와 역기전력정수

$$
T = K_t I_a \qquad E = K_e \omega
$$

$$
\boxed{\text{SI 단위계에서 } K_t = K_e \;(\text{수치가 같다})}
$$

$$
K_t\ [\mathrm{N \cdot m/A}], \qquad K_e\ [\mathrm{V \cdot s/rad}]
$$

### 왜 같은가 — 에너지 보존

$$
\text{\textbf{전기적 입력} = \textbf{기계적 출력}}(\text{손실 무시})
$$

$$
E I_a = T \omega
$$

$$
(K_e \omega) I_a = (K_t I_a)\omega
$$

$$
K_e \omega I_a = K_t I_a \omega \;\Longrightarrow\; \boxed{K_e = K_t}
$$

$$
\text{\textbf{우연이 아니라 에너지 보존의 결과}}
$$

**mc.1.6에서 $EI_a = T\omega$** 로 토크 식을 유도한 게 이것이다. 같은 관계를 정수로
표현했을 뿐이다.

$$
\textbf{데이터시트에서 } \text{ K} _e \text{ 를 보면 } \text{ K} _t \text{ 를 안다} \;-\; \text{실무에서 유용}
$$

## 스테핑모터의 특성

### 두 가지 토크

$$
\boxed{\text{\textbf{홀딩 토크}} \;>\; \text{\textbf{디텐트 토크}}}
$$

| 토크 | 언제 |
|---|---|
| **홀딩 토크** | **여자 상태**에서 붙잡는 힘 |
| **디텐트 토크** | **무여자 상태**에서 붙잡는 힘 |

$$
\text{\textbf{디텐트}}\text{는 \textbf{자석만의 힘}}
$$

$$
\text{\textbf{VR형은 디텐트 토크가 없다}}(\text{mc.7.2}) \;-\; \text{자석이 없으니}
$$

$$
\text{\textbf{전원을 끊으면}} \;\Longrightarrow\; \text{VR형은 \textbf{자유 회전}}, \; \text{PM・HB형은 \textbf{제자리 유지}}
$$

**스테핑모터를 손으로 돌려 보면 툭툭 걸리는** 게 디텐트 토크다.

$$
\text{\textbf{디텐트는 장점이자 단점}} \;-\; \text{정지 유지에는 좋고 \textbf{진동}의 원인}
$$

### 특성 곡선

| 곡선 | |
|---|---|
| **풀인 토크**(pull-in) | **탈조 없이 기동·정지**할 수 있는 영역 |
| **풀아웃 토크**(pull-out) | 회전 중 **탈조하지 않는** 최대 토크 |

$$
\boxed{\text{\textbf{풀인} < \textbf{풀아웃}}}
$$

$$
\text{\textbf{기동이 더 어렵다}} \;-\; \text{관성을 이겨야 하니}
$$

$$
\text{\textbf{슬루 영역}}: \text{풀인과 풀아웃 사이} \;-\; \text{\textbf{가감속이 필요한} 구간}
$$

**풀인 영역 밖에서는 갑자기 그 속도로 못 뛴다.** 천천히 가속해야 한다. 그게
**가감속 프로파일**이다(mc.7.1).

$$
\text{\textbf{mc.2.7의 동기전동기 인입}}\text{과 같은 개념} \;-\; \text{"pull-in"이라는 말도 같다}
$$

### 공진

$$
\text{특정 펄스 주파수에서 \textbf{공진}} \;\Longrightarrow\; \text{\textbf{탈조}}
$$

$$
\text{스텝마다 \textbf{과도 진동}}\text{이 생기는데} \;\Longrightarrow\; \text{그 고유진동수와 펄스가 맞으면 \textbf{증폭}}
$$

| 대책 | |
|---|---|
| **마이크로스테핑** | 계단을 잘게 (mc.7.2) |
| **댐퍼** | 기계적 감쇠 |
| 공진 주파수 회피 | |

$$
\text{\textbf{마이크로스테핑이 진동을 줄이는 이유}}\text{가 이것}
$$

## 시험

| 시험 | 무엇을 보나 |
|---|---|
| **무부하 시험** | 무부하 속도·전류 |
| **부하 시험** | 토크-속도 특성 |
| **응답 시험** | **계단 응답** — 속응성·오버슈트 |
| **절연저항·내력** | 메거 |
| **온도상승** | 저항법 (mc.1.10) |
| **진동·소음** | |
| **토크 측정** | 동력계·프로니 브레이크 (mc.1.10) |

$$
\text{\textbf{기본 시험은 다른 회전기와 같다}}
$$

$$
\text{\textbf{추가되는 게 응답 시험}} \;-\; \text{제어기기 고유}
$$

### 응답 시험

$$
\text{\textbf{계단 입력}}\text{을 주고 \textbf{출력 파형}}\text{을 본다}
$$

$$
\text{\textbf{오버슈트 ・ 정정시간 ・ 정상편차}}\text{를 읽는다}
$$

$$
\text{\textbf{ct 과목의 시간 응답}}\text{을 실물로 재는 것}
$$

### 스테핑모터 고유 시험

| 시험 | |
|---|---|
| **스텝각 정확도** | 실제 각도 vs 이론 |
| **풀인·풀아웃 토크** | 특성 곡선 작성 |
| **공진 주파수** | 회피 대역 확인 |
| **탈조 시험** | 한계 부하 |

$$
\text{\textbf{탈조가 최대 관심사}}(\text{mc.7.1}) \;-\; \text{개루프의 대가}
$$

## 정리

$$
\boxed{\text{\textbf{속응성 ・ 정확도 ・ 안정도}} \;-\; \text{셋이 상충}}
$$

$$
\boxed{\tau_m = \dfrac{JR_a}{K_tK_e} \;-\; \text{\textbf{관성이 응답을 지배}}}
$$

$$
\boxed{K_t = K_e \;(\text{SI}) \;-\; \text{에너지 보존의 결과}}
$$

| 스테핑 | |
|---|---|
| **홀딩 토크** | **여자 시** |
| **디텐트 토크** | **무여자 시** (자석만) — **VR형엔 없음** |
| **풀인 < 풀아웃** | 기동이 더 어렵다 |

$$
\text{\textbf{모든 특성이 "얼마나 빨리 ・ 정확히 ・ 안정하게"}}\text{로 수렴한다}
$$
