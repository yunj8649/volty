---
id: kec.1.6
title: 피뢰시스템
status: reviewed
summary: 20m 이상이면 대상이고, 직격뢰는 외부가 유도뢰는 내부가 막는다. 60m를 넘으면 옆구리도 막아야 한다.
covers:
  - kec.1.6.1
  - kec.1.6.2
  - kec.1.6.3
formulas:
  - label: 적용범위 (KEC 151.1)
    tex: \text{지상 높이 } \mathbf{20}\ \mathrm{m} \text{ 이상} \;\text{또는}\; \text{낙뢰 보호가 필요한 것}
    note: 전기전자설비가 설치된 건축물·구조물.
  - label: 구성 (KEC 151.2)
    tex: \text{\textbf{외부피뢰시스템}}(\text{직격뢰}) + \text{\textbf{내부피뢰시스템}}(\text{간접뢰・유도뢰})
    note: '**직격은 외부, 유도는 내부**. 막는 대상이 다르다.'
  - label: 측뢰 보호 (KEC 152.1-3)
    tex: \text{지상 높이 } \mathbf{60}\ \mathrm{m} \text{ 초과} \;\Longrightarrow\; \text{측뢰 보호용 수뢰부}
    note: 높으면 **옆구리로도** 벼락이 친다.
  - label: 인하도선 간격 (KEC 152.2)
    tex: \text{Ⅰ・Ⅱ 등급 } \mathbf{10}\ \mathrm{m}, \quad \text{Ⅲ 등급 } \mathbf{15}\ \mathrm{m}, \quad \text{Ⅳ 등급 } \mathbf{20}\ \mathrm{m}
    note: '**2가닥 이상**. 등급이 엄격할수록 촘촘히.'
traps:
  - '**20m 이상이 적용 대상**이고 **60m 초과가 측뢰 보호**다. 두 숫자를 헷갈리면 안 된다.'
  - '**외부는 직격뢰, 내부는 간접뢰·유도뢰**를 막는다.'
  - '**인하도선은 2가닥 이상**이고 간격은 등급별 10/15/20m다.'
  - '**위험물 제조소는 Ⅱ등급 이상**이어야 한다.'
related:
  - kec.1.5
  - pw.4.2
  - mc.7.4
---

> KEC **150** (151 적용범위 및 구성 · 152 외부피뢰시스템 · 153 내부피뢰시스템)
> — 시행 2026. 1. 5. 기준

## 피뢰시스템의 적용범위 및 구성

> KEC **151**

### 적용범위 (151.1)

$$
\boxed{\text{지상 높이 } \mathbf{20}\ \mathrm{m} \text{ 이상}}
$$

$$
\text{또는 \textbf{낙뢰로부터 보호가 필요한}} \text{ 건축물・구조물}
$$

| 대상 | |
|---|---|
| **전기전자설비가 설치된 건축물·구조물** | **20m 이상** 또는 보호 필요 |
| **전기설비·전자설비** | 낙뢰 보호가 필요한 것 |

$$
\text{\textbf{20m}}\text{가 기준} \;-\; \text{대략 \textbf{6~7층}}
$$

$$
\text{\textbf{높으면 벼락을 맞는다}} \;-\; \text{가장 높은 곳으로 떨어지니}
$$

### 구성 (151.2)

$$
\boxed{\text{\textbf{외부피뢰시스템}} + \text{\textbf{내부피뢰시스템}}}
$$

| | 막는 것 | 어떻게 |
|---|---|---|
| **외부** | **직격뢰** | **받아서 땅으로** |
| **내부** | **간접뢰 · 유도뢰** | **전위를 같게 · 서지 억제** |

$$
\boxed{\text{\textbf{직격은 외부, 유도는 내부}}}
$$

$$
\text{\textbf{직격뢰}}: \text{건물에 \textbf{직접} 떨어지는 것}
$$

$$
\text{\textbf{유도뢰}}: \text{옆에 떨어졌는데 \textbf{전자유도}}\text{로 전압이 유기되는 것}
$$

$$
\text{\textbf{em.7.2의 상호 인덕턴스}} \;-\; \text{뇌전류가 만든 자속이 배선에}
$$

$$
\text{\textbf{직격은 드물고 유도는 흔하다}} \;-\; \text{그래서 둘 다 필요}
$$

**pw.4.2의 뇌해**가 이것이다. 거기서 직격뢰·유도뢰·역섬락을 다뤘다.

### 등급 선정 (151.3)

$$
\text{KS C IEC 62305}\text{의 \textbf{피뢰레벨}}\text{에 따라} \;-\; \text{Ⅰ ・ Ⅱ ・ Ⅲ ・ Ⅳ}
$$

$$
\boxed{\text{\textbf{위험물 제조소 등}}\text{은 } \mathbf{Ⅱ} \text{ 등급 이상}}
$$

$$
\text{\textbf{Ⅰ이 가장 엄격}} \;-\; \text{숫자가 작을수록 세다}
$$

