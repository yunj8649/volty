---
id: ct.2.7
title: 샘플값제어
status: reviewed
summary: 디지털은 띄엄띄엄 본다. s평면의 좌반면이 z평면의 단위원 안이 된다.
covers:
  - ct.2.7.1
  - ct.2.7.2
  - ct.2.7.3
  - ct.2.7.4
  - ct.2.7.5
formulas:
  - label: z 변환의 정의
    tex: z = e^{Ts} \;\Longrightarrow\; F(z) = \sum_{n=0}^{\infty}f(nT)z^{-n}
    note: '$T$ **샘플링 주기**. s평면을 z평면으로 사상.'
  - label: 샘플링 정리
    tex: f_s > 2f_{max} \;(\text{\textbf{나이퀴스트}})
    note: 못 지키면 **에일리어싱**. 원래 신호를 복원 못 한다.
  - label: 안정 조건
    tex: '|z| < 1 \;-\; \text{\textbf{단위원 안}}'
    note: s평면의 **좌반면**이 z평면의 **단위원 안**이 된다.
  - label: 기본 변환
    tex: \mathcal{Z}[1] = \dfrac{z}{z-1}, \qquad \mathcal{Z}[e^{-at}] = \dfrac{z}{z - e^{-aT}}
    note: 라플라스의 $\frac{1}{s}$, $\frac{1}{s+a}$ 에 대응.
traps:
  - '**z평면의 안정 영역은 단위원 안**이다. s평면의 좌반면이 여기로 사상된다.'
  - '**샘플링 주파수는 최고 주파수의 2배를 넘어야** 한다. 안 그러면 에일리어싱.'
  - '**허수축이 단위원**으로, **원점이 z=1**로 사상된다.'
  - '$z = e^{Ts}$ 라 **s평면의 여러 점이 z평면의 한 점**으로 간다(다대일).'
related:
  - ct.1.9
  - ct.2.5
  - ct.2.1
---

## 왜 샘플값제어인가

$$
\text{\textbf{컴퓨터는 연속을 모른다}}
$$

$$
\text{\textbf{띄엄띄엄 재고 띄엄띄엄 조작}}\text{한다}
$$

$$
\boxed{\text{\textbf{이산 시간}}(\text{discrete-time})}
$$

$$
\text{\textbf{ct.2.1의 신호에 의한 분류}}\text{에서 \textbf{이산}}\text{이 이것}
$$

$$
\text{\textbf{요즘 제어기는 다 디지털}} \;-\; \text{PLC ・ 마이크로프로세서 ・ DSP}
$$

$$
\text{\textbf{mc.7.5의 디지털 계전기}}\text{도 이 위에 서 있다}
$$

$$
\boxed{\text{\textbf{연속 이론을 그대로 못 쓴다}}}
$$

$$
\text{\textbf{라플라스}}(\text{ct.1.9})\text{ 대신 \textbf{z 변환}}
$$

## sampling방법

$$
\text{\textbf{일정 주기 } T \text{ 마다 값을 읽는다}}
$$

$$
f^*(t) = \sum_{n=0}^{\infty}f(nT)\delta(t - nT)
$$

$$
\text{\textbf{임펄스 열}}\text{로 모형화} \;-\; \text{수학적 편의}
$$

### 샘플링 정리 (나이퀴스트)

$$
\boxed{f_s > 2f_{max}}
$$

$$
\text{\textbf{신호의 최고 주파수의 2배를 넘게} 샘플링해야}
$$

$$
\text{\textbf{안 그러면}} \;\Longrightarrow\; \boxed{\text{\textbf{에일리어싱}}(\text{aliasing})}
$$

$$
\text{\textbf{원래 신호를 복원할 수 없다}}
$$

### 에일리어싱

$$
\text{\textbf{높은 주파수가 낮은 주파수로 둔갑}}
$$

$$
\text{\textbf{바퀴가 거꾸로 도는 것처럼 보이는}} \text{ 그것} \;-\; \text{영화의 프레임}
$$

$$
\boxed{\text{\textbf{한 번 섞이면 되돌릴 수 없다}}}
$$

$$
\text{\textbf{대책}}: \text{\textbf{안티 에일리어싱 필터}} \;-\; \text{샘플링 \textbf{전에} 고주파를 잘라낸다}
$$

