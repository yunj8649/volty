---
id: kec.4.7
title: 전기철도의 안전을 위한 보호
status: reviewed
summary: 레일 전위가 철도 특유의 위험이다. 접촉전압을 작업장에서 25V 이하로 잡는다.
covers:
  - kec.4.7.1
formulas:
  - label: 레일 전위 접촉전압 (KEC 461.2)
    tex: \text{교류 최대 허용 접촉전압 } \mathbf{670}\ \mathrm{V}, \qquad \text{작업장 } \mathbf{25}\ \mathrm{V} \text{ 이하}
    note: 지속시간에 따라 다르다. 작업장이 가장 엄격.
  - label: 누설전류·전자파 (KEC 461.5~461.6)
    tex: \text{\textbf{전식 방지}}(\text{배류}) + \text{\textbf{전자파 장해 방지}}
    note: 직류 누설전류가 매설물을 부식.
traps:
  - '**레일 전위가 철도 특유의 위험**이다. 귀선전류가 레일을 통하니 전위가 뜬다.'
  - '**작업장 접촉전압은 25V 이하**다. 일반(670V)보다 훨씬 엄격.'
  - '**직류 누설전류가 전식**을 일으킨다 — 배류법으로 방지.'
related:
  - kec.4.4
  - kec.4.2
  - pw.7.3
---

> KEC **460** (461 전기안전의 일반사항) — 시행 2026. 1. 5. 기준

## 전기안전의 일반사항

> KEC **461**

## 감전에 대한 보호조치 (461.1)

$$
\text{\textbf{kec.2.2의 감전 보호}}\text{를 철도에}
$$

$$
\text{\textbf{승객 ・ 작업자 ・ 일반인}}
$$

## 레일 전위 — 철도 특유의 위험

> KEC **461.2**

$$
\boxed{\text{\textbf{귀선전류가 레일을 통하니}} \;\Longrightarrow\; \text{\textbf{레일 전위가 뜬다}}}
$$

$$
\text{\textbf{레일이 귀선}}(\text{kec.4.4}) \;-\; \text{전류가 흐르면 전위가 생긴다}
$$

$$
V = IR \;-\; \text{레일 저항 × 귀선전류}
$$

$$
\text{\textbf{사람이 레일과 대지를 동시에 만지면}} \;\Longrightarrow\; \text{\textbf{감전}}
$$

### 최대 허용 접촉전압 (표 461.2-1)

$$
\boxed{\text{교류 최대 허용 접촉전압 } \mathbf{670}\ \mathrm{V} \;(\text{지속시간 짧을 때})}
$$

$$
\boxed{\text{\textbf{작업장}}\text{ 및 유사 장소 } \mathbf{25}\ \mathrm{V} \text{ 이하}}
$$

$$
\text{\textbf{지속시간이 길수록 낮게}} \;-\; \text{kec.1.2의 전압 × 시간}
$$

$$
\text{\textbf{작업장이 가장 엄격}} \;-\; \text{오래 머무니}
$$

$$
\boxed{\text{\textbf{670 vs 25}}} \;-\; \text{잠깐 vs 오래}
$$

### 왜 이렇게 다른가

$$
\text{\textbf{승강장}}\text{은 잠깐} \;-\; \text{높아도 짧으면}
$$

$$
\text{\textbf{작업장}}\text{은 오래} \;-\; \text{낮아야}
$$

$$
\text{\textbf{전압 × 시간 = 위험}}(\text{kec.1.2}) \;-\; \text{규정 전체의 원리}
$$

## 접촉전압 감소 방법 (461.3)

| 방법 | |
|---|---|
| **레일 본딩** | 레일끼리 연결해 저항↓ |
| **등전위본딩** | 전위를 같게 (kec.1.5) |
| **레일 전위 제한장치** | 위험 시 접지 |
| **절연** | 승강장 바닥 |

$$
\boxed{\text{\textbf{저항을 낮추거나 전위를 같게}}}
$$

$$
V = IR \;\Longrightarrow\; R \downarrow \;\Longrightarrow\; V \downarrow
$$

$$
\text{\textbf{레일을 굵게・많이 연결}} \;-\; \text{귀선 저항 감소}
$$

## 누설전류 간섭 방지 (461.5)

$$
\boxed{\text{\textbf{직류 누설전류}} \;\Longrightarrow\; \text{\textbf{전식}}}(\text{kec.4.2})
$$

$$
\text{\textbf{레일에서 땅으로 샌 전류}}\text{가 매설 금속을 부식}
$$

$$
\text{\textbf{수도관・가스관・매설 케이블}}
$$

| 대책 | |
|---|---|
| **배류법** | 샌 전류를 되돌린다 |
| **레일 절연** | 애초에 안 새게 |
| **강제 배류** | 전원으로 되돌림 |

$$
\text{\textbf{직류 철도 특유}} \;-\; \text{교류는 상쇄}
$$

## 전자파 장해 방지 (461.6)

$$
\text{\textbf{인버터・급전이 만드는 전자파}}(\text{pw.7.3})
$$

$$
\text{\textbf{kec.1.2의 113.6}}(\text{EMC})
$$

$$
\text{\textbf{mc.3.3의 인버터}}\text{가 원인}
$$

$$
\text{\textbf{신호설비・통신에 장해}}
$$

## 통신 유도 장해 방지 (461.7)

$$
\text{\textbf{kec.3.7의 전력유도}}\text{와 같다}
$$

$$
\text{\textbf{정전유도 ・ 전자유도}}(\text{pw.7.3})
$$

$$
\text{\textbf{AT급전}}\text{이 유도를 줄인다}(\text{kec.4.2})
$$

$$
\text{\textbf{광섬유}}\text{로 근본 해결}(\text{kec.3.7})
$$

## 정리

$$
\boxed{\text{\textbf{레일 전위}}\text{가 철도 특유의 위험}} \;-\; \text{귀선전류 × 레일저항}
$$

$$
\boxed{\text{접촉전압: 일반 } \mathbf{670}\ \mathrm{V}, \text{ 작업장 } \mathbf{25}\ \mathrm{V} \text{ 이하}}
$$

| 위험 | 대책 |
|---|---|
| **레일 전위** | 본딩 · 등전위 |
| **전식** (직류) | 배류법 |
| **전자파·유도** | AT급전 · 광섬유 |

$$
\text{\textbf{전압 × 시간}} \;-\; \text{작업장이 낮은 이유}(\text{kec.1.2})
$$
