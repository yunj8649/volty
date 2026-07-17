---
id: mc.4.10
title: 계기용변성기
status: reviewed
summary: 큰 전압·전류를 계기가 다룰 크기로 줄인다. PT는 2차를 단락하면 안 되고, CT는 개방하면 안 된다.
covers:
  - mc.4.10.1
  - mc.4.10.2
  - mc.4.10.3
  - mc.4.10.4
  - mc.4.10.5
formulas:
  - label: PT (계기용변압기)
    tex: \text{고전압} \to \mathbf{110}\ \mathrm{V}, \qquad \text{2차 \textbf{단락 금지}}
    note: 전압을 재니 **병렬** 연결. 단락하면 고압 단락이 된다.
  - label: CT (변류기)
    tex: \text{대전류} \to \mathbf{5}\ \mathrm{A}, \qquad \text{2차 \textbf{개방 절대 금지}}
    note: 전류를 재니 **직렬** 연결.
  - label: CT 개방하면
    tex: \text{1차 전류가 전부 \textbf{여자전류}} \;\Longrightarrow\; \text{자속 포화} \;\Longrightarrow\; \text{2차에 \textbf{고전압}}
    note: 수 kV가 유기되어 절연 파괴·인명 사고.
  - label: MOF (PCT)
    tex: \text{PT} + \text{CT} \;-\; \text{전력량 계량용}
    note: 계기용 변성기함. 요금 계산의 근거.
traps:
  - '**CT 2차는 절대 개방 금지.** 점검 시 반드시 단락한다. PT는 반대로 단락 금지.'
  - '**PT 2차는 110V, CT 2차는 5A**가 표준이다.'
  - '**PT는 병렬, CT는 직렬**로 넣는다. 재는 대상이 다르니.'
  - '**ZCT는 영상전류(지락)**, GPT는 **영상전압**을 검출한다. 짝을 이룬다.'
related:
  - mc.4.1
  - pw.1.6
  - pw.4.1
---

## 왜 필요한가

$$
\text{계통은 } 154\ \mathrm{kV}, \; 2000\ \mathrm{A} \;-\; \text{계기가 \textbf{직접 못 잰다}}
$$

$$
\boxed{\text{\textbf{작고 안전한 크기}로 줄여서 계기・계전기에 준다}}
$$

| | 줄이는 것 | 2차 표준 | 연결 |
|---|---|---|---|
| **PT** | **전압** | **110 V** | **병렬** |
| **CT** | **전류** | **5 A** | **직렬** |

$$
\text{\textbf{PT 110V, CT 5A}} \;-\; \text{전 세계 표준}
$$

### 두 가지 목적

| 목적 | |
|---|---|
| **계측** | 전압계·전류계·전력량계 |
| **보호** | **계전기**에 신호 (pw.1.6) |
| **절연** | 계기를 **고압에서 분리** |

$$
\text{\textbf{절연}}\text{이 숨은 목적이다} \;-\; \text{사람이 만지는 계기를 고압에서 떼어놓는다}
$$

## PT

$$
\boxed{\text{고전압} \to 110\ \mathrm{V}}
$$

$$
\text{전압을 재니 \textbf{병렬}}(\text{부하와 나란히})
$$

$$
\text{\textbf{2차는 거의 무부하}} \;-\; \text{전압계는 임피던스가 크니 전류가 거의 안 흐른다}
$$

### 2차를 단락하면 안 된다

$$
\text{PT 2차 단락} \;\Longrightarrow\; \text{1차가 \textbf{고압 단락}} \;\Longrightarrow\; \text{\textbf{과전류} ・ 소손}
$$

$$
\text{\textbf{보통 변압기와 같다}} \;-\; \text{단락하면 탄다}
$$

**PT 2차에는 퓨즈**를 단다. 그래서 사고가 나도 PT를 지킨다.

$$
\text{\textbf{PT: 단락 금지}} \qquad / \qquad \text{\textbf{CT: 개방 금지}}
$$

**정반대**다. 이 대비가 시험에 나온다.

## CT

$$
\boxed{\text{대전류} \to 5\ \mathrm{A}}
$$

$$
\text{전류를 재니 \textbf{직렬}}(\text{선로에 끼워서})
$$

$$
\text{\textbf{2차는 거의 단락}} \;-\; \text{전류계는 임피던스가 작으니}
$$

### 2차를 개방하면 절대 안 된다

$$
\boxed{\text{\textbf{CT 2차 개방 = 절대 금지}}}
$$

$$
\text{정상: } N_1I_1 = N_2I_2 \;\Longrightarrow\; \text{2차 전류가 1차의 자속을 \textbf{상쇄}}
$$

$$
\text{개방: } I_2 = 0 \;\Longrightarrow\; \text{\textbf{상쇄할 게 없다}} \;\Longrightarrow\; \text{1차 전류가 \textbf{전부 여자전류}}
$$