$$
\text{\textbf{샘플링 후에는 늦다}} \;-\; \text{이미 섞였으니}
$$

**중요한 실무 사항**이다. 아날로그 필터를 ADC 앞에 반드시 둔다.

### 홀드

$$
\text{\textbf{샘플한 값을 다음까지 유지}}
$$

$$
\boxed{\text{\textbf{0차 홀드}}(\text{ZOH}) \;-\; \text{계단 모양}}
$$

$$
G_{h0}(s) = \dfrac{1 - e^{-Ts}}{s}
$$

$$
\text{\textbf{가장 흔하다}} \;-\; \text{D/A 변환기가 이렇게 동작}
$$

$$
\text{\textbf{1차 홀드}}\text{는 기울기까지 이어붙임} \;-\; \text{복잡해서 잘 안 씀}
$$

$$
\text{\textbf{ZOH가 위상 지연}}\text{을 만든다} \;-\; \dfrac{T}{2} \text{ 만큼}
$$

$$
\text{\textbf{안정도에 불리}}(\text{ct.2.5}) \;-\; \text{샘플링이 느릴수록 위험}
$$

$$
\boxed{\text{\textbf{디지털이 아날로그보다 불리한 지점}}}
$$

**디지털 제어의 대가**다. 샘플링과 홀드가 **없던 지연**을 만든다.

## Z변환법

$$
\boxed{z = e^{Ts}}
$$

$$
F(z) = \sum_{n=0}^{\infty}f(nT)z^{-n}
$$

$$
\text{\textbf{라플라스의 이산 판}}
$$

| | 연속 | 이산 |
|---|---|---|
| **변환** | **라플라스** | **z 변환** |
| **변수** | $s$ | **$z = e^{Ts}$** |
| **미분/차분** | $sF(s)$ | **$zF(z)$** |
| **적분/합** | $\frac{F(s)}{s}$ | $\frac{F(z)}{z-1}$ |

$$
\text{\textbf{$z^{-1}$ 이 한 샘플 지연}} \;-\; \text{ct.1.9의 } e^{-Ls} \text{ 와 같은 역할}
$$

$$
\boxed{z^{-1} = \text{\textbf{한 칸 뒤로}}}
$$

### 기본 변환

| $f(t)$ | $F(s)$ | $F(z)$ |
|---|---|---|
| $\delta(t)$ | $1$ | **$1$** |
| **$u(t)$** | $\frac{1}{s}$ | **$\frac{z}{z-1}$** |
| **$t$** | $\frac{1}{s^2}$ | **$\frac{Tz}{(z-1)^2}$** |
| **$e^{-at}$** | $\frac{1}{s+a}$ | **$\frac{z}{z-e^{-aT}}$** |

$$
\boxed{\dfrac{1}{s+a} \;\longleftrightarrow\; \dfrac{z}{z-e^{-aT}}}
$$

$$
\textbf{극이 } \text{ -a } \text{ 에서 } \text{ e} ^{-aT} \text{ 로 옮겨간다}
$$

$$
\text{\textbf{$z = e^{Ts}$ 를 극에 적용한 것}} \;-\; \text{규칙이 그대로}
$$

### 초기값·최종값 정리

$$
f(0) = \lim_{z\to\infty}F(z)
$$

$$
f(\infty) = \lim_{z\to1}(z-1)F(z)
$$

$$
\boxed{\text{\textbf{$s\to0$ 이 $z\to1$}}}
$$

$$
z = e^{Ts} \;\Longrightarrow\; s = 0 \;\Longrightarrow\; z = e^0 = 1 \;\checkmark
$$

$$
\text{\textbf{ct.1.9와 대응}}\text{된다} \;-\; \text{$s$ 자리에 } (z-1)
$$

## s평면과 z평면의 사상

$$
\boxed{z = e^{Ts} = e^{(\sigma + j\omega)T} = e^{\sigma T}e^{j\omega T}}
$$

$$
|z| = e^{\sigma T}, \qquad \angle z = \omega T
$$

$$
\boxed{\text{\textbf{$\sigma$ 가 크기를, $\omega$ 가 각도를 정한다}}}
$$

### 어디가 어디로

