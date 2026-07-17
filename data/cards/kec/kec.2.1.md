---
id: kec.2.1
title: 통칙
status: reviewed
summary: TN·TT·IT의 문자가 전부다. 첫 글자는 전원, 둘째는 노출도전부, 셋째는 중성선과 보호도체의 배치다.
covers:
  - kec.2.1.1
  - kec.2.1.2
  - kec.2.1.3
formulas:
  - label: 적용범위 (KEC 201)
    tex: \text{교류 } \mathbf{1}\ \mathrm{kV} \text{ 또는 직류 } \mathbf{1.5}\ \mathrm{kV} \text{ 이하}
    note: kec.1.1의 전압 구분과 같다.
  - label: 제1문자 — 전원계통과 대지
    tex: \mathbf{T} \to \text{한 점을 대지에 \textbf{직접} 접속}, \qquad \mathbf{I} \to \text{\textbf{절연}} \text{ 또는 높은 \textbf{임피던스}}
    note: '**T**erra(대지) / **I**solated(절연).'
  - label: 제2문자 — 노출도전부와 대지
    tex: \mathbf{T} \to \text{\textbf{독립} 접지극에}, \qquad \mathbf{N} \to \text{전원계통의 \textbf{접지점}}\text{에}
    note: '**T는 따로, N은 전원과 함께**(Neutral).'
  - label: 제3문자 — 중성선과 보호도체
    tex: \mathbf{S} \to \text{\textbf{별도}}\text{의 도체}, \qquad \mathbf{C} \to \text{\textbf{겸용}}(\text{PEN})
    note: '**S**eparated / **C**ombined.'
traps:
  - '**제1문자는 전원, 제2문자는 노출도전부**다. 순서를 뒤집으면 안 된다.'
  - '**TT는 전원과 설비가 독립된 접지극**이다. TN은 전원의 접지점에 붙인다.'
  - '**IT는 절연 또는 고임피던스**다. 완전 절연만이 아니다.'
  - '**PEN·PEM·PEL은 충전부가 아니다**(112·202.1 일치). **중성선은 충전부에 포함**된다(112 기준
    = 시험 정답). 202.1의 "충전도체 아님"은 용어(충전부↔충전도체) 차이 — 본문 참조.'
related:
  - kec.1.1
  - kec.1.5
  - kec.2.2
---

> KEC **200** (201 적용범위 · 202 배전방식 · 203 계통접지의 방식) — 시행 2026. 1. 5. 기준

## 적용범위

> KEC **201**

$$
\boxed{\text{교류 } \mathbf{1}\ \mathrm{kV} \text{ 또는 직류 } \mathbf{1.5}\ \mathrm{kV} \text{ 이하}}
$$

$$
\text{\textbf{kec.1.1의 저압 정의}}\text{와 같다}
$$

$$
\text{\textbf{포함되는 것}}
$$

| | |
|---|---|
| **1** | 전기설비를 구성·연결하는 **선로와 기계기구** |
| **2** | **저압 기기에서 유도된 $1\ \mathrm{kV}$ 초과** 회로 및 기기 |

$$
\text{\textbf{2번이 재미있다}}
$$

$$
\text{\textbf{고압방전등 ・ 전기집진기}} \;-\; \text{저압 전원인데 안에서 고압을 만든다}
$$

$$
\boxed{\text{\textbf{전원이 저압이면 저압전기설비}}}
$$

$$
\text{\textbf{안에서 승압해도}} \;-\; \text{저압 규정을 따른다}
$$

**네온사인**(mc.4.11의 누설변압기)이 그 예다. $220\ \mathrm{V}$ 를 받아 수 kV를 만드는데,
저압전기설비다.

## 배전방식

> KEC **202**

### 교류 회로 (202.1)

$$
\text{\textbf{202.1-1}}: \text{\textbf{중성선 또는 PEN 도체는 충전도체는 아니지만 운전전류를 흘리는 도체}}
$$

