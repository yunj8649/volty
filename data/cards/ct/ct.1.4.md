---
id: ct.1.4
title: 비정현파교류
status: reviewed
summary: 어떤 주기파든 정현파의 합이다. 그러면 각 성분마다 페이저를 쓰고 나중에 더하면 된다.
covers:
  - ct.1.4.1
  - ct.1.4.2
  - ct.1.4.3
  - ct.1.4.4
  - ct.1.4.5
formulas:
  - label: 푸리에 급수
    tex: f(t) = a_0 + \sum_{n=1}^{\infty}\left(a_n\cos n\omega t + b_n \sin n\omega t\right)
    note: '**직류분 + 기본파 + 고조파**. 어떤 주기파든 이렇게 쪼개진다.'
  - label: 비정현파의 실효값
    tex: V = \sqrt{V_0^2 + V_1^2 + V_2^2 + \cdots}
    note: '**각 성분의 제곱합의 제곱근**. 직교하니 그냥 더한다.'
  - label: 비정현파의 전력
    tex: P = V_0I_0 + \sum_{n=1}^{\infty} V_nI_n\cos\theta_n
    note: '**같은 차수끼리만** 전력을 만든다. 다른 차수는 0.'
  - label: 왜형률
    tex: \text{THD} = \dfrac{\sqrt{V_2^2+V_3^2+\cdots}}{V_1} \times 100
    note: 기본파 대비 고조파의 비율. pw.7.3의 그 지표.
  - label: n차 임피던스
    tex: Z_n = R + j\left(n\omega L - \dfrac{1}{n\omega C}\right)
    note: '**L은 n배, C는 1/n배**. 고조파에서 L이 커지고 C가 작아진다.'
traps:
  - '**비정현파의 실효값은 각 성분 제곱합의 제곱근**이다. 그냥 더하면 안 된다.'
  - '**전력은 같은 차수끼리만** 생긴다. 3차 전압과 5차 전류는 전력을 못 만든다.'
  - '**고조파에서 L은 n배, C는 1/n배**다. 그래서 고조파는 콘덴서로 몰린다(pw.7.3).'
  - '**반파대칭이면 짝수 고조파가 없다.** 정현대칭·여현대칭과 헷갈리면 안 된다.'
related:
  - ct.1.3
  - pw.7.3
  - mc.5.6
---

## 비정현파의 푸리에급수에 의한 전개

$$
\boxed{\text{\textbf{어떤 주기파든 정현파의 합}}}
$$

$$
f(t) = \underbrace{a_0}_{\text{\textbf{직류분}}} + \underbrace{a_1\cos\omega t + b_1\sin\omega t}_{\text{\textbf{기본파}}} + \underbrace{\sum_{n=2}^{\infty}(a_n\cos n\omega t + b_n\sin n\omega t)}_{\text{\textbf{고조파}}}
$$

$$
\text{\textbf{직류분 + 기본파 + 고조파}}
$$

### 왜 이게 값어치가 있나

$$
\text{\textbf{페이저는 정현파에만}} \text{ 쓸 수 있다}(\text{ct.1.3})
$$

$$
\boxed{\text{\textbf{쪼개면 각 성분마다 페이저를 쓸 수 있다}}}
$$

$$
\text{각 차수를 \textbf{따로 풀고}} \;\Longrightarrow\; \text{\textbf{나중에 더한다}}(\text{중첩의 정리}, \text{ct.1.2})
$$

$$
\text{\textbf{선형 회로라서} 가능} \;-\; \text{중첩이 성립하니}
$$

**이게 푸리에가 회로이론에 들어온 이유**다. 못 다루던 파형을 다룰 수 있게 된다.

## 푸리에급수의 계수

$$
a_0 = \dfrac{1}{T}\int_0^T f(t)\,dt \;-\; \text{\textbf{한 주기 평균}} = \text{\textbf{직류분}}
$$

$$
a_n = \dfrac{2}{T}\int_0^T f(t)\cos n\omega t \, dt
$$

