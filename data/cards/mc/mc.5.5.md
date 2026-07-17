---
id: mc.5.5
title: 특수 농형유도전동기
status: reviewed
summary: 농형은 저항을 못 넣으니 표피효과로 저항이 저절로 변하게 만들었다. 기동 때만 저항이 커진다.
covers:
  - mc.5.5.1
  - mc.5.5.2
formulas:
  - label: 표피효과
    tex: \delta = \sqrt{\dfrac{2}{\omega\mu\sigma}} \;\Longrightarrow\; f \uparrow \;\Longrightarrow\; \text{전류가 \textbf{표면}으로}
    note: '$f_2 = sf_1$ 이라 **기동 시 주파수가 높다**(mc.5.2).'
  - label: 자동 저항 변화
    tex: \text{기동}(s=1, f_2=60) \to \text{표피효과} \to r_2 \uparrow \qquad \text{운전}(s\approx0, f_2\approx0) \to r_2 \downarrow
    note: '**저절로** 비례추이 효과. 권선형 없이.'
  - label: 2중 농형
    tex: \text{바깥 도체} = \text{\textbf{고저항 ・ 저리액턴스}}, \quad \text{안쪽 도체} = \text{\textbf{저저항 ・ 고리액턴스}}
    note: 기동은 바깥이, 운전은 안쪽이 맡는다.
traps:
  - '**기동 시 2차 주파수가 60Hz**다(s=1). 운전 시는 2~3Hz. 이 차이가 표피효과를 만든다.'
  - '**2중 농형의 바깥이 고저항**이다. 안쪽이 아니다. 기동 때 바깥으로 전류가 몰린다.'
  - '**안쪽 도체가 리액턴스가 큰 이유**는 철심에 깊이 묻혀 누설자속이 많이 쇄교해서다.'
  - 특수 농형은 **기동 특성만** 개선한다. 속도 제어는 여전히 안 된다.
related:
  - mc.5.2
  - mc.5.1
  - em.7.7
---

## 왜 이런 게 필요한가

$$
\text{\textbf{권선형은 비례추이로 기동토크를 최대}}\text{로 만든다}(\text{mc.5.2})
$$

$$
\text{\textbf{농형은 회전자가 닫혀 있어} 저항을 못 넣는다}
$$

$$
\boxed{\text{\textbf{농형에서 비례추이 효과를 내려면?}}}
$$

$$
\text{\textbf{도체 모양}}\text{으로 저항이 \textbf{저절로 변하게} 만든다}
$$

**발상이 훌륭하다.** 밖에서 저항을 넣을 수 없으니, **저항이 스스로 변하는 도체**를
만든다.

## 열쇠는 2차 주파수

$$
\boxed{f_2 = s f_1}(\text{mc.5.2})
$$

| 상태 | $s$ | $f_2$ |
|---|---|---|
| **기동** | **1** | **60 Hz** |
| **운전** | 0.03 | **1.8 Hz** |

$$
\text{\textbf{기동 시와 운전 시의 주파수가 30배 차이}}
$$

$$
\text{\textbf{이 차이를 이용한다}}
$$

**주파수가 다르면 표피효과가 다르다.** 그러면 실효 저항이 달라진다.

$$
\text{\textbf{기동}: 고주파} \to \text{표피효과 \textbf{강함}} \to r_2 \text{ \textbf{큼}} \to \text{\textbf{기동토크} } \uparrow
$$
$$
\text{\textbf{운전}: 저주파} \to \text{표피효과 \textbf{없음}} \to r_2 \text{ \textbf{작음}} \to \text{\textbf{효율} } \uparrow
$$

$$
\boxed{\text{\textbf{기동 때만 저항이 커진다}} \;-\; \text{딱 원하던 것}}
$$

**권선형에서 사람이 손으로 저항을 넣었다 뺐다 하던 일**을, 물리가 저절로 해준다.

$$
\text{\textbf{권선형: 수동}} \qquad / \qquad \text{\textbf{특수 농형: 자동}}
$$

## 디프슬롯형 농형유도전동기

$$
\boxed{\text{\textbf{도체를 깊고 얇게}} \;-\; \text{세로로 긴 막대}}
$$

### 원리 — 표피효과

$$
\text{\textbf{누설자속}}\text{이 슬롯을 가로지른다}
$$

