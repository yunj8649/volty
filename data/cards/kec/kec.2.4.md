---
id: kec.2.4
title: 배선 및 조명설비
status: reviewed
summary: 옥내배선은 2.5㎟ 이상이고, 제3고조파가 심하면 중성선을 굵게 해야 한다.
covers:
  - kec.2.4.1
  - kec.2.4.2
  - kec.2.4.3
  - kec.2.4.4
  - kec.2.4.5
  - kec.2.4.6
formulas:
  - label: 저압 옥내배선 (KEC 231.3.1)
    tex: \text{단면적 } \mathbf{2.5}\ \mathrm{mm^2} \text{ 이상의 \textbf{연동선}}
    note: 400V 이하 제어회로 등은 **1.5㎟** 또는 **0.75㎟**로 완화.
  - label: 중성선 = 선도체 (KEC 231.3.2-1)
    tex: \text{\textbf{2선식 단상}} \;/\; \text{구리 } \mathbf{16}\ \mathrm{mm^2} \cdot \text{알루미늄 } \mathbf{25}\ \mathrm{mm^2} \text{ 이하 다상} \;/\; \text{THD } \mathbf{15\sim33\%}
    note: 이 셋은 중성선을 **선도체 이상**으로.
  - label: 고조파가 심하면 (KEC 231.3.2-2)
    tex: \text{THD} > \mathbf{33\%} \;\Longrightarrow\; \text{중성선을 } \mathbf{1.45} \times I_B \text{ 를 흘릴 수 있게}
    note: 다심케이블의 경우. 제3고조파가 중성선에 몰리니.
  - label: 배선설비 공사 (KEC 232.2)
    tex: \text{전선・케이블의 \textbf{종류}}\text{에 따라 \textbf{공사방법}}\text{이 정해진다}
    note: 표 232.2-1.
traps:
  - '**저압 옥내배선은 2.5㎟ 이상**이다. 1.5㎟는 400V 이하 제어회로 등의 예외.'
  - '**THD가 33%를 넘으면 중성선을 1.45×I_B 로** 키운다. 제3고조파가 중성선에 몰리니.'
  - '**구리 16㎟·알루미늄 25㎟ 이하**인 다상회로는 중성선을 선도체 이상으로.'
  - 중성선 단면적 규정은 **ct.1.5의 제3고조파**가 근거다.
related:
  - kec.1.3
  - ct.1.4
  - ct.1.5
---

> KEC **230** (231 일반사항 · 232 배선설비 · 234 조명설비 등) — 시행 2026. 1. 5. 기준

## 일반사항

> KEC **231**

### 저압 옥내배선의 사용전선 (231.3.1)

$$
\boxed{\text{단면적 } \mathbf{2.5}\ \mathrm{mm^2} \text{ 이상의 \textbf{연동선}}}
$$

$$
\text{또는 \textbf{동등 이상의 강도 및 굵기}}
$$

$$
\text{\textbf{기본값}} \;-\; \text{나머지는 예외}
$$

### 예외 — 400V 이하

$$
\textbf{사용전압 } \text{ 400} \  \mathrm{V} \text{ 이하}\text{인 경우}
$$

| 조건 | 굵기 |
|---|---|
| **전광표시장치·제어회로** + **관·몰드·덕트 공사** | **1.5㎟** 이상 연동선 |
| **전광표시장치·제어회로** + **다심케이블** + **과전류 자동차단** | **0.75㎟** 이상 |
| 234.8·234.11.5의 코드·캡타이어 | **0.75㎟** 이상 |
| 리프트 케이블 | (242.11) |

$$
\boxed{\text{\textbf{제어회로는 가늘어도 된다}}}
$$

$$
\text{\textbf{전류가 작으니}} \;-\; \text{신호만 보내는 회로}
$$

$$
\text{\textbf{다만 조건이 붙는다}} \;-\; \text{관 안에 넣거나 ・ 과전류차단을 하거나}
$$

$$
\text{\textbf{보호를 대신 강화}}\text{하는 거래}
$$

$$
\text{\textbf{0.75㎟는 과전류 자동차단이 필수}} \;-\; \text{가늘면 빨리 타니}
$$

## 중성선의 단면적 (231.3.2)

$$
\text{\textbf{ct.1.5의 제3고조파}}\text{가 규정이 된 곳}
$$

### 중성선 ≥ 선도체인 경우

