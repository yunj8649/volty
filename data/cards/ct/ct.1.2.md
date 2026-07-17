---
id: ct.1.2
title: 직류회로
status: reviewed
summary: 키르히호프 두 법칙이면 어떤 회로든 풀린다. 나머지는 계산을 줄이는 요령이다.
covers:
  - ct.1.2.1
  - ct.1.2.2
  - ct.1.2.3
  - ct.1.2.4
  - ct.1.2.5
  - ct.1.2.6
  - ct.1.2.7
formulas:
  - label: 옴의 법칙
    tex: V = IR, \qquad R = \rho\dfrac{l}{A}\ \mathrm{[\Omega]}
    note: '$\rho$ 고유저항, $l$ 길이, $A$ 단면적.'
  - label: 온도에 의한 저항
    tex: R_T = R_t\{1 + \alpha_t(T - t)\}
    note: 구리는 $\alpha_{20} = \frac{1}{234.5+20}$. mc.1.10의 저항법이 이걸 쓴다.
  - label: 키르히호프
    tex: \sum I = 0 \;(\text{\textbf{KCL}}), \qquad \sum V = 0 \;(\text{\textbf{KVL}})
    note: '**전하 보존**과 **에너지 보존**. 이 둘이면 다 풀린다.'
  - label: 배율기와 분류기
    tex: m = 1 + \dfrac{R_m}{r_v} \;(\text{\textbf{배율기}}), \qquad m = 1 + \dfrac{r_a}{R_s} \;(\text{\textbf{분류기}})
    note: '**배율기는 직렬(전압계), 분류기는 병렬(전류계)**. 분모가 뒤집힌다.'
  - label: 최대 전력 전달
    tex: R_L = R_{th} \;\Longrightarrow\; P_{max} = \dfrac{V_{th}^2}{4R_{th}}
    note: 효율은 **50%**뿐이다. 전력 계통에서는 안 쓴다.
traps:
  - '**배율기는 직렬, 분류기는 병렬**이다. 배율 식의 분모가 서로 뒤집힌 꼴이라 헷갈린다.'
  - '**최대 전력 전달 시 효율은 50%**다. 통신에서는 쓰지만 전력 계통에서는 절대 안 쓴다.'
  - '**중첩의 정리에서 종속전원은 죽이면 안 된다.** 독립전원만 죽인다.'
  - '**전압원을 죽이면 단락, 전류원을 죽이면 개방**이다. 반대로 하면 틀린다.'
related:
  - ct.1.1
  - em.4.4
  - ct.1.7
---

## 전류 및 옴의 법칙

$$
\boxed{V = IR}
$$

$$
\text{\textbf{저항이 전류를 막는 정도}}
$$

$$
G = \dfrac{1}{R}\ \mathrm{[S]} \;-\; \text{\textbf{컨덕턴스}}, \qquad I = GV
$$

**병렬 회로에서는 컨덕턴스가 편하다.** 그냥 더하면 되니까.

## 도체의 고유저항 및 온도에 의한 저항

$$
\boxed{R = \rho\dfrac{l}{A}\ \mathrm{[\Omega]}}
$$

$$
\text{\textbf{길면 크고 굵으면 작다}} \;-\; \text{직관 그대로}
$$

$$
\rho = \dfrac{1}{\sigma} \;-\; \text{\textbf{고유저항}}\text{과 \textbf{도전율}}\text{은 역수}
$$

| 재료 | $\rho\ [\Omega \cdot \mathrm{m}]$ | 도전율 (구리 기준) |
|---|---|---|
| **은** | $1.62 \times 10^{-8}$ | **106%** |
| **구리** | $1.72 \times 10^{-8}$ | **100%** (기준) |
| **알루미늄** | $2.83 \times 10^{-8}$ | **61%** |

$$
\text{\textbf{은이 제일 좋은데 비싸서} 구리를 쓴다}
$$

$$
\textbf{알루미늄은 도전율이 61} \%\text{인데 \textbf{가볍다}}(\text{비중 } 2.7 \text{ vs } 8.9)
$$