> **확인 — 시험 정답은 "중성선 = 충전부", 표면 충돌은 용어 차이.**
>
> **KEC 112(용어 정의)**: "충전부(Live Part)란 통상적인 운전 상태에서 전압이 걸리도록
> 되어 있는 도체 또는 도전부를 말한다. **중성선을 포함**하나 PEN 도체, PEM 도체 및
> PEL 도체는 포함하지 않는다."
>
> **KEC 202.1-1**: "3상 4선식의 **중성선 또는 PEN 도체는 충전도체는 아니지만** 운전전류를
> 흘리는 도체이다."
>
> **정리(확인).** 시험 정답은 **중성선 = 충전부**다 — 112가 "충전부에 중성선 포함,
> PEN·PEM·PEL 제외"라 명시하고, 이게 표준 정답으로 채점된다. 표면상 충돌은 **용어가 다르기
> 때문**이다: 112는 "충전부(live part)", 202.1은 "충전도체(live conductor)"를 말한다.
> 다만 KEC 스스로 232(과전류보호)에서는 "중성선을 포함한 모든 **충전도체**를 차단"이라 해
> 중성선을 충전도체로도 취급하므로, "충전부 O / 충전도체 X"의 깔끔한 이분법으로 외우기보다
> **시험 요지(충전부에 중성선 포함, PEN·PEM·PEL 제외)**만 잡는 게 안전하다.

$$
\text{\textbf{확실한 것}}\text{만 정리하면}
$$

| | 충전부인가 | 전류가 흐르나 |
|---|---|---|
| **선도체**(L1·L2·L3) | **O** | O |
| **중성선**(N) | **조문 상충** (위 참조) | **O** |
| **PEN · PEM · PEL** | **X** (양쪽 일치) | **O** |
| **보호도체**(PE) | X | **평소엔 X** |

$$
\boxed{\text{\textbf{PEN은 충전부가 아니다}} \;-\; \text{이건 두 조문이 일치}}
$$

$$
\text{\textbf{운전전류를 흘린다}}\text{는 것도 양쪽이 같다}
$$

$$
\text{\textbf{중성선은 전압이 거의 0}}\text{인데 \textbf{전류는 흐른다}}
$$

$$
\text{\textbf{불평형 전류}} \cdot \text{\textbf{제3고조파}}(\text{ct.1.5})
$$

$$
\boxed{\text{\textbf{그래서 중성선을 함부로 끊으면 안 된다}}}
$$

$$
\text{\textbf{PE는 평소엔 전류가 안 흐른다}} \;-\; \text{고장 시에만}(\text{kec.1.2의 113.5})
$$

### 3상 4선식에서 파생되는 단상

$$
\text{\textbf{두 도체 모두 선도체}} \;\text{또는}\; \text{\textbf{선도체 + 중성선}} \;\text{또는}\; \text{\textbf{선도체 + PEN}}
$$

$$
\text{\textbf{모든 부하가 선간에 접속}}\text{되면 \textbf{중성선이 필요 없을 수}} \text{ 있다}
$$

$$
\text{\textbf{3상 3선식}}\text{이 그것}(\text{ct.1.5})
$$

### 직류 회로 (202.2)

$$
\text{\textbf{PEL과 PEM 도체}}\text{도 충전도체는 아니지만 운전전류를 흘린다}
$$

$$
\text{\textbf{2선식}} \text{ 또는 } \text{\textbf{3선식}}
$$

| 도체 | 뜻 |
|---|---|
| **PEL** | 보호도체 + **선도체** 겸용 |
| **PEM** | 보호도체 + **중간도체** 겸용 |
| **M** | **중간도체** (직류의 중성선 격) |

$$
\text{\textbf{교류의 PEN에 대응}} \;-\; \text{직류판}
$$

$$
\text{\textbf{L}}\text{ine이냐 \textbf{M}}\text{id냐의 차이}
$$

$$
\text{\textbf{kec.5의 태양광・전기저장장치}}\text{가 직류라 중요해졌다}
$$

## 계통접지의 방식

> KEC **203**

$$
\boxed{\text{\textbf{TN ・ TT ・ IT}}}
$$

$$
\text{\textbf{저압전로의 보호도체 및 중성선의 접속 방식}}\text{에 따라}
$$

$$
\text{\textbf{옛 종별 접지공사를 대체}}\text{한 체계}(\text{kec.1.5})
$$

## 문자의 뜻 — 이게 전부다

$$
\boxed{
\begin{array}{c|l|l}
\text{\textbf{제1문자}} & \text{\textbf{전원계통과 대지}} & \mathbf{T} \text{ 직접접속} \;/\; \mathbf{I} \text{ 절연・고임피던스} \\
\text{\textbf{제2문자}} & \text{\textbf{노출도전부와 대지}} & \mathbf{T} \text{ 독립 접지극} \;/\; \mathbf{N} \text{ 전원 접지점에} \\
\text{\textbf{제3문자}} & \text{\textbf{중성선과 보호도체}} & \mathbf{S} \text{ 별도} \;/\; \mathbf{C} \text{ 겸용}(\text{PEN})
\end{array}
}
$$