$$
\boxed{
\begin{array}{l}
\text{가. \textbf{2선식 단상회로}} \\
\text{나. 선도체가 } \textbf{구리 } \text{ 16} \  \mathrm{mm^2} \cdot \textbf{알루미늄 } \text{ 25} \  \mathrm{mm^2} \text{ 이하인 다상 회로} \\
\text{다. } \textbf{제3고조파 THD } \text{ 15 } \sim \text{ 33} \% \text{ 인 3상회로}
\end{array}
}
$$

$$
\text{\textbf{셋 중 하나면}} \;\Longrightarrow\; \text{중성선을 \textbf{선도체 이상}}\text{으로}
$$

### 왜 이 셋인가

$$
\text{\textbf{가. 2선식 단상}}: \text{중성선에 \textbf{선도체와 같은 전류}}\text{가 흐른다}
$$

$$
\text{\textbf{돌아오는 길}}\text{이니 당연} \;-\; \text{같은 굵기여야}
$$

$$
\text{\textbf{나. 가는 다상 회로}}: \text{\textbf{불평형의 영향이 상대적으로 크다}}
$$

$$
\text{\textbf{굵은 선은 여유가 있는데}} \;-\; \text{가는 선은 조금만 불평형해도 위험}
$$

$$
\text{\textbf{다. 제3고조파}}: \text{\textbf{중성선에 몰린다}}(\text{ct.1.5})
$$

$$
\boxed{\text{\textbf{제3고조파는 영상분}}} \;-\; \text{세 상이 \textbf{같은 위상}}
$$

$$
I_a + I_b + I_c = 3I_0 \;-\; \text{\textbf{상쇄가 안 되고 더해진다}}
$$

$$
\text{\textbf{평형인데도 중성선에 전류}} \;-\; \text{ct.1.5에서 본 그것}
$$

### THD 33% 초과

$$
\boxed{\text{THD} > 33\% \;\Longrightarrow\; \text{중성선을 \textbf{더 굵게}}}
$$

$$
\text{\textbf{다심케이블}}: \text{선도체 단면적 = 중성선 단면적}
$$

$$
\text{그 단면적은 } \textbf{선도체의 } \text{ 1.45 } \times \text{ I} _B \text{ 를 흘릴 수 있게}
$$

$$
I_B = \text{\textbf{회로 설계전류}}
$$

$$
\boxed{\mathbf{1.45}} \;-\; \text{kec.2.2의 과부하 보호에서도 나온 숫자}
$$

$$
I_2 \leq 1.45 \times I_Z \quad(\text{kec.2.2의 212})
$$

$$
\text{\textbf{같은 1.45}} \;-\; \text{전선이 잠깐 견디는 여유}
$$

### 왜 33%인가

$$
\textbf{제3고조파가 33} \% \textbf{면} \;\Longrightarrow\; \text{중성선 전류} = 3 \times 0.33 = \mathbf{1.0} \times \text{선전류}
$$

$$
\boxed{\text{\textbf{중성선 전류가 선전류와 같아지는 지점}}}
$$

$$
\text{\textbf{그 이상이면 중성선이 선도체보다 더 뜨겁다}}
$$

$$
\textbf{그래서 33} \% \textbf{가 경계} \;-\; \text{규정의 숫자에 이유가 있다}
$$

**ct.1.5에서 "중성선이 상선보다 뜨거운 경우가 실제로 있다"** 고 했다. 그 경계가
여기 있다.

$$
\textbf{THD 100} \%\text{면 중성선 전류가 \textbf{선전류의 3배}} \;-\; \text{극단적}
$$

$$
\text{\textbf{인버터・SMPS가 많은 건물}}\text{에서 실제로 문제}(\text{pw.7.3})
$$

$$
\boxed{\text{\textbf{ct.1.4・ct.1.5의 이론이 배선 굵기를 정한다}}}
$$

## 배선설비

> KEC **232**

### 공사방법 (232.2)

$$
\text{\textbf{전선・케이블의 종류}}\text{에 따라 \textbf{공사방법}}\text{이 정해진다} \;(\text{표 232.2-1})
$$

| 공사 | |
|---|---|
| **합성수지관공사** | 232.11 |
| **금속관공사** | 232.12 |
| **금속몰드공사** | |
| **금속덕트공사** | |
| **케이블트레이공사** | |
| **케이블공사** | 232.51 |
| 버스덕트·라이팅덕트 | |

$$
\text{\textbf{외부적인 영향}}(232.4)\text{을 고려해야}
$$

$$
\text{\textbf{습기 ・ 부식 ・ 충격 ・ 온도}}
$$

$$
\text{\textbf{장소에 따라 쓸 수 있는 공사가 다르다}}
$$

### 나전선의 사용 제한

$$
\text{\textbf{옥내에는 나전선을 쓸 수 없다}} \;-\; \text{원칙}
$$