$$
b_n = \dfrac{2}{T}\int_0^T f(t)\sin n\omega t \, dt
$$

### 왜 이렇게 뽑히나

$$
\boxed{\text{\textbf{직교성}}}
$$

$$
\int_0^T \sin n\omega t \cdot \sin m\omega t \, dt = 0 \quad(n \neq m)
$$

$$
\int_0^T \sin n\omega t \cdot \cos m\omega t \, dt = 0 \quad(\text{\textbf{항상}})
$$

$$
\text{\textbf{다른 차수를 곱해 적분하면 0}} \;\Longrightarrow\; \text{\textbf{원하는 것만 남는다}}
$$

$$
\text{\textbf{체로 거르는 것}}\text{과 같다} \;-\; n \text{ 차를 곱하면 } n \text{ 차만 걸린다}
$$

**직교성이 푸리에의 핵심**이다. 이게 없으면 계수를 못 뽑는다.

$$
\text{\textbf{실효값과 전력이 그냥 더해지는 것}}\text{도 직교성 때문}
$$

## 비정현파의 대칭

$$
\text{\textbf{대칭을 보면 계산이 확 준다}}
$$

| 대칭 | 조건 | 없는 항 |
|---|---|---|
| **정현대칭**(기함수) | $f(-t) = -f(t)$ | **$a_0$, $a_n$** (여현항 없음) |
| **여현대칭**(우함수) | $f(-t) = f(t)$ | **$b_n$** (정현항 없음) |
| **반파대칭** | $f(t + \frac{T}{2}) = -f(t)$ | **$a_0$, 짝수 고조파** |

$$
\boxed{\text{\textbf{정현대칭 → sin만, 여현대칭 → cos만, 반파대칭 → 홀수만}}}
$$

### 정현대칭 (기함수)

$$
f(-t) = -f(t) \;-\; \text{\textbf{원점 대칭}}
$$

$$
\sin \text{ 이 기함수}\text{니} \;\Longrightarrow\; \boxed{b_n \text{ 만 남는다}}
$$

$$
a_0 = 0, \quad a_n = 0
$$

### 여현대칭 (우함수)

$$
f(-t) = f(t) \;-\; \text{\textbf{y축 대칭}}
$$

$$
\cos \text{ 이 우함수}\text{니} \;\Longrightarrow\; \boxed{a_n \text{ 만 남는다}}
$$

$$
b_n = 0 \;-\; \text{$a_0$ 는 \textbf{있을 수 있다}}
$$

### 반파대칭

$$
f\left(t + \dfrac{T}{2}\right) = -f(t) \;-\; \text{\textbf{반주기 뒤에 부호가 뒤집힘}}
$$

$$
\boxed{\text{\textbf{짝수 고조파가 없다}}} \;-\; a_0 = 0, \; a_{2n} = b_{2n} = 0
$$

$$
\text{\textbf{홀수 고조파만}} \;-\; 1, 3, 5, 7, \cdots
$$

### 왜 짝수가 사라지나

$$
\text{\textbf{짝수 고조파}}\text{는 반주기 뒤에 \textbf{같은 값}}\text{이 된다}
$$

$$
\sin 2\omega\left(t + \dfrac{T}{2}\right) = \sin(2\omega t + 2\pi) = \sin 2\omega t \;-\; \text{\textbf{그대로}}
$$

$$
\text{\textbf{홀수 고조파}}\text{는 \textbf{부호가 뒤집힌다}}
$$

$$
\sin 3\omega\left(t+\dfrac{T}{2}\right) = \sin(3\omega t + 3\pi) = -\sin 3\omega t \;-\; \text{\textbf{반대}}
$$

$$
\boxed{\text{\textbf{반파대칭 조건}}(\text{반주기 뒤 부호 반전})\text{을 만족하는 건 \textbf{홀수}}\text{뿐}}
$$

$$
\text{\textbf{짝수는 조건을 어기니 있을 수 없다}}
$$