$$
\text{\textbf{도체 아래쪽}}(\text{철심 깊숙이}) \;\Longrightarrow\; \text{누설자속이 \textbf{많이} 쇄교} \;\Longrightarrow\; \text{\textbf{리액턴스 큼}}
$$
$$
\text{\textbf{도체 위쪽}}(\text{공극 가까이}) \;\Longrightarrow\; \text{누설자속이 \textbf{적게}} \;\Longrightarrow\; \text{\textbf{리액턴스 작음}}
$$

$$
\text{\textbf{기동}}(f_2 = 60\ \mathrm{Hz}) \;\Longrightarrow\; x = 2\pi f L \text{ 이 \textbf{크다}} \;\Longrightarrow\; \text{전류가 \textbf{리액턴스가 작은 위쪽}으로}
$$

$$
\text{\textbf{도체의 일부만} 쓴다} \;\Longrightarrow\; \text{실효 단면적} \downarrow \;\Longrightarrow\; \boxed{r_2 \uparrow}
$$

$$
\text{\textbf{운전}}(f_2 = 2\ \mathrm{Hz}) \;\Longrightarrow\; x \approx 0 \;\Longrightarrow\; \text{전류가 \textbf{고르게}} \;\Longrightarrow\; \boxed{r_2 \downarrow}
$$

**em.7.7의 표피효과**가 그대로다. 주파수가 높으면 전류가 표면으로 몰린다.

$$
R = \rho\dfrac{l}{A} \;\Longrightarrow\; A \downarrow \;\Longrightarrow\; R \uparrow
$$

$$
\text{\textbf{쓰는 단면적이 줄어드니 저항이 커진다}}
$$

### 왜 깊어야 하나

$$
\text{깊이 차이가 커야} \;\Longrightarrow\; \text{리액턴스 차이가 커야} \;\Longrightarrow\; \text{효과가 크다}
$$

$$
\text{\textbf{얕고 넓은 슬롯은 효과가 없다}} \;-\; \text{위아래 차이가 없으니}
$$

| 장점 | 단점 |
|---|---|
| **기동토크 개선** | 2중 농형보다 효과 작음 |
| **기동전류 감소** | 누설 리액턴스 큼 → **역률 나쁨** |
| **구조 단순** (일반 농형과 비슷) | 최대토크 감소 |

$$
\text{\textbf{누설이 커진 대가}} \;-\; \text{역률과 최대토크를 낸다}
$$

## 2중 농형유도전동기

$$
\boxed{\text{\textbf{도체를 두 겹}}\text{으로}}
$$

| 도체 | 위치 | 재료 | 저항 | 리액턴스 |
|---|---|---|---|---|
| **바깥 도체** | **공극 쪽** | **황동 · 동니켈**(고저항) | **크다** | **작다** |
| **안쪽 도체** | **철심 깊이** | **구리**(저저항) | **작다** | **크다** |

$$
\boxed{\text{\textbf{바깥이 고저항}}} \;-\; \text{헷갈리면 안 된다}
$$

### 기동 시

$$
f_2 = 60\ \mathrm{Hz} \;\Longrightarrow\; \text{안쪽 도체의 \textbf{리액턴스가 커서} 전류가 못 들어감}
$$

$$
\Longrightarrow \text{전류가 \textbf{바깥 도체}}(\text{고저항})\text{로} \;\Longrightarrow\; r_2 \text{ 큼} \;\Longrightarrow\; \text{\textbf{기동토크 큼}}
$$

$$
\text{\textbf{바깥이 기동을 맡는다}} \;-\; \text{그래서 \textbf{기동도체}}
$$

### 운전 시

$$
f_2 \approx 2\ \mathrm{Hz} \;\Longrightarrow\; \text{리액턴스 거의 0} \;\Longrightarrow\; \text{전류가 \textbf{저항이 작은 안쪽}으로}
$$

$$
\Longrightarrow r_2 \text{ 작음} \;\Longrightarrow\; \text{\textbf{효율 좋음 ・ 슬립 작음}}
$$

$$
\text{\textbf{안쪽이 운전을 맡는다}} \;-\; \text{\textbf{운전도체}}
$$

### 왜 재료가 다른가