**pw.2.1의 ACSR**이 알루미늄인 이유다. 같은 저항을 내려면 굵어야 하지만, **무게로는
이득**이다. 송전선은 자기 무게를 견뎌야 하니 가벼운 게 중요하다.

$$
\text{\textbf{도전율은 낮은데 실용에서 이긴다}} \;-\; \text{조건이 다르면 답도 다르다}
$$

### 온도에 의한 저항

$$
\boxed{R_T = R_t\{1 + \alpha_t(T - t)\}}
$$

$$
\text{\textbf{금속은 온도가 오르면 저항이 커진다}}
$$

$$
\alpha_{20} = \dfrac{1}{234.5 + 20} \approx 0.00393 \quad(\text{구리})
$$

$$
\boxed{\text{\textbf{234.5}} \;-\; \text{구리의 \textbf{저항 영도}}}
$$

$$
-234.5°\mathrm{C} \text{ 로 외삽하면 저항이 \textbf{0}} \;-\; \text{실제로는 그전에 초전도가 되거나}
$$

$$
\alpha_t = \dfrac{1}{234.5 + t} \;-\; \textbf{기준 온도에 따라 } \alpha \text{ 가 변한다}
$$

**em.4.4에서 본 그것**이다. 그리고 **mc.1.10·mc.5.8의 저항법**이 이 관계로 권선
온도를 잰다.

$$
T = \dfrac{R_T - R_t}{\alpha_t R_t} + t \;-\; \text{\textbf{저항을 재면 온도가 나온다}}
$$

**반도체는 반대**다. 온도가 오르면 저항이 **준다**($\alpha < 0$). 캐리어가 늘어나기
때문이다.

$$
\textbf{금속: } \alpha \text{ > 0} \qquad / \qquad \textbf{반도체・탄소: } \alpha \text{ < 0}
$$

**mc.1.1의 탄소 브러시**가 접촉저항이 큰 것도 이와 관련이 있다.

## 저항의 접속

$$
\text{\textbf{직렬}}: R = R_1 + R_2 + \cdots \qquad \text{\textbf{병렬}}: \dfrac{1}{R} = \dfrac{1}{R_1} + \dfrac{1}{R_2} + \cdots
$$

$$
\text{\textbf{두 개 병렬}}: R = \dfrac{R_1R_2}{R_1 + R_2} \;-\; \text{"곱분의 합"}
$$

### 분압과 분류

$$
\boxed{\text{\textbf{분압}}: V_1 = V\dfrac{R_1}{R_1+R_2} \qquad \text{\textbf{분류}}: I_1 = I\dfrac{R_2}{R_1+R_2}}
$$

$$
\text{\textbf{분압은 자기 것, 분류는 상대 것}}\text{이 분자}
$$

$$
\text{\textbf{직렬은 큰 저항에 큰 전압}}, \qquad \text{\textbf{병렬은 작은 저항에 큰 전류}}
$$

**분류 공식의 분자가 상대 저항**인 게 헷갈린다. 물이 **저항이 작은 쪽으로 더 많이**
흐른다고 생각하면 된다.

### Y-Δ 변환

$$
\textbf{Y} \to \Delta: R_{ab} = \dfrac{R_aR_b + R_bR_c + R_cR_a}{R_c}
$$

$$
\Delta \to \text{\textbf{Y}}: R_a = \dfrac{R_{ab}R_{ca}}{R_{ab}+R_{bc}+R_{ca}}
$$

$$
\text{\textbf{평형이면 간단}}: R_\Delta = 3R_Y \;\Longrightarrow\; R_Y = \dfrac{R_\Delta}{3}
$$

$$
\boxed{\Delta \text{ 가 } 3 \text{ 배}}
$$

**mc.5.3의 Y-$\Delta$ 기동**에서 전류가 $\frac{1}{3}$ 이 된 이유다. 임피던스가
3배로 보이니 전류가 $\frac{1}{3}$ 이다.