**대부분의 실제 파형이 반파대칭**이다. 그래서 **짝수 고조파는 거의 없고 홀수만**
문제가 된다.

$$
\text{pw.7.3에서 \textbf{5・7・11・13차}}\text{만 따진 이유}
$$

$$
\text{mc.2.2에서 \textbf{제5고조파}}\text{부터 잡은 이유}
$$

**교류 파형은 대칭적**이라 짝수가 안 생긴다. 짝수 고조파가 나오면 **뭔가 비대칭인
것**이다(반파 정류, 직류 편자 등).

$$
\text{\textbf{짝수 고조파의 존재가 이상 신호}}
$$

## 비정현파의 실효값

$$
\boxed{V = \sqrt{V_0^2 + V_1^2 + V_2^2 + V_3^2 + \cdots}}
$$

$$
\text{\textbf{각 성분 실효값의 제곱합의 제곱근}}
$$

### 왜 제곱해서 더하나

$$
\text{\textbf{직교성}} \;\Longrightarrow\; \text{서로 다른 차수의 곱은 적분하면 0}
$$

$$
\dfrac{1}{T}\int (v_1 + v_2)^2 dt = \dfrac{1}{T}\int (v_1^2 + 2v_1v_2 + v_2^2) dt
$$

$$
= V_1^2 + \underbrace{0}_{\text{\textbf{직교}}} + V_2^2
$$

$$
\boxed{\text{\textbf{교차항이 사라진다}}}
$$

$$
\text{\textbf{피타고라스}}\text{처럼} \;-\; \text{직교하는 것끼리는 제곱해서 더한다}
$$

$$
\textbf{ct.1.3의 } \text{ S = } \sqrt{P^2+Q^2}\text{ 도 같은 구조}
$$

$$
\textbf{mc.4.2의 } \text{ I} _0 \text{ = } \sqrt{I_i^2 + I_\phi^2}\text{ 도}
$$

**직교하는 성분은 어디서나 제곱해서 더한다.** 회로이론 전체를 관통하는 패턴이다.

$$
\text{\textbf{그냥 더하면 틀린다}} \;-\; \text{시험 단골}
$$

### 왜형률

$$
\boxed{\text{THD} = \dfrac{\sqrt{V_2^2 + V_3^2 + \cdots}}{V_1} \times 100\ \mathrm{[\%]}}
$$

$$
\text{\textbf{기본파 대비 고조파}}\text{의 비율}
$$

$$
\text{\textbf{pw.7.3의 그 지표}} \;-\; \text{계통 품질의 척도}
$$

$$
\textbf{정현파면 0} \% \;-\; \text{고조파가 없으니}
$$

## 비정현파의 전력

$$
\boxed{P = V_0I_0 + \sum_{n=1}^{\infty}V_nI_n\cos\theta_n}
$$

$$
\text{\textbf{같은 차수끼리만} 전력을 만든다}
$$

### 왜 같은 차수끼리만인가

$$
\text{\textbf{직교성}} \;-\; \text{또 그것}
$$

$$
\dfrac{1}{T}\int v_3 \cdot i_5 \, dt = 0
$$

$$
\boxed{\text{\textbf{3차 전압과 5차 전류는 전력을 못 만든다}}}
$$

$$
\text{\textbf{같은 주파수여야 평균이 0이 아니다}}
$$

**직관적으로도** 그렇다. 주파수가 다르면 위상이 계속 어긋나서 **평균이 0**이 된다.

$$
\text{\textbf{시험 단골}} \;-\; \text{다른 차수를 곱해 더하면 틀린다}
$$

### 역률

$$
\cos\theta = \dfrac{P}{VI} = \dfrac{P}{\sqrt{\sum V_n^2}\sqrt{\sum I_n^2}}
$$

$$
\text{\textbf{정의는 같은데} 분모가 전체 실효값}
$$

$$
\text{\textbf{고조파가 있으면 역률이 나빠진다}} \;-\; \text{분모만 커지고 분자는 그대로}
$$