$$
\text{\textbf{순서를 외우면 나머지는 저절로}}
$$

### 제1문자 — 전원

$$
\mathbf{T} \;(\text{Terra}, \text{대지}) \;-\; \text{\textbf{한 점을 대지에 직접 접속}}
$$

$$
\mathbf{I} \;(\text{Isolated}) \;-\; \text{\textbf{모든 충전부를 절연}} \text{ 또는 } \text{\textbf{높은 임피던스}}\text{를 통해 접속}
$$

$$
\boxed{\text{\textbf{I는 완전 절연만이 아니다}}} \;-\; \text{고임피던스 접지도 I}
$$

$$
\text{\textbf{시험 함정}}
$$

**pw.4.1의 비접지·소호리액터 접지**가 IT에 해당한다. 거기서 "지락전류를 작게"라고
한 그 사상이다.

### 제2문자 — 노출도전부

$$
\mathbf{T} \;-\; \text{\textbf{대지로 직접 접속}}, \text{ \textbf{전원계통의 접지와는 무관}}
$$

$$
\mathbf{N} \;-\; \text{\textbf{전원계통의 접지점}}\text{에 직접 접속}
$$

$$
\text{\textbf{통상 중성점}}, \text{ 중성점이 없으면 \textbf{선도체}}
$$

$$
\boxed{\text{\textbf{T는 따로, N은 함께}}}
$$

$$
\text{\textbf{"전원계통의 접지와는 무관"}}\text{이 T의 핵심}
$$

$$
\text{\textbf{독립된 접지극}} \;-\; \text{전원 쪽 접지극과 별개}
$$

### 제3문자 — 중성선과 보호도체

$$
\mathbf{S} \;(\text{Separated}) \;-\; \text{\textbf{별도의 도체}}
$$

$$
\mathbf{C} \;(\text{Combined}) \;-\; \text{\textbf{한 개의 도체로 겸용}}(\text{PEN})
$$

$$
\text{\textbf{TN에만 붙는다}} \;-\; \text{TT・IT는 애초에 노출도전부가 따로니}
$$

## TN 계통 (203.2)

$$
\boxed{\text{\textbf{전원측의 한 점을 직접접지}}\text{하고 \textbf{노출도전부를 보호도체로 접속}}}
$$

$$
\text{\textbf{중성선 및 PE 도체의 배치}}\text{에 따라 셋으로}
$$

| 종류 | |
|---|---|
| **TN-S** | **계통 전체에 별도**의 N과 PE |
| **TN-C** | **전체에 PEN** (겸용) |
| **TN-C-S** | **일부는 겸용, 일부는 별도** |

$$
\text{\textbf{TN-C-S}}\text{가 가장 흔하다} \;-\; \text{인입까지 PEN, 안에서 분리}
$$

$$
\text{\textbf{한 번 분리하면 다시 합칠 수 없다}} \;-\; \text{C-S는 되고 S-C는 안 된다}
$$

$$
\boxed{\text{\textbf{PEN을 분리한 뒤 다시 묶으면}} \;\Longrightarrow\; \text{중성선 전류가 PE로}}
$$

$$
\text{\textbf{PE에 전류가 흐르면}} \;\Longrightarrow\; \text{\textbf{외함에 전압}} \;\Longrightarrow\; \text{위험}
$$

### TN-C의 위험

$$
\text{\textbf{PEN이 끊어지면}} \;\Longrightarrow\; \text{\textbf{보호도체도 같이 끊긴다}}(\text{kec.1.1})
$$

$$
\text{\textbf{그 순간 외함에 전압}}\text{이 걸린다}
$$

$$
\text{\textbf{하나로 두 일을 하는 대가}}
$$

$$
\text{\textbf{그래서 요즘은 TN-S나 TN-C-S}}
$$

## TT 계통 (203.3)

$$
\boxed{\text{\textbf{전원의 한 점을 직접 접지}}\text{하고}}
$$

$$
\boxed{\text{\textbf{노출도전부는 전원의 접지전극과 전기적으로 독립적인 접지극}}\text{에}}
$$

$$
\text{\textbf{두 접지극이 따로}} \;-\; \text{그래서 T-T}
$$

$$
\text{\textbf{우리나라 주택}}\text{이 대체로 이것}
$$

### 왜 ELB가 필수인가