$$
\text{\textbf{휘트스톤 브리지}}\text{나 복잡한 회로를 풀 때 쓴다}
$$

## 키르히호프의 법칙

$$
\boxed{\sum I = 0 \;(\text{\textbf{KCL}}) \qquad \sum V = 0 \;(\text{\textbf{KVL}})}
$$

| 법칙 | 뿌리 |
|---|---|
| **KCL** (전류 법칙) | **전하 보존** |
| **KVL** (전압 법칙) | **에너지 보존** |

$$
\text{\textbf{보존 법칙 두 개}} \;-\; \text{그게 전부다}
$$

### KCL

$$
\text{\textbf{마디로 들어온 전류의 합 = 나간 전류의 합}}
$$

$$
\text{\textbf{전하가 마디에 쌓이지 않는다}}\text{는 뜻}
$$

$$
\text{\textbf{집중정수 근사}}(\text{ct.1.1})\text{의 결과} \;-\; \text{마디에 정전용량이 없다고 치니}
$$

### KVL

$$
\text{\textbf{닫힌 경로를 한 바퀴 돌면 전압의 합이 0}}
$$

$$
\text{\textbf{제자리로 돌아왔으니 전위차가 0}} \;-\; \text{당연한 얘기}
$$

$$
\text{\textbf{산을 한 바퀴 돌아 제자리로 오면 고도 변화가 0}}
$$

**전자기학의 $\oint \vec{E} \cdot d\vec{l} = 0$**(정전계)과 같은 말이다. 다만 유도
기전력이 있으면 그쪽으로 옮겨서 처리한다.

$$
\text{\textbf{두 법칙이면 어떤 회로든 풀린다}} \;-\; \text{나머지는 \textbf{계산을 줄이는 요령}}
$$

## 전지의 접속 및 줄열과 전력

### 전지의 접속

$$
\text{\textbf{직렬 } n \text{ 개}}: E = nE_0, \quad r = nr_0 \;\Longrightarrow\; I = \dfrac{nE_0}{R + nr_0}
$$

$$
\text{\textbf{병렬 } m \text{ 개}}: E = E_0, \quad r = \dfrac{r_0}{m} \;\Longrightarrow\; I = \dfrac{E_0}{R + \frac{r_0}{m}}
$$

$$
\text{\textbf{직렬 } n \text{ 개, 병렬 } m \text{ 개}}: I = \dfrac{nE_0}{R + \frac{n r_0}{m}}
$$

$$
\text{\textbf{직렬은 전압을, 병렬은 전류를}} \;-\; \text{용량을 늘리는 두 방향}
$$

### 줄열과 전력

$$
P = VI = I^2R = \dfrac{V^2}{R}\ \mathrm{[W]}
$$

$$
W = Pt\ \mathrm{[J]} = 0.24\,Pt\ \mathrm{[cal]}
$$

$$
\boxed{1\ \mathrm{J} = 0.24\ \mathrm{cal}, \qquad 1\ \mathrm{cal} = 4.2\ \mathrm{J}}
$$

$$
1\ \mathrm{kWh} = 860\ \mathrm{kcal}
$$

$$
\text{\textbf{860}} \;-\; \text{계산 문제에 자주}
$$

### 어느 식을 쓰나

$$
\text{\textbf{직렬}}\text{이면 전류가 같으니} \;\Longrightarrow\; P = I^2R \;\Longrightarrow\; \text{\textbf{큰 저항이 더 뜨겁다}}
$$

$$
\text{\textbf{병렬}}\text{이면 전압이 같으니} \;\Longrightarrow\; P = \dfrac{V^2}{R} \;\Longrightarrow\; \text{\textbf{작은 저항이 더 뜨겁다}}
$$

$$
\boxed{\text{\textbf{결선에 따라 정반대}}}
$$

**시험 단골**이다. 같은 두 저항인데 직렬이냐 병렬이냐로 답이 뒤집힌다.

$$
\text{\textbf{무엇이 같은지}}\text{부터 보고 식을 고른다}
$$

## 배율기와 분류기