$$
\text{\textbf{리스크 관리}}(\text{62305-2})\text{로 정한다} \;-\; \text{뇌격 빈도 × 피해 크기}
$$

## 외부피뢰시스템

> KEC **152**

$$
\boxed{\text{\textbf{수뢰부}} \to \text{\textbf{인하도선}} \to \text{\textbf{접지극}}}
$$

$$
\text{\textbf{받아서 ・ 내리고 ・ 흘린다}}
$$

$$
\text{\textbf{셋이 한 몸}} \;-\; \text{하나라도 끊기면 무용지물}
$$

### 수뢰부시스템 (152.1)

$$
\text{\textbf{벼락을 받는 곳}} \;-\; \text{돌침 ・ 수평도체 ・ 그물망도체}
$$

$$
\text{\textbf{배치}}\text{는 \textbf{보호각법 ・ 회전구체법 ・ 그물망법}}\text{으로}
$$

$$
\text{\textbf{일부러 여기로 떨어지게}} \;-\; \text{피할 수 없으면 유도한다}
$$

### 측뢰 보호 — 60m

$$
\boxed{\text{지상 높이 } \mathbf{60}\ \mathrm{m} \text{ 초과}\text{하면 \textbf{측뢰 보호}}}
$$

$$
\text{\textbf{옆구리로도 벼락이 친다}}
$$

$$
\text{\textbf{20m는 적용 대상, 60m는 측뢰 보호}} \;-\; \text{다른 숫자}
$$

$$
\text{\textbf{시험 함정}}
$$

### 왜 옆으로 치나

$$
\text{\textbf{아주 높은 건물}}\text{은 구름과의 거리가 옆에서도 가깝다}
$$

$$
\text{\textbf{꼭대기만 막으면}} \;\Longrightarrow\; \text{\textbf{중간 높이 측면}}\text{에 떨어질 수 있다}
$$

$$
\text{\textbf{60m 이상 부분}}\text{의 측면을 보호} \;-\; \text{상부 20} \%
$$

**초고층 빌딩의 벼락 사진**을 보면 옆구리에 맞는다. 그게 측뢰다.

### 가연성 재료와의 이격

$$
\text{건축물과 \textbf{분리되지 않은} 수뢰부}
$$

| 지붕 | 이격거리 |
|---|---|
| **초가지붕** 또는 유사 | **0.15 m** 이상 |
| **다른 가연성 재료** | **0.1 m** 이상 |

$$
\text{\textbf{뇌전류가 흐르면 뜨겁다}} \;-\; \text{닿아 있으면 불이 난다}
$$

$$
\text{\textbf{초가가 더 위험}}\text{하니 더 멀리} \;-\; 0.15 > 0.1
$$

### 인하도선시스템 (152.2)

$$
\boxed{\text{\textbf{수뢰부와 접지시스템을 전기적으로 연결}}}
$$

$$
\boxed{\text{\textbf{복수}}\text{의 인하도선을 \textbf{병렬}}\text{로} \;-\; \mathbf{2} \text{ 가닥 이상}}
$$

$$
\text{\textbf{왜 여럿인가}} \;-\; \text{전류를 나눠 흘리고, 하나가 끊겨도 되게}
$$

$$
\text{\textbf{병렬이면 인덕턴스도 준다}} \;-\; \text{서지 전압} = L\dfrac{di}{dt} \text{ 가 작아짐}
$$

**ct.1.11의 개폐 서지**와 같은 이야기다. $\frac{di}{dt}$ 가 엄청나니 $L$ 을 줄여야 한다.

$$
\textbf{뇌전류는 } \mu \text{ s } \text{ 단위로 수십 kA} \;\Longrightarrow\; \dfrac{di}{dt} \text{ 가 천문학적}
$$

### 인하도선의 최대 간격

$$
\boxed{
\begin{array}{c|c}
\textbf{Ⅰ ・ Ⅱ 등급} & \mathbf{10}\ \mathrm{m} \\
\textbf{Ⅲ 등급} & \mathbf{15}\ \mathrm{m} \\
\textbf{Ⅳ 등급} & \mathbf{20}\ \mathrm{m}
\end{array}
}
$$

$$
\text{\textbf{등급이 엄격할수록 촘촘히}} \;-\; \text{Ⅰ이 가장 촘촘}
$$

$$
\text{\textbf{"10 - 15 - 20"}} \;-\; \text{Ⅰ・Ⅱ가 같은 값}
$$

$$
\text{\textbf{구조물의 노출된 모서리}}\text{에 설치}
$$

$$
\text{\textbf{모서리로 전류가 몰린다}} \;-\; \text{em.2의 \textbf{첨단 방전}}
$$

### 가연성 벽

$$
\text{\textbf{벽이 가연성}}\text{이면 } \mathbf{0.1}\ \mathrm{m} \text{ 이상 이격}
$$

$$
\text{\textbf{이격이 불가능}}\text{하면} \;\Longrightarrow\; \text{도체 단면적 } \mathbf{100}\ \mathrm{mm^2} \text{ 이상}
$$