$$
\text{\textbf{지락전류가 대지를 통해} 돌아간다}
$$

$$
\text{\textbf{대지 저항이 크니}} \;\Longrightarrow\; \text{\textbf{지락전류가 작다}}
$$

$$
\text{\textbf{과전류차단기가 못 잡는다}} \;-\; \text{정격보다 작을 수도}
$$

$$
\boxed{\text{\textbf{TT는 누전차단기}}(\text{ELB})\text{가 필수}}
$$

$$
\text{\textbf{mc.7.4의 ELB}} \;-\; 30\ \mathrm{mA} \cdot 0.03 \text{ 초}
$$

$$
\text{\textbf{TN은 지락이 곧 단락}}\text{에 가까워} \;\Longrightarrow\; \text{과전류차단기로도 가능}
$$

$$
\text{\textbf{길이 다르니 보호도 다르다}}
$$

## IT 계통 (203.4)

$$
\boxed{\text{\textbf{충전부 전체를 대지로부터 절연}}\text{하거나 \textbf{한 점을 임피던스를 통해}}}
$$

$$
\text{\textbf{노출도전부는 단독 또는 일괄}}\text{적으로 PE 도체에}
$$

$$
\text{\textbf{계통은 높은 임피던스를 통하여 접지할 수 있다}}
$$

$$
\text{\textbf{중성점 ・ 인위적 중성점 ・ 선도체}}\text{에서}
$$

$$
\text{\textbf{중성선은 배선할 수도 안 할 수도}}
$$

### 왜 IT를 쓰나

$$
\boxed{\text{\textbf{1선 지락이 나도 계속 쓸 수 있다}}}
$$

$$
\text{\textbf{절연되어 있으니}} \;\Longrightarrow\; \text{\textbf{지락전류가 거의 안 흐른다}}
$$

$$
\text{\textbf{pw.4.1의 비접지 계통}}\text{과 같은 이야기}
$$

| 어디 | 왜 |
|---|---|
| **수술실** | **정전이 더 위험** |
| **화학 플랜트** | 반응 중단 불가 |
| **선박** | |
| 광산 | |

$$
\text{\textbf{kec.1.2의 113.7}} \;-\; \text{전원공급 중단에 대한 보호}
$$

$$
\boxed{\text{\textbf{정전이 감전보다 위험한 곳}}}
$$

$$
\text{\textbf{대신 절연감시장치}}\text{가 필수} \;-\; \text{1선 지락을 \textbf{알아야}}
$$

$$
\text{\textbf{2선째 지락}}\text{이 나면 \textbf{단락}} \;\Longrightarrow\; \text{그전에 고쳐야}
$$

$$
\text{\textbf{첫 지락은 경보, 둘째는 차단}}
$$

## 직류계통 (203.5)

$$
\text{\textbf{직류도 TN ・ TT ・ IT}}\text{로 분류}
$$

$$
\text{\textbf{특정 극}}(\text{L+ ・ L- ・ M})\text{을 접지}
$$

$$
\text{\textbf{kec.5의 태양광 ・ 전기저장장치}}\text{에 쓰인다}
$$

$$
\text{\textbf{직류가 늘어나며 규정도 늘었다}}
$$

## 정리

$$
\boxed{
\begin{array}{c|l}
\text{\textbf{제1문자}} & \mathbf{T} \text{ 대지 직접} \;/\; \mathbf{I} \text{ 절연・고임피던스} \\
\text{\textbf{제2문자}} & \mathbf{T} \text{ 독립 접지극} \;/\; \mathbf{N} \text{ 전원 접지점} \\
\text{\textbf{제3문자}} & \mathbf{S} \text{ 별도} \;/\; \mathbf{C} \text{ 겸용}
\end{array}
}
$$

| 계통 | 전원 | 노출도전부 | 특징 |
|---|---|---|---|
| **TN-S** | 직접접지 | **전원 접지점** | N·PE **별도** |
| **TN-C** | 직접접지 | 전원 접지점 | **PEN 겸용** — 위험 |
| **TN-C-S** | 직접접지 | 전원 접지점 | **일부만 겸용** — 흔함 |
| **TT** | 직접접지 | **독립 접지극** | **ELB 필수** |
| **IT** | **절연·고임피던스** | PE | **지락에도 계속 운전** |

$$
\text{\textbf{중성선・PEN은 충전도체가 아니지만 운전전류를 흘린다}}
$$

$$
\text{\textbf{문자 세 개}}\text{가 계통접지의 전부}
$$