$$
\text{\textbf{예외}}: \text{애자공사 ・ 버스덕트 ・ 라이팅덕트 ・ 전기로 ・ 접촉전선 등}
$$

$$
\text{\textbf{만질 수 없는 곳}}\text{이면 예외}
$$

### 전선의 병렬 사용

$$
\text{\textbf{kec.1.3의 123-6}}\text{과 같다} \;-\; \text{구리 } 50\ \mathrm{mm^2} \cdot \text{알루미늄 } 70\ \mathrm{mm^2}
$$

## 전기기기

> KEC **233**

$$
\text{\textbf{저압 전기기기의 시설}}
$$

$$
\text{\textbf{충전부 노출 금지}}(\text{기술기준 제53조})
$$

$$
\text{\textbf{발열 제한}} \;-\; \text{kec.2.2의 214}
$$

## 조명설비

> KEC **234**

### 등기구의 시설

$$
\text{\textbf{열 영향}}\text{을 고려} \;-\; \text{등기구는 뜨겁다}
$$

$$
\text{\textbf{가연물과의 이격}}
$$

$$
\text{\textbf{kec.1.2의 113.3}}\text{이 여기서 구체화}
$$

### 옥외등

$$
\textbf{대지전압 } \text{ 300} \  \mathrm{V} \text{ 이하}
$$

$$
\text{\textbf{방수 ・ 방식}}
$$

### 관등회로

$$
\text{\textbf{방전등용 안정기・변압기부터 방전관까지의 전로}}(\text{kec.1.1의 용어})
$$

$$
\text{\textbf{네온방전등 ・ 형광등}}
$$

$$
\text{\textbf{mc.4.11의 누설변압기}}\text{가 안정기}
$$

$$
\text{\textbf{kec.2.1에서 본 것}} \;-\; \text{저압 전원인데 안에서 고압}
$$

### 진열장 · 옥외 광고등

$$
\text{\textbf{사람이 쉽게 만질 수 있는 곳}} \;-\; \text{규정이 까다롭다}
$$

## 옥측, 옥외설비

> KEC **235**

$$
\text{\textbf{건물 밖}}\text{의 설비}
$$

$$
\text{\textbf{빗물 ・ 자외선 ・ 온도 변화}}\text{를 견뎌야}
$$

$$
\text{\textbf{kec.2.3의 전선로}}\text{와 이어진다}
$$

## 비상용 예비전원설비

> KEC **236**

$$
\boxed{\text{\textbf{kec.1.2의 113.7}}(\text{전원공급 중단에 대한 보호})\text{이 구체화}}
$$

$$
\text{\textbf{정전이 위험한 곳}}\text{에 예비전원}
$$

| 종류 | |
|---|---|
| **축전지** | UPS |
| **발전기** | 비상발전 |
| **별도 인입선** | 다른 계통에서 |

$$
\text{\textbf{절환 시간}}\text{이 정해져 있다} \;-\; \text{용도에 따라}
$$

$$
\text{\textbf{소방설비}} \;-\; \text{화재 시에도 살아 있어야}
$$

$$
\text{\textbf{내화 배선}}\text{이 필요} \;-\; \text{불에 타면 소용없으니}
$$

$$
\boxed{\text{\textbf{보호설비 자신이 보호되어야}}}
$$

**흥미로운 재귀**다. 소방설비를 살리려면 그 배선이 불에 견뎌야 한다.

## 정리

$$
\boxed{\text{저압 옥내배선 } \mathbf{2.5}\ \mathrm{mm^2} \text{ 이상 연동선}}
$$

$$
\text{예외}(400\mathrm{V} \text{ 이하 제어회로}): \mathbf{1.5}\ \mathrm{mm^2} \text{ 또는 } \mathbf{0.75}\ \mathrm{mm^2}
$$

$$
\boxed{\text{\textbf{중성선} } \geq \text{ 선도체}}
$$

| 조건 | |
|---|---|
| **2선식 단상** | 돌아오는 전류가 같으니 |
| **구리 16㎟·알루미늄 25㎟ 이하 다상** | 가는 선은 여유가 없으니 |
| **THD 15~33%** | 제3고조파가 몰리니 |
| **THD > 33%** | **$1.45 \times I_B$** 로 더 굵게 |

$$
\boxed{\text{THD } 33\% \;\Longrightarrow\; \text{중성선 전류} = 3 \times 0.33 = \text{선전류}}
$$

$$
\text{\textbf{그 경계에서 규정이 바뀐다}} \;-\; \text{ct.1.5의 영상분이 근거}
$$