$$
\boxed{\text{\textbf{떨어뜨리거나 굵게 하거나}}}
$$

$$
\text{\textbf{굵으면 덜 뜨겁다}} \;-\; \text{같은 전류에 저항이 작으니}
$$

$$
P = I^2R, \qquad R = \rho\dfrac{l}{A} \;\Longrightarrow\; A \uparrow \;\Longrightarrow\; \text{발열} \downarrow
$$

**ct.1.2의 옴의 법칙**이 규정의 숫자를 설명한다.

### 접지극시스템 (152.3)

$$
\text{\textbf{뇌전류를 대지로}}
$$

$$
\text{\textbf{A형}}(\text{수평・수직 접지극}) \text{ 또는 } \text{\textbf{B형}}(\text{환상도체・기초접지극})
$$

$$
\text{\textbf{kec.1.5의 접지시스템}}\text{과 이어진다} \;-\; \text{피뢰시스템 접지}
$$

$$
\text{\textbf{피뢰가 접속되면 접지도체가 구리 16㎟}} \;-\; \text{뇌전류가 크니}(\text{kec.1.5})
$$

## 내부피뢰시스템

> KEC **153**

$$
\boxed{\text{\textbf{간접뢰 ・ 유도뢰}}\text{로부터}}
$$

$$
\text{\textbf{건물 안의 전기・전자설비}}\text{를 지킨다}
$$

### 왜 필요한가

$$
\text{\textbf{외부피뢰시스템이 벼락을 받아 땅으로 흘려도}}
$$

$$
\text{\textbf{그 전류가 만드는 자계}}\text{가 안의 배선에 \textbf{유도}}
$$

$$
\text{\textbf{건물은 지켰는데 안의 기기가 탄다}}
$$

$$
\boxed{\text{\textbf{외부만으로는 부족}}}
$$

$$
\text{\textbf{요즘 더 중요}} \;-\; \text{전자기기가 약하니}
$$

### 방법

| 방법 | |
|---|---|
| **등전위본딩** | **전위차를 없앤다** |
| **SPD** (서지보호장치) | **서지를 흘린다** |
| **이격거리** | 안전거리 확보 |
| **자기차폐** | 자계를 막는다 |

$$
\boxed{\text{\textbf{등전위본딩이 핵심}}}
$$

$$
\text{\textbf{kec.1.5의 143}}\text{과 같은 사상} \;-\; \text{전위를 같게 하면 전류가 안 흐른다}
$$

$$
\text{\textbf{뇌전류로 전위가 뜨더라도}} \;\Longrightarrow\; \text{\textbf{다 같이 뜨면} 기기 사이엔 전위차가 없다}
$$

$$
\text{\textbf{kec.1.5의 통합접지}}\text{가 필요한 이유}
$$

### SPD

$$
\text{\textbf{mc.7.4에서 본 그것}} \;-\; \text{저압용 피뢰기}
$$

$$
\text{\textbf{평소엔 절연, 서지엔 도통}} \;-\; \mathrm{ZnO} \text{ 의 비직선 저항}(\text{mc.7.5})
$$

$$
\text{\textbf{등전위본딩용 SPD}} \;-\; \text{직접 못 묶는 곳}(\text{충전부})\text{을 SPD로 묶는다}
$$

$$
\text{\textbf{전원선을 접지에 직접 묶을 수는 없으니}} \;-\; \text{SPD를 사이에}
$$

$$
\boxed{\text{\textbf{평소엔 끊고 서지엔 묶는다}}}
$$

**영리한 해법**이다. 등전위본딩을 하고 싶은데 충전부라 못 하니, **필요할 때만** 묶는
소자를 쓴다.

$$
\text{\textbf{kec.1.4에서 SPD가 절연저항 측정을 방해}}\text{한 이유도 이것}
$$

## 정리

$$
\boxed{\text{적용 } \mathbf{20}\ \mathrm{m} \text{ 이상}, \qquad \text{측뢰 보호 } \mathbf{60}\ \mathrm{m} \text{ 초과}}
$$

$$
\boxed{\text{\textbf{외부}}(\text{직격뢰}) + \text{\textbf{내부}}(\text{간접뢰・유도뢰})}
$$

| 외부 | |
|---|---|
| **수뢰부** | 받는다 |
| **인하도선** | **2가닥 이상**, 간격 **10/15/20m** |
| **접지극** | 흘린다 |

| 내부 | |
|---|---|
| **등전위본딩** | **핵심** |
| **SPD** | 평소 끊고 서지엔 묶고 |

$$
\text{위험물 제조소 } \mathbf{Ⅱ} \text{ 등급 이상}, \qquad \text{초가 } 0.15\mathrm{m} \cdot \text{가연성 } 0.1\mathrm{m}
$$

$$
\text{\textbf{받아서 ・ 내리고 ・ 흘린다}} \;-\; \text{셋 중 하나만 끊겨도 소용없다}
$$
