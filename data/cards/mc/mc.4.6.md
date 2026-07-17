---
id: mc.4.6
title: 변압기의 병렬운전
status: reviewed
summary: 극성·권수비·%Z가 같아야 한다. 용량은 달라도 되고, 3상은 위상변위까지 봐야 한다.
covers:
  - mc.4.6.1
  - mc.4.6.2
formulas:
  - label: 부하 분담
    tex: \dfrac{P_a}{P_b} = \dfrac{P_A}{P_B} \times \dfrac{\%Z_b}{\%Z_a}
    note: '**용량에 비례, %Z에 반비례.** 소문자는 분담, 대문자는 정격.'
  - label: 순환전류 (권수비가 다를 때)
    tex: I_c = \dfrac{E_a - E_b}{Z_a + Z_b}
    note: 무효 순환전류. **과열의 원인**.
  - label: 병렬운전 조건
    tex: \textbf{극성} \text{ ・ } \textbf{권수비} \text{ ・ } \% \textbf{Z} \text{ ・ (} \text{내부저항과 리액턴스의 } \textbf{비} \text{)}
    note: 3상은 **상회전 · 위상변위**까지 여섯.
traps:
  - '**용량은 조건이 아니다.** 달라도 병렬운전이 된다. 부하 분담만 달라진다.'
  - '**부하 분담은 %Z에 반비례**한다. %Z가 작은 쪽이 더 많이 짊어진다.'
  - '**Δ-Y와 Δ-Δ는 병렬운전 불가**다. 30° 위상변위 때문. Δ 개수의 홀짝을 본다.'
  - '**극성이 틀리면 단락**이다. 순환전류 정도가 아니라 사고다.'
related:
  - mc.4.4
  - mc.4.3
  - mc.2.6
---

## 변압기의 병렬운전 조건

$$
\boxed{\textbf{극성} \text{ ・ } \textbf{권수비} \text{ ・ } \% \textbf{Z} \text{ ・ } \textbf{저항과 리액턴스의 비}}
$$

3상이면 둘이 더 붙는다.

$$
\boxed{+ \; \text{\textbf{상회전} ・ \textbf{위상변위}}}
$$

### mc.2.6과 비교하면

| | **동기발전기** | **변압기** |
|---|---|---|
| 크기 | 기전력 크기 | **권수비** |
| 위상 | 기전력 위상 | **위상변위**(결선) |
| — | 주파수 | (전원이 같으니 자동) |
| — | 파형 | |
| 상회전 | O | O |
| — | | **극성** |
| — | | **%Z** |

$$
\text{\textbf{같은 논리}} \;-\; \text{"두 전압이 같아야 순환전류가 안 흐른다"}
$$

**주파수와 파형이 조건에 없는 이유**는 같은 전원에서 받으니 저절로 같기 때문이다.
변압기는 발전기가 아니라 **받아서 넘기는** 기계다.

### %Z를 조건에 넣느냐

$$
\text{교재마다 \textbf{분류가 다르다}}
$$

| 보는 법 | %Z의 자리 |
|---|---|
| **조건에 포함** | "%Z가 같을 것" — 5~6번째 조건 |
| **조건에서 분리** | 조건은 4개, %Z는 **"부하분담 조건"** 으로 따로 |

**엄밀히는 분리하는 쪽이 정확하다.** %Z가 달라도 **병렬운전 자체는 된다** — 순환전류도
안 흐르고 사고도 안 난다. **부하 분담만 불균등**해질 뿐이다.

$$
\text{극성 ・ 상회전이 틀리면 \textbf{사고}} \qquad / \qquad \% \text{Z가 다르면 } \textbf{비효율}
$$

$$
\text{\textbf{성격이 다른 항목}}\text{을 한 목록에 넣은 셈}
$$

**시험에서는 어느 쪽으로 물어도 답할 수 있어야** 한다. 여기서는 %Z를 조건에 포함해
설명하되, **"어기면 무슨 일이 나느냐"** 를 구분해 둔다.

## ① 극성이 같을 것

$$
\boxed{\text{틀리면 \textbf{단락}}}
$$

$$
\text{극성이 반대} \;\Longrightarrow\; \text{두 전압이 \textbf{더해짐}} \;\Longrightarrow\; \text{2배 전압이 권선 임피던스에}
$$

$$
I = \dfrac{2E}{Z_a + Z_b} \;-\; \text{\textbf{엄청난 전류}}
$$

**순환전류 정도가 아니라 사고**다. %Z가 5%라면 정격의 **40배**가 흐른다.

$$
\text{\textbf{가장 먼저 확인}}\text{할 조건}(\text{mc.4.4의 극성 시험})
$$