$$
\boxed{\text{\textbf{배율기}}: \text{전압계에 \textbf{직렬}} \qquad \text{\textbf{분류기}}: \text{전류계에 \textbf{병렬}}}
$$

### 배율기 (전압계)

$$
\boxed{m = 1 + \dfrac{R_m}{r_v}}
$$

$$
R_m = (m-1)\,r_v
$$

$$
\text{\textbf{전압을 나눠 갖게}} \;\Longrightarrow\; \text{\textbf{직렬}}
$$

$$
\text{전압계는 \textbf{내부저항이 커야}} \;-\; \text{회로에 영향을 안 주려고}
$$

### 분류기 (전류계)

$$
\boxed{m = 1 + \dfrac{r_a}{R_s}}
$$

$$
R_s = \dfrac{r_a}{m-1}
$$

$$
\text{\textbf{전류를 나눠 흐르게}} \;\Longrightarrow\; \text{\textbf{병렬}}
$$

$$
\text{전류계는 \textbf{내부저항이 작아야}} \;-\; \text{회로에 영향을 안 주려고}
$$

### 왜 분모가 뒤집히나

$$
\text{\textbf{배율기}}: \dfrac{R_m}{r_v} \qquad / \qquad \text{\textbf{분류기}}: \dfrac{r_a}{R_s}
$$

$$
\text{\textbf{배율기는 외부 저항이 분자}}, \qquad \text{\textbf{분류기는 계기 저항이 분자}}
$$

$$
\text{\textbf{배율기}}: \text{전압이 } R_m \text{ 과 } r_v \text{ 에 \textbf{비례 배분}} \;\Longrightarrow\; \text{$R_m$ 이 클수록 배율 큼}
$$

$$
\text{\textbf{분류기}}: \text{전류가 저항에 \textbf{반비례 배분}} \;\Longrightarrow\; \text{$R_s$ 가 \textbf{작을수록} 배율 큼}
$$

$$
\boxed{\text{\textbf{배분 방식이 반대라 식도 뒤집힌다}}}
$$

**외우지 말고 유도하는 게 낫다.** 배율기는 분압, 분류기는 분류다.

$$
\text{\textbf{mc.4.10의 PT ・ CT}}\text{와 같은 목적} \;-\; \text{계기의 범위를 넓힌다}
$$

$$
\text{저압・소전류는 \textbf{배율기・분류기}}, \qquad \text{고압・대전류는 \textbf{PT・CT}}
$$

## 회로망 해석

### 중첩의 정리

$$
\boxed{\text{\textbf{전원 하나씩만} 살리고 나머지는 죽인다} \;\Longrightarrow\; \text{답을 \textbf{더한다}}}
$$

| 죽이는 법 | |
|---|---|
| **전압원** | **단락** ($V=0$ 이니 도선) |
| **전류원** | **개방** ($I=0$ 이니 끊음) |

$$
\boxed{\text{\textbf{전압원 → 단락, 전류원 → 개방}}}
$$

$$
\text{\textbf{반대로 하면 틀린다}} \;-\; \text{시험 단골}
$$

**이유가 명확하다.** 전압원을 죽인다는 건 $V=0$ 으로 만드는 것이고, 전압이 0인 소자는
**도선**이다. 전류원을 죽이면 $I=0$ 이니 **끊어진 것**과 같다.

### 종속전원은 죽이지 않는다

$$
\boxed{\text{\textbf{독립전원만} 죽인다}}
$$

$$
\text{종속전원은 \textbf{다른 곳의 값에 따라} 변하니} \;\Longrightarrow\; \text{\textbf{회로의 일부}}\text{다}
$$

$$
\text{\textbf{죽이면 회로가 달라진다}}
$$

**시험 함정**이다. 종속전원이 있는 회로에서 중첩을 쓸 때 실수하기 쉽다.

$$
\text{\textbf{선형 회로에만 성립}} \;-\; \text{전력은 중첩이 \textbf{안 된다}}(P \propto I^2 \text{ 이라 비선형})
$$