$$
\boxed{\text{\textbf{왜형 역률}}} \;-\; \text{고조파 때문에 생기는 역률 저하}
$$

**mc.3.3의 위상제어**가 역률을 망치는 이유가 둘이다. **위상이 뒤지는 것**(변위 역률)과
**파형이 찌그러지는 것**(왜형 역률).

$$
\textbf{전체 역률} \text{ = } \textbf{변위 역률} \times \textbf{왜형 역률}
$$

**콘덴서로는 변위 역률만 고친다.** 왜형 역률은 필터가 필요하다(pw.7.3).

## 비정현파의 임피던스

$$
\boxed{Z_n = R + j\left(n\omega L - \dfrac{1}{n\omega C}\right)}
$$

$$
\textbf{L은 } \text{ n } \text{ 배, C는 } \dfrac{1}{n} \text{ 배}
$$

| 소자 | 기본파 | $n$ 차 고조파 |
|---|---|---|
| **R** | $R$ | **$R$** (그대로) |
| **L** | $\omega L$ | **$n\omega L$** ($n$배) |
| **C** | $\frac{1}{\omega C}$ | **$\frac{1}{n\omega C}$** ($\frac{1}{n}$배) |

$$
\boxed{\text{\textbf{고조파에서 L은 커지고 C는 작아진다}}}
$$

### 그래서 고조파는 콘덴서로 몰린다

$$
\text{\textbf{C의 리액턴스가} } \dfrac{1}{n} \text{ 로 작아짐} \;\Longrightarrow\; \text{\textbf{고조파 전류가 콘덴서로}}
$$

$$
\text{\textbf{pw.7.3에서 콘덴서가 고조파에 시달리는} 이유}
$$

$$
\text{\textbf{역률 개선용 콘덴서가 고조파를 빨아들여} 과열・소손}
$$

$$
\text{\textbf{직렬 리액터}}\text{를 다는 이유}(\text{pw.2.6}) \;-\; L \text{ 을 붙여 } n \text{ 배로 막는다}
$$

$$
\text{\textbf{L은 고조파를 막고 C는 통과시킨다}} \;-\; \text{정반대}
$$

### 고조파 공진

$$
n\omega L = \dfrac{1}{n\omega C} \;\Longrightarrow\; \text{\textbf{n차에서 공진}}
$$

$$
\text{\textbf{하필 계통에 있는 차수}}\text{에서 공진하면} \;\Longrightarrow\; \text{\textbf{전압・전류 폭증}}
$$

$$
\textbf{직렬 리액터를 } \text{ 6} \%\text{로 하는 이유}(\text{pw.2.6})
$$

$$
\text{\textbf{제5고조파에 대해 유도성}}\text{이 되게} \;\Longrightarrow\; \text{공진 회피 + 고조파 억제}
$$

**$4\%$ 면 이론적으로 충분한데 $6\%$ 를 쓴다.** 여유를 둬서 공진을 확실히 피한다.

## 정리

$$
\boxed{f(t) = a_0 + \sum(a_n\cos n\omega t + b_n\sin n\omega t)}
$$

| 대칭 | 남는 것 |
|---|---|
| **정현대칭** (기함수) | **$b_n$** (sin) |
| **여현대칭** (우함수) | **$a_0, a_n$** (cos) |
| **반파대칭** | **홀수 고조파만** |

$$
\boxed{V = \sqrt{\sum V_n^2}, \qquad P = \sum V_nI_n\cos\theta_n}
$$

$$
\boxed{\text{\textbf{직교성}}} \;-\; \text{계수를 뽑고, 실효값을 더하고, 전력을 가르는 \textbf{하나의 원리}}
$$

$$
\textbf{L은 } \text{ n } \text{ 배, C는 } \tfrac{1}{n} \text{ 배} \;\Longrightarrow\; \text{\textbf{고조파는 콘덴서로 몰린다}}
$$