## ② 권수비가 같을 것

$$
\text{다르면} \;\Longrightarrow\; \text{2차 전압이 달라짐} \;\Longrightarrow\; \text{\textbf{순환전류}}
$$

$$
\boxed{I_c = \dfrac{E_a - E_b}{Z_a + Z_b}}
$$

**mc.2.6의 무효 순환전류와 같은 식**이다. 분모가 두 임피던스의 합인 것도 같다.

$$
\text{부하와 \textbf{무관}}\text{하게 흐른다} \;-\; \text{무부하일 때도 흐른다}
$$

| 결과 | |
|---|---|
| **과열** | 일은 안 하고 열만 |
| **손실 증가** | |
| **용량 감소** | 순환전류만큼 부하를 못 실음 |

$$
\text{\textbf{탭}}\text{으로 권수비를 맞춘다}
$$

**탭 절환기**가 있는 이유 중 하나다. 병렬운전 시 미세 조정을 한다.

## ③ %Z가 같을 것

$$
\boxed{\text{다르면 \textbf{부하 분담이 용량비와 어긋난다}}}
$$

$$
\dfrac{P_a}{P_b} = \dfrac{P_A}{P_B} \times \dfrac{\%Z_b}{\%Z_a}
$$

$$
\textbf{용량에 비례, } \% \textbf{Z에 반비례}
$$

### 왜 %Z에 반비례하나

$$
\text{두 변압기가 \textbf{병렬}} \;\Longrightarrow\; \text{같은 전압을 받음}
$$

$$
\text{전류는 \textbf{임피던스에 반비례}}\text{해서 갈린다}
$$

$$
\%Z \text{ 가 작다} = \text{전압강하가 작다} = \text{\textbf{더 많이 흘려보낸다}}
$$

$$
\boxed{\%Z \text{ 가 \textbf{작은 쪽이 더 많이} 짊어진다}}
$$

**직관적**이다. 저항이 작은 길로 물이 더 많이 흐른다.

### 왜 문제인가

$$
\%Z \text{ 가 다르면} \;\Longrightarrow\; \text{한쪽이 \textbf{먼저 정격에 도달}}
$$

$$
\text{그 순간 \textbf{전체 출력을 더 못 올린다}} \;\Longrightarrow\; \text{다른 쪽 용량이 \textbf{논다}}
$$

**합계 용량을 다 못 쓴다.** 이게 %Z를 맞춰야 하는 이유다.

$$
\textbf{용량이 달라도} \% \text{Z만 같으면} \;\Longrightarrow\; \text{용량비대로 정확히 분담} \;\Longrightarrow\; \textbf{둘 다 100} \% \textbf{ 활용}
$$

### 예

$100\ \mathrm{kVA}$ ($\%Z = 4$) 와 $200\ \mathrm{kVA}$ ($\%Z = 5$) 를 병렬로.

$$
\dfrac{P_a}{P_b} = \dfrac{100}{200} \times \dfrac{5}{4} = \dfrac{500}{800} = \dfrac{5}{8}
$$

$$
\text{A가 5, B가 8의 비율로 짊어진다}
$$

A가 먼저 찬다. A가 $100\ \mathrm{kVA}$ 일 때 B는 $160\ \mathrm{kVA}$ 다.

$$
\text{합계 } 260\ \mathrm{kVA} \;-\; \text{두 대의 정격 합 } 300\ \mathrm{kVA} \text{ 인데 \textbf{40이 논다}}
$$

$$
\% \textbf{Z가 같았다면} \;\Longrightarrow\; 100 : 200 \;\Longrightarrow\; \text{합계 } 300\ \mathrm{kVA} \text{ 전부 활용}
$$

**%Z가 작은 A가 손해를 본다.** 먼저 차서 전체를 묶는다.

## ④ 저항과 리액턴스의 비가 같을 것

$$
\dfrac{r_a}{x_a} = \dfrac{r_b}{x_b}
$$

$$
\text{다르면} \;\Longrightarrow\; \text{두 전류의 \textbf{위상}이 달라짐} \;\Longrightarrow\; \text{벡터합이 산술합보다 작아짐}
$$

$$
\text{\textbf{합성 전류가 각 전류의 합보다 작다}} \;\Longrightarrow\; \text{용량을 다 못 씀}
$$

%Z의 **크기**가 같아도 **각도**가 다르면 손해를 본다. 그래서 크기와 각도를 다 맞추라는
것이다.

$$
\% \textbf{Z를 벡터로 맞춰라} \;-\; \text{③과 ④를 합치면 이 한 줄}
$$