| s평면 | z평면 |
|---|---|
| **좌반면** ($\sigma<0$) | **단위원 안** ($\lvert z\rvert<1$) |
| **허수축** ($\sigma=0$) | **단위원 위** ($\lvert z\rvert=1$) |
| **우반면** ($\sigma>0$) | **단위원 밖** ($\lvert z\rvert>1$) |
| **원점** ($s=0$) | **$z = 1$** |

$$
\boxed{\textbf{좌반면} \to \textbf{단위원 안}}
$$

$$
\sigma < 0 \;\Longrightarrow\; e^{\sigma T} < 1 \;\Longrightarrow\; |z| < 1 \;\checkmark
$$

$$
\text{\textbf{ct.2.5의 안정 조건이 옮겨간다}}
$$

$$
\boxed{\text{\textbf{안정}} \;\Longleftrightarrow\; |z| < 1}
$$

$$
\text{\textbf{반듯한 선이 원이 되었다}} \;-\; \text{지수 함수가 그렇게 만든다}
$$

### 다대일 사상

$$
e^{j\omega T} \text{ 는 } \omega \text{ 가 } \dfrac{2\pi}{T} \text{ 만큼 변하면 \textbf{같은 값}}
$$

$$
\boxed{\text{\textbf{s평면의 여러 점이 z평면의 한 점으로}}}
$$

$$
\text{\textbf{주기적}} \;-\; \text{s평면을 } \dfrac{2\pi}{T} \text{ 씩 잘라 겹친다}
$$

$$
\text{\textbf{그게 에일리어싱의 수학적 정체}}
$$

$$
\text{\textbf{높은 주파수와 낮은 주파수가 z평면에서 같은 점}} \;\Longrightarrow\; \text{\textbf{구별 불가}}
$$

$$
\boxed{\text{\textbf{샘플링 정리가 여기서 나온다}}}
$$

$$
\text{\textbf{주 대역}}: -\dfrac{\pi}{T} < \omega < \dfrac{\pi}{T} \;-\; \text{이 안에 있어야 유일}
$$

$$
\omega_{max} < \dfrac{\pi}{T} = \dfrac{\omega_s}{2} \;\Longrightarrow\; f_{max} < \dfrac{f_s}{2} \;\checkmark
$$

**샘플링 정리가 사상의 성질에서 저절로 나온다.** 우아하다.

## 펄스전달함수

$$
\boxed{G(z) = \dfrac{C(z)}{R(z)}}
$$

$$
\text{\textbf{ct.1.10의 전달함수}}\text{를 이산으로}
$$

$$
G(z) = \mathcal{Z}\left[G(s)\right] \;-\; \text{다만 \textbf{주의}}
$$

$$
\mathcal{Z}[G_1(s)G_2(s)] \neq \mathcal{Z}[G_1(s)]\cdot\mathcal{Z}[G_2(s)]
$$

$$
\boxed{\text{\textbf{곱의 z변환은 z변환의 곱이 아니다}}}
$$

$$
\text{\textbf{사이에 샘플러가 있느냐}}\text{로 갈린다}
$$

$$
\text{\textbf{샘플러가 있으면}} \;\Longrightarrow\; \text{따로 변환해서 곱한다}
$$

$$
\text{\textbf{없으면}} \;\Longrightarrow\; \text{합쳐서 한 번에 변환}
$$

**연속계와 결정적으로 다른 점**이다. 라플라스는 그냥 곱하면 됐다.

$$
\text{\textbf{샘플러의 위치가 중요}} \;-\; \text{블록선도를 조심해서 봐야}
$$

### ZOH를 포함한 전달함수

$$
G(z) = (1 - z^{-1})\mathcal{Z}\left[\dfrac{G(s)}{s}\right]
$$

$$
\text{\textbf{ZOH}}\text{의 } \dfrac{1-e^{-Ts}}{s} \text{ 를 z로 옮긴 것}
$$

$$
e^{-Ts} \;\longleftrightarrow\; z^{-1} \;-\; \text{한 샘플 지연}
$$

$$
\text{\textbf{실무에서 가장 많이 쓰는 식}}
$$

## sample값 제어계의 Z변환법에 의한 해석

$$
\text{\textbf{연속계와 같은 구조}}
$$