$$
\text{\textbf{바깥은 저항이 커야}} \;\Longrightarrow\; \text{\textbf{황동}}(\text{구리보다 저항이 큼})
$$
$$
\text{\textbf{안쪽은 저항이 작아야}} \;\Longrightarrow\; \text{\textbf{구리}}
$$

**모양뿐 아니라 재료로도 차이를 만든다.** 디프슬롯보다 한 수 위다.

$$
\text{\textbf{디프슬롯: 모양만}} \qquad / \qquad \text{\textbf{2중 농형: 모양 + 재료}}
$$

| 장점 | 단점 |
|---|---|
| **기동토크 크다** (디프슬롯보다) | **구조 복잡 · 비싸다** |
| **기동전류 작다** | **누설 리액턴스 큼** → 역률·최대토크 나쁨 |
| **효율 좋다** (운전 시) | 방열 나쁨 |

$$
\text{\textbf{보통 농형과 권선형의 중간}}
$$

## 셋을 나란히

| | **보통 농형** | **디프슬롯** | **2중 농형** | **권선형** |
|---|---|---|---|---|
| **기동토크** | 작다 | 중간 | **크다** | **최대** |
| **기동전류** | **크다** | 중간 | 작다 | **작다** |
| **효율** | **좋다** | 중간 | 좋다 | 중간 |
| **역률** | **좋다** | 나쁨 | **나쁨** | 중간 |
| **최대토크** | **크다** | 중간 | 작다 | 크다 |
| **값** | **싸다** | 중간 | 비쌈 | **비쌈** |
| **속도제어** | X | X | X | **O** |

$$
\boxed{\text{\textbf{특수 농형은 기동만} 개선한다} \;-\; \text{속도 제어는 여전히 안 됨}}
$$

**권선형과 결정적으로 다른 점**이다. 2차를 못 뽑으니 저항 제어도 여자 제어도 안 된다.

$$
\text{\textbf{기동토크를 사고 역률・최대토크를 팔았다}}
$$

**누설 리액턴스가 커진 게 대가**다. 표피효과를 쓰려면 누설자속이 필요한데, 그게
$x_2$ 를 키워 역률과 최대토크를 깎는다.

$$
T_{max} = \dfrac{E_2^2}{2(x_1+x_2)} \;\Longrightarrow\; x_2 \uparrow \;\Longrightarrow\; T_{max} \downarrow \quad(\text{mc.5.2})
$$

$$
\text{\textbf{공짜가 없다}} \;-\; \text{전기기기의 일관된 교훈}
$$

## 요즘은

$$
\text{\textbf{인버터}}\text{가 있으면 보통 농형으로 충분}(\text{mc.5.4})
$$

$$
\text{\textbf{저주파로 기동}}\text{하면} \;\Longrightarrow\; \text{슬립이 작아도 큰 토크} \;\Longrightarrow\; \text{기동전류 문제 자체가 사라짐}
$$

**인버터는 주파수를 낮춰서 기동**한다. $5\ \mathrm{Hz}$ 로 시작하면 회전자계가 느리니
처음부터 슬립이 작고, 전류도 안 튄다.

$$
\text{\textbf{기동 문제를 우회한다}} \;-\; \text{특수 농형도 감압 기동도 필요 없어진다}
$$

$$
\text{\textbf{또 인버터가 이겼다}}
$$

**mc.1.1의 정류자, mc.5.1의 권선형에 이어** 세 번째다. 반도체가 기계적 궁리를
차례로 지운다.

## 정리

$$
\boxed{f_2 = sf_1 \;-\; \text{\textbf{기동 60Hz, 운전 2Hz}}}
$$

$$
\text{고주파} \to \text{\textbf{표피효과}} \to r_2 \uparrow \to \text{기동토크} \uparrow
$$
$$
\text{저주파} \to \text{표피효과 없음} \to r_2 \downarrow \to \text{효율} \uparrow
$$

| | 바깥(공극 쪽) | 안쪽(철심 깊이) |
|---|---|---|
| **저항** | **크다** (황동) | **작다** (구리) |
| **리액턴스** | **작다** | **크다** |
| **언제 일하나** | **기동** | **운전** |

$$
\boxed{\text{\textbf{권선형이 손으로 하던 일을 물리가 저절로}}}
$$