**실무에서는 대체로 만족된다.** 같은 종류·비슷한 용량의 변압기는 $r/x$ 비가 비슷하다.

## ⑤⑥ 3상의 추가 조건

### 상회전이 같을 것

$$
\text{틀리면 \textbf{단락}} \;-\; \text{mc.2.6과 같다}
$$

## 병렬운전 가능한 결선

$$
\boxed{\Delta\text{-Y} \text{ 와 } \Delta\text{-}\Delta \text{ 는 \textbf{병렬 불가}}}
$$

$$
30° \text{ 위상차} \;\Longrightarrow\; \text{큰 순환전류}
$$

**mc.4.4에서 본 그것**이다.

$$
\text{규칙: } \Delta \text{ 의 \textbf{개수}가 양쪽 다 짝수이거나 다 홀수}
$$

| 가능 | 불가능 |
|---|---|
| $\Delta$-$\Delta$ 와 **Y-Y** | $\Delta$-$\Delta$ 와 **$\Delta$-Y** |
| **$\Delta$-Y 와 Y-$\Delta$** | Y-Y 와 **Y-$\Delta$** |
| $\Delta$-$\Delta$ 와 $\Delta$-$\Delta$ | $\Delta$-Y 와 **Y-Y** |

$$
\Delta\text{-}\Delta(2\text{개}) + \text{Y-Y}(0\text{개}) \;\Longrightarrow\; \text{둘 다 \textbf{짝수}} \;\Longrightarrow\; \text{\textbf{가능}}
$$

$$
\Delta\text{-Y}(1\text{개}) + \text{Y-}\Delta(1\text{개}) \;\Longrightarrow\; \text{둘 다 \textbf{홀수}} \;\Longrightarrow\; \text{\textbf{가능}}
$$

$$
\Delta\text{-}\Delta(2\text{개}) + \Delta\text{-Y}(1\text{개}) \;\Longrightarrow\; \text{짝 + 홀} \;\Longrightarrow\; \text{\textbf{불가}}
$$

**Δ의 개수를 세고 홀짝을 보면 된다.** 외울 게 없다.

### V-V는 Δ-Δ와 같은 편

$$
\text{V결선은 } \Delta\text{-}\Delta \text{ 에서 \textbf{한 대를 뺀} 것}(\text{mc.4.4})
$$

$$
\textbf{위상변위가 } \text{ 0° } \; \text{-} \; \Delta \text{ 와 같은 취급}
$$

| 가능 | |
|---|---|
| **V-V 와 V-V** | 둘 다 $0°$ |
| **V-V 와 $\Delta$-$\Delta$** | 둘 다 $0°$ |
| **V-V 와 Y-Y** | 둘 다 $0°$ |

$$
\textbf{V-V 와 } \Delta \text{-Y 는 불가} \;-\; 0° \text{ vs } 30°
$$

## 용량은 조건이 아니다

$$
\boxed{\text{\textbf{달라도 된다}}}
$$

$$
100\ \mathrm{kVA} \text{ 와 } 500\ \mathrm{kVA} \text{ 를 병렬로 돌려도 된다}
$$

$$
\% \text{Z만 같으면 } \textbf{용량비대로} \text{ 정확히 분담}
$$

**mc.2.6의 동기발전기와 같다.** 거기서도 용량은 조건이 아니었다.

$$
\text{\textbf{시험에서 "용량이 같을 것"을 조건에 넣으면 틀린 것}}
$$

**다만 실무에서는 용량비가 너무 크면 피한다.** 보통 **3:1 이내**로 한다. $r/x$ 비가
많이 달라지기 때문이다(④번 조건).

$$
\text{용량이 크게 다르면} \;\Longrightarrow\; r/x \text{ 비가 달라짐} \;\Longrightarrow\; \text{④를 위반}
$$

## 정리

$$
\boxed{\text{극성 ・ 권수비 ・ } \% \text{Z ・ } r/x \text{ 비} \;+\; (\text{3상: 상회전 ・ 위상변위})}
$$

| 조건 | 어기면 |
|---|---|
| **극성** | **단락** (사고) |
| **권수비** | **순환전류** (과열) |
| **%Z** | **부하 분담 불균형** (용량 낭비) |
| $r/x$ 비 | 합성 전류 감소 |
| **상회전** | **단락** (사고) |
| **위상변위** | **순환전류** |

$$
\boxed{\dfrac{P_a}{P_b} = \dfrac{P_A}{P_B} \times \dfrac{\%Z_b}{\%Z_a}}
$$

$$
\textbf{용량에 비례, } \% \textbf{Z에 반비례} \;-\; \text{이 한 줄이 계산 문제의 전부}
$$