$$
\dfrac{C(z)}{R(z)} = \dfrac{G(z)}{1 + G(z)H(z)}
$$

$$
\text{\textbf{ct.2.2의 되먹임 공식}}\text{과 똑같다} \;-\; s \text{ 가 } z \text{ 로 바뀌었을 뿐}
$$

$$
\text{\textbf{특성방정식}}: 1 + G(z)H(z) = 0
$$

$$
\boxed{\text{\textbf{배운 게 다시 쓰인다}}}
$$

$$
\text{\textbf{다만 샘플러의 위치}}\text{를 조심해야 한다}
$$

### 정상편차

$$
e_{ss} = \lim_{z\to1}(z-1)E(z)
$$

$$
\text{\textbf{ct.2.4와 대응}} \;-\; s \to 0 \text{ 이 } z \to 1
$$

$$
\text{\textbf{형}}\text{도 그대로} \;-\; z=1 \text{ 에 극이 몇 개냐}
$$

$$
\text{\textbf{$z=1$ 이 적분기}} \;-\; \dfrac{z}{z-1} \text{ 가 계단의 z변환이니}
$$

## sample값 제어계의 안정도

$$
\boxed{\text{\textbf{모든 극이 단위원 안}} \;\Longleftrightarrow\; \text{안정}}
$$

$$
|z_i| < 1 \quad \text{for all } i
$$

### 판별법

| 방법 | |
|---|---|
| **직접 근 계산** | 2차까지 |
| **주리 판별법** | z평면의 라우스 |
| **쌍1차 변환** | $z \to w$ 로 바꿔 **라우스**를 씀 |

$$
\text{\textbf{쌍1차 변환}}(\text{bilinear}): z = \dfrac{1+w}{1-w}
$$

$$
\text{\textbf{단위원 안}} \;\longrightarrow\; \text{\textbf{w평면의 좌반면}}
$$

$$
\boxed{\text{\textbf{라우스를 그대로 쓸 수 있다}}}
$$

$$
\text{\textbf{원을 직선으로 펴는 변환}} \;-\; \text{영리하다}
$$

$$
\text{\textbf{ct.2.5의 도구를 재활용}}
$$

### 샘플링 주기와 안정도

$$
T \uparrow \;\Longrightarrow\; \text{\textbf{불안정}}\text{해진다}
$$

$$
\text{\textbf{느리게 샘플링하면}} \;\Longrightarrow\; \text{ZOH 지연} \uparrow \;\Longrightarrow\; \text{위상여유} \downarrow
$$

$$
\boxed{\text{\textbf{빠를수록 좋다}}} \;-\; \text{연속계에 가까워지니}
$$

$$
T \to 0 \;\Longrightarrow\; z \to 1 \;\Longrightarrow\; \text{\textbf{연속계}}
$$

$$
\text{\textbf{그런데 계산 능력의 한계}}\text{가 있다}
$$

$$
\text{\textbf{실무}}: T \approx \dfrac{1}{10} \sim \dfrac{1}{20} \text{ 의 시정수}
$$

$$
\text{\textbf{또 거래}} \;-\; \text{성능 vs 계산 부담}
$$

## 정리

$$
\boxed{z = e^{Ts} \;\Longrightarrow\; \textbf{좌반면} \to \textbf{단위원 안}}
$$

| s평면 | z평면 |
|---|---|
| **좌반면** | **$\lvert z\rvert<1$** (안정) |
| **허수축** | **$\lvert z\rvert=1$** |
| **우반면** | **$\lvert z\rvert>1$** |
| **원점** | **$z=1$** |

$$
\boxed{f_s > 2f_{max}} \;-\; \text{\textbf{샘플링 정리}}, \text{ 어기면 \textbf{에일리어싱}}
$$

$$
\boxed{e_{ss} = \lim_{z\to1}(z-1)E(z)} \;-\; \text{ct.2.4의 } s\to0 \text{ 에 대응}
$$

$$
\text{\textbf{$z^{-1}$ 이 한 샘플 지연}}, \qquad \text{\textbf{$z=1$ 이 적분기}}
$$

$$
\text{\textbf{디지털의 대가}} \;-\; \text{ZOH 지연이 안정도를 깎는다}
$$