$$
\text{\textbf{엄청난 기자력}} \;\Longrightarrow\; \text{철심 \textbf{포화}} \;\Longrightarrow\; \text{자속이 \textbf{급격히 변함}} \;\Longrightarrow\; e = -N\dfrac{d\phi}{dt} \text{ 가 \textbf{거대}}
$$

$$
\text{\textbf{2차에 수 kV}가 유기된다}
$$

| 결과 | |
|---|---|
| **절연 파괴** | |
| **인명 사고** | 만지면 감전사 |
| **철심 과열** | 포화로 철손 급증 |
| CT 소손 | |

$$
\text{\textbf{점검할 때는 반드시 2차를 단락}}\text{하고 뗀다}
$$

**CT 단자대에는 단락용 나사**가 있다. 그걸 조여 단락시킨 뒤 계기를 뗀다.

$$
\boxed{\text{\textbf{CT는 1차 전류가 주어진 값}} \;-\; \text{2차가 뭘 하든 1차는 안 변한다}}
$$

**이게 CT의 특수성**이다. 보통 변압기는 2차 부하가 1차 전류를 정하는데, CT는 **1차
전류가 계통이 정해 놓은 값**이다. 2차는 따라갈 수밖에 없다.

$$
\text{보통 변압기: 2차 부하 → 1차 전류} \qquad / \qquad \text{CT: \textbf{1차 전류가 먼저}}
$$

### CT비

$$
\text{예: } 200/5 \;-\; \text{1차 } 200\ \mathrm{A} \text{ 일 때 2차 } 5\ \mathrm{A}
$$

$$
\text{CT비} = \dfrac{200}{5} = 40
$$

$$
\text{전류계 지시} \times \text{CT비} = \text{실제 전류}
$$

### CT의 결선 — 가동과 차동

$$
\text{CT \textbf{2대}로 3상 전류를 잴 때 결선이 두 가지}
$$

| 결선 | 1차 전류 = 2차 전류 × |
|---|---|
| **가동결선** (가동접속) | $\dfrac{1}{a}$ |
| **차동결선** (차동접속) | $\dfrac{1}{a} \times \dfrac{1}{\sqrt{3}}$ |

$$
\boxed{\textbf{차동결선은 } \sqrt{3} \text{ 이 더 나눠진다}}
$$

**차동은 두 CT의 2차를 서로 빼는 방향**으로 접속한 것이다. 두 전류가 $120°$ 를
이루니 차가 $\sqrt{3}$ 배가 되고, 그래서 1차를 역산할 때 $\sqrt{3}$ 으로 더 나눈다.

$$
\text{두 벡터가 } 120° \;\Longrightarrow\; \text{차의 크기} = \sqrt{3} \times \text{각각의 크기}
$$

**mc.4.4의 Y-$\Delta$ 에서 $\sqrt{3}$ 이 나온 것과 같은 기하**다. 3상이 정삼각형이라
$\sqrt{3}$ 이 자꾸 나온다.

### CT의 선정

$$
\boxed{I_1 = (\text{최대 부하전류}) \times 1.25 \sim 1.5}
$$

$$
\text{그 \textbf{범위 안의} 정격값을 고른다}
$$

$$
\text{정확히 맞는 정격이 없으면} \;\Longrightarrow\; \text{\textbf{큰 값 중 가장 가까운} 것}
$$

**여유를 두는 이유**가 둘이다.

$$
\text{\textbf{과부하}}\text{를 견뎌야 하고}, \text{ \textbf{장래 증설}}\text{도 봐야 한다}
$$

$$
\text{작게 잡으면} \;\Longrightarrow\; \text{\textbf{포화}} \;\Longrightarrow\; \text{계기가 틀리고 계전기가 오동작}
$$

### 과전류정수

$$
\text{\textbf{정격의 몇 배까지 오차 안에} 변류하나}
$$

$$
n > 10 \;-\; \text{보호용 CT는 사고 전류까지 정확해야}
$$

$$
\text{\textbf{계측용}: 정격 근처만 정확하면 됨} \;\Longrightarrow\; \text{사고 시 \textbf{포화되는 게 낫다}}(\text{계기 보호})
$$
$$
\text{\textbf{보호용}: 사고 전류(정격의 수십 배)에서도 \textbf{정확해야}}
$$

**요구가 반대**다. 그래서 계측용 CT와 보호용 CT를 따로 둔다.

$$
\text{계측용 } \mathbf{0.5} \text{ 급}, \qquad \text{보호용 } \mathbf{5P10}, \mathbf{10P20}
$$

## MOF

$$
\boxed{\text{\textbf{PT} + \textbf{CT}}\text{를 한 함에}}
$$

$$
\text{\textbf{PCT}}(\text{Potential Current Transformer})\text{라고도}
$$

$$
\text{\textbf{전력량 계량용}} \;-\; \text{전기 요금의 근거}
$$

$$
P = VI\cos\theta \;\Longrightarrow\; \text{\textbf{전압과 전류를 다} 알아야 전력}
$$