**전력을 중첩으로 구하면 틀린다.** 전류를 중첩으로 구한 뒤 그걸 제곱해야 한다.

### 테브난·노턴 등가

$$
\boxed{\text{\textbf{복잡한 회로}} \to \text{\textbf{전원 하나 + 저항 하나}}}
$$

| 등가 | 구성 |
|---|---|
| **테브난** | $V_{th}$ + **직렬** $R_{th}$ |
| **노턴** | $I_N$ + **병렬** $R_N$ |

$$
V_{th} = \text{\textbf{개방 전압}}, \qquad I_N = \text{\textbf{단락 전류}}, \qquad R_{th} = R_N = \dfrac{V_{th}}{I_N}
$$

$$
R_{th} \text{ 구하는 법}: \text{\textbf{모든 독립전원을 죽이고}} \text{ 단자에서 본 저항}
$$

$$
\text{\textbf{부하만 바꿔가며 볼 때}} \;\Longrightarrow\; \text{\textbf{한 번 등가를 구해 놓으면} 끝}
$$

**pw.3.4의 %임피던스법**이 계통을 테브난 등가로 보는 것이다. 사고점에서 본 등가
임피던스가 단락전류를 정한다.

### 최대 전력 전달

$$
\boxed{R_L = R_{th} \;\Longrightarrow\; P_{max} = \dfrac{V_{th}^2}{4R_{th}}}
$$

$$
\text{\textbf{부하가 내부저항과 같을 때}} \text{ 최대 전력}
$$

$$
\boxed{\textbf{그때 효율은 } \text{ 50} \%}
$$

$$
\text{\textbf{절반이 내부저항에서 열}}\text{이 된다}
$$

$$
\text{\textbf{전력 계통에서는 절대 안 쓴다}} \;-\; \text{효율 50} \% \text{면 파산}
$$

$$
\text{계통은 } R_L \ggg R_{th} \;\Longrightarrow\; \text{\textbf{효율 우선}}
$$

**pw.2.1의 송전 손실**을 그렇게 줄이려 애쓰는데, 최대 전력 전달은 정반대다.

$$
\text{\textbf{통신・오디오}}\text{에서는 쓴다} \;-\; \text{전력이 작아 효율보다 \textbf{신호}}\text{가 중요}
$$

$$
\boxed{\text{\textbf{목적이 다르면 최적도 다르다}}}
$$

**mc.4.1의 임피던스 정합**이 그 이야기다. 앰프와 스피커는 최대 전력 전달을 노린다.

### 그 밖의 정리

| 정리 | |
|---|---|
| **밀만의 정리** | 병렬 전압원들의 합성 |
| **가역(상반) 정리** | 전원과 계기를 바꿔도 같다 |
| **보상 정리** | 임피던스 변화의 영향 |

$$
\text{\textbf{밀만}}: V = \dfrac{\sum \frac{V_k}{R_k}}{\sum \frac{1}{R_k}} = \dfrac{\sum V_kG_k}{\sum G_k}
$$

$$
\text{\textbf{병렬 전압원이 여럿}}\text{일 때 한 방에}
$$

## 정리

$$
\boxed{\sum I = 0, \quad \sum V = 0 \;-\; \text{\textbf{이 둘이면 다 풀린다}}}
$$

| 요령 | 언제 |
|---|---|
| **중첩** | 전원이 여럿 (**종속전원은 안 죽임**) |
| **테브난·노턴** | 부하만 바꿔볼 때 |
| **Y-$\Delta$** | 브리지 · 3상 |
| **밀만** | 병렬 전압원 |

$$
\boxed{\text{\textbf{전압원 → 단락, 전류원 → 개방}}}
$$

$$
\boxed{\text{\textbf{배율기 직렬}}(m = 1 + \tfrac{R_m}{r_v}), \quad \text{\textbf{분류기 병렬}}(m = 1 + \tfrac{r_a}{R_s})}
$$

$$
\textbf{최대 전력 전달의 효율은 } \text{ 50} \% \;-\; \text{계통에서는 안 쓴다}
$$