**전력량계에 넣을 전압과 전류를 동시에 뽑는다.** 그래서 둘을 한 함에 담았다.

$$
\text{\textbf{한전과 수용가의 경계}}\text{에 설치} \;-\; \text{돈이 걸려 있어 \textbf{봉인}}\text{한다}
$$

**계량의 정확도가 돈이라** 정밀급(0.5급 이상)을 쓰고, 함부로 못 열게 봉인한다.

## GPT

$$
\boxed{\text{\textbf{영상전압}}(V_0)\text{을 검출}}
$$

$$
\text{1차 Y}(\text{중성점 접지}) \;-\; \text{2차 \textbf{개방} } \Delta \quad(\text{오픈 델타})
$$

### 원리

$$
\text{정상: } V_a + V_b + V_c = 0 \;\Longrightarrow\; \text{오픈 } \Delta \text{ 양단 전압} = \mathbf{0}
$$

$$
\text{지락: 세 상의 균형이 깨짐} \;\Longrightarrow\; V_a + V_b + V_c = 3V_0 \neq 0 \;\Longrightarrow\; \text{\textbf{전압이 나타남}}
$$

$$
\boxed{\text{\textbf{세 전압을 더해서} 0이 아니면 지락}}
$$

**pw.3.3의 대칭좌표법**이 그대로 회로가 된 것이다. 영상분을 물리적으로 뽑아낸다.

$$
\text{완전 1선 지락 시 오픈 } \Delta \text{ 에 } \mathbf{190}\ \mathrm{V} \text{ 가 나타난다}(\text{표준})
$$

$$
\text{\textbf{OVGR}}(\text{지락과전압계전기})\text{에 물린다}(\text{pw.1.6})
$$

### 제한저항

$$
\text{오픈 } \Delta \text{ 에 \textbf{제한저항}}(\text{CLR})\text{을 단다}
$$

$$
\text{\textbf{중성점 불안정}}(\text{직렬 공진}) \text{ 을 막고 \textbf{유효전류}를 만들어 SGR이 방향을 판단}
$$

**비접지 계통**(pw.4.1)에서 지락 검출이 어려운 이유가 지락전류가 순 진상 무효분이라
방향 판단이 안 되기 때문이다. CLR이 **유효분을 만들어** 방향성 지락계전기가 일할 수
있게 한다.

## ZCT

$$
\boxed{\text{\textbf{영상전류}}(I_0)\text{를 검출}}
$$

$$
\text{\textbf{세 상의 전선을 모두} 하나의 철심에 관통}
$$

### 원리

$$
\text{정상: } I_a + I_b + I_c = 0 \;\Longrightarrow\; \text{합성 자속} = \mathbf{0} \;\Longrightarrow\; \text{2차 출력} = 0
$$

$$
\text{지락: 전류가 \textbf{땅으로 샘}} \;\Longrightarrow\; I_a + I_b + I_c = 3I_0 \neq 0 \;\Longrightarrow\; \text{\textbf{출력 발생}}
$$

$$
\text{\textbf{나가는 전류와 돌아오는 전류의 차이}}\text{를 본다}
$$

**누전차단기**(ELB)가 이 원리다. 가정용도 같다.

$$
\text{\textbf{GPT} → 영상\textbf{전압}} \qquad / \qquad \text{\textbf{ZCT} → 영상\textbf{전류}}
$$

$$
\text{\textbf{짝을 이룬다}} \;-\; \text{둘 다 있어야 \textbf{방향}}\text{을 안다}(\text{SGR})
$$

**전압만 알면 지락이 났다는 것만 알고, 전류까지 알아야 어느 방향인지** 안다. 그래서
선택지락계전기(SGR)는 GPT와 ZCT를 다 쓴다.

## 정리

| 변성기 | 재는 것 | 2차 | 연결 | 금기 |
|---|---|---|---|---|
| **PT** | **전압** | **110 V** | **병렬** | **단락 금지** |
| **CT** | **전류** | **5 A** | **직렬** | **개방 절대 금지** |
| **MOF** | 전압+전류 | | | 계량용 |
| **GPT** | **영상전압** | 190 V (오픈$\Delta$) | | |
| **ZCT** | **영상전류** | | 관통 | |

$$
\boxed{\text{\textbf{PT는 단락 금지, CT는 개방 금지}} \;-\; \text{정반대}}
$$

**이유도 정반대**다. PT는 전압원처럼 굴어서 단락하면 과전류가 흐르고, CT는 전류원처럼
굴어서 개방하면 과전압이 생긴다.

$$
\text{PT} \approx \text{\textbf{전압원}} \qquad / \qquad \text{CT} \approx \text{\textbf{전류원}}
$$

$$
\text{전압원은 \textbf{단락}이 위험, 전류원은 \textbf{개방}이 위험} \;-\; \text{회로이론의 상식 그대로}
$$
