---
id: kec.2.2
title: 안전을 위한 보호
status: reviewed
summary: 네 가지 보호대책이 있고, 차단시간 표가 핵심이다. TT가 TN보다 빨라야 한다.
covers:
  - kec.2.2.1
  - kec.2.2.2
  - kec.2.2.3
  - kec.2.2.4
formulas:
  - label: 네 가지 보호대책 (KEC 211.1.2)
    tex: \text{\textbf{전원 자동차단}} \cdot \text{\textbf{이중・강화절연}} \cdot \text{\textbf{전기적 분리}} \cdot \text{\textbf{SELV・PELV}}
    note: 211.2 / 211.3 / 211.4 / 211.5.
  - label: 최대 차단시간 (표 211.2-1)
    tex: \text{TN } \mathbf{0.4}\ \text{초}, \qquad \text{TT } \mathbf{0.2}\ \text{초} \quad(120 < U_0 \leq 230\ \mathrm{V} \text{ 교류})
    note: '**32A 이하 분기회로**. 우리나라 220V가 이 구간.'
  - label: 간선의 차단시간
    tex: \text{TN } \mathbf{5}\ \text{초 이하}, \qquad \text{TT } \mathbf{1}\ \text{초 이하}
    note: 배전회로(간선)는 분기회로보다 느려도 된다.
  - label: 전압 규정 (211.1.2)
    tex: \text{\textbf{교류는 실효값}}, \qquad \text{\textbf{직류는 리플프리}}
    note: 별도 언급이 없는 한.
traps:
  - '**TT가 TN보다 차단시간이 짧다**(0.2 vs 0.4초). 지락전류가 작아 위험하니 더 빨리.'
  - '**표 211.2-1은 32A 이하 분기회로**용이다. 간선은 TN 5초·TT 1초.'
  - '**U₀는 대지 기준 공칭전압**이다. 선간전압이 아니다.'
  - '**직류는 리플프리**로 본다. 맥동이 있으면 더 위험하다.'
related:
  - kec.2.1
  - kec.1.2
  - mc.7.4
---

> KEC **210** (211 감전에 대한 보호 · 212 과전류 · 213 과도과전압 · 214 열 영향)
> — 시행 2026. 1. 5. 기준
>
> **kec.1.2의 113**이 원칙이라면 **여기는 저압의 구체적 방법**이다.

## 감전에 대한 보호

> KEC **211**

### 일반 요구사항 (211.1.2)

$$
\boxed{\text{\textbf{교류는 실효값}}, \qquad \text{\textbf{직류는 리플프리}}}
$$

$$
\text{\textbf{별도의 언급이 없는 한}}
$$

$$
\text{\textbf{리플프리}} \;-\; \text{맥동이 작은 직류}(\text{kec.1.1의 용어})
$$

$$
\text{\textbf{맥동이 있으면}} \;\Longrightarrow\; \text{\textbf{최대값이 실효값보다 크다}} \;\Longrightarrow\; \text{더 위험}
$$

$$
\text{\textbf{mc.3.2의 맥동률}}\text{과 이어진다} \;-\; \text{정류만 하고 평활을 안 하면 리플프리가 아니다}
$$

### 보호대책의 구성

$$
\text{\textbf{가. 기본보호와 고장보호를 \textbf{독립적으로 조합}}}
$$

$$
\text{\textbf{나. 둘 다 제공하는 \textbf{강화된 보호}}}
$$

$$
\text{\textbf{다. \textbf{추가적 보호}}} \;-\; \text{특수설비・특수장소}
$$

$$
\text{\textbf{kec.1.1의 기본보호・고장보호}}\text{를 어떻게 조합하나}
$$

## 네 가지 보호대책

$$
\boxed{
\begin{array}{c|l}
\mathbf{211.2} & \textbf{전원의 자동차단} \\
\mathbf{211.3} & \textbf{이중절연 또는 강화절연} \\
\mathbf{211.4} & \textbf{전기적 분리} \;(\text{한 개의 기기에}) \\
\mathbf{211.5} & \textbf{SELV와 PELV에 의한 특별저압}
\end{array}
}
$$

$$
\text{\textbf{일반적으로 적용}}\text{하는 것}
$$

### 각각의 사상

| 대책 | 발상 |
|---|---|
| **자동차단** | **고장 나면 빨리 끊는다** |
| **이중절연** | **절연을 두 겹**으로 |
| **전기적 분리** | **회로를 떼어놓는다** |
| **특별저압** | **애초에 낮은 전압** |

$$
\boxed{\text{\textbf{끊거나 ・ 막거나 ・ 떼거나 ・ 낮추거나}}}
$$

$$
\text{\textbf{네 가지 다른 길}} \;-\; \text{하나만 골라도 된다}
$$

## 전원의 자동차단 (211.2)

$$
\text{\textbf{가장 흔한 대책}} \;-\; \text{보통 이걸 쓴다}
$$

$$
\text{\textbf{보호접지}} + \text{\textbf{보호등전위본딩}} + \text{\textbf{고장 시 자동차단}}
$$

$$
\boxed{\text{\textbf{셋이 한 묶음}}}
$$

$$
\text{\textbf{접지}}\text{로 길을 만들고 \textbf{본딩}}\text{으로 전위를 맞추고 \textbf{차단}}\text{으로 끊는다}
$$

### 표 211.2-1 — 최대 차단시간

$$
\boxed{\text{\textbf{32 A 이하 분기회로}}\text{에 적용} \;[\text{단위: 초}]}
$$

$$
\boxed{
\begin{array}{c|cc|cc|cc|cc}
& 50 < U_0 \leq 120 & & 120 < U_0 \leq 230 & & 230 < U_0 \leq 400 & & U_0 > 400 & \\
\text{계통} & \text{교류} & \text{직류} & \text{교류} & \text{직류} & \text{교류} & \text{직류} & \text{교류} & \text{직류} \\ \hline
\mathbf{TN} & 0.8 & [\text{비고1}] & \mathbf{0.4} & 5 & 0.2 & 0.4 & 0.1 & 0.1 \\
\mathbf{TT} & 0.3 & [\text{비고1}] & \mathbf{0.2} & 0.4 & 0.07 & 0.2 & 0.04 & 0.1
\end{array}
}
$$

$$
\text{\textbf{$U_0$ 는 대지에서 공칭교류전압 또는 직류 선간전압}}
$$

$$
\boxed{\text{\textbf{선간전압이 아니다}}} \;-\; \text{대지 기준}
$$

$$
\text{우리나라 } 220\ \mathrm{V} \;\Longrightarrow\; 120 < U_0 \leq 230 \text{ 구간}
$$

$$
\boxed{\text{\textbf{TN } 0.4 \text{ 초}, \qquad \text{TT } 0.2 \text{ 초}}}
$$

$$
\text{\textbf{가장 많이 나오는 값}}
$$

### TT가 왜 더 빠른가

$$
\boxed{\text{\textbf{TT는 지락전류가 작다}}}(\text{kec.2.1})
$$

$$
\text{\textbf{대지를 통해 돌아가니}} \;\Longrightarrow\; \text{대지 저항이 크다}
$$

$$
\text{\textbf{전류가 작으면}} \;\Longrightarrow\; \text{\textbf{접촉전압이 오래 걸린다}}?
$$

$$
\text{\textbf{아니다}} \;-\; \text{전류가 작아도 \textbf{접촉전압은 높을 수} 있다}
$$

$$
\text{\textbf{TT는 노출도전부가 독립 접지극}}\text{에 있으니}
$$

$$
\text{\textbf{지락 시 그 접지극의 전위가 뜬다}} \;\Longrightarrow\; \text{\textbf{만지면 위험}}
$$

$$
\text{\textbf{TN은 전원 접지점에 직결}}\text{이라 전위가 덜 뜬다}
$$

$$
\boxed{\text{\textbf{TT가 더 위험하니 더 빨리 끊는다}}}
$$

$$
\text{\textbf{그래서 TT엔 ELB}}(\text{mc.7.4}) \;-\; 0.03 \text{ 초면 } 0.2 \text{ 초를 훨씬 만족}
$$

### 간선은 느려도 된다

$$
\boxed{\text{\textbf{TN 배전회로}}(\text{간선}): \mathbf{5} \text{ 초 이하}}
$$

$$
\boxed{\text{\textbf{TT 배전회로}}(\text{간선}): \mathbf{1} \text{ 초 이하}}
$$

$$
\text{\textbf{분기회로보다 느슨}} \;-\; \text{사람이 직접 만질 일이 적으니}
$$

$$
\text{\textbf{mc.7.6의 보호협조}}\text{와 이어진다} \;-\; \text{상위일수록 늦게}
$$

$$
\text{\textbf{말단} } 0.4 \text{ 초} \to \text{\textbf{간선} } 5 \text{ 초} \;-\; \text{선택성}
$$

$$
\boxed{\text{\textbf{규정이 협조를 강제한다}}}
$$

### 자동차단이 안 되면

$$
\text{\textbf{"바"}}: \text{차단시간을 못 맞추면} \;\Longrightarrow\; \text{\textbf{보조 보호등전위본딩}}
$$

$$
\text{\textbf{끊을 수 없으면 전위를 같게}}
$$

$$
\text{\textbf{kec.1.5의 등전위본딩}}\text{이 대안이 된다}
$$

$$
\boxed{\text{\textbf{두 가지 길}} \;-\; \text{끊거나 ・ 전위를 같게 하거나}}
$$

### 자동차단이 필요 없는 경우

$$
\text{\textbf{"마"}}: \text{지락 시 출력전압이 } \textbf{교류 } \text{ 50} \  \mathrm{V} \text{ 또는 직류 } \text{ 120} \  \mathrm{V} \text{ 이하로 감소}\text{하면}
$$

$$
\text{\textbf{자동차단이 요구되지 않는다}}
$$

$$
\text{\textbf{특별저압 수준으로 떨어지면}} \;\Longrightarrow\; \text{\textbf{안전}}
$$

$$
50\ \mathrm{V} \cdot 120\ \mathrm{V} \;-\; \text{\textbf{ELV의 한계}}\text{와 같은 값}
$$

## SELV와 PELV (211.5)

$$
\boxed{\text{\textbf{특별저압}}(\text{ELV}) \;-\; \text{인체에 위험을 초래하지 않을 정도}}
$$

| | 회로 |
|---|---|
| **SELV** (Safety ELV) | **비접지** |
| **PELV** (Protective ELV) | **접지** |
| **FELV** (Functional ELV) | **기능적** — 안전용이 아님 |

$$
\boxed{\text{\textbf{S는 비접지, P는 접지}}}
$$

$$
\text{\textbf{kec.1.1의 용어 정의}}\text{에 그대로}
$$

$$
\text{교류 } 50\ \mathrm{V}, \text{ 직류 } 120\ \mathrm{V} \text{ 이하}
$$

### FELV는 다르다

$$
\text{\textbf{SELV・PELV의 요구조건이 충족되지 않고}} \text{ 둘이 필요치 않은 경우}
$$

$$
\boxed{\text{\textbf{FELV는 안전을 위한 게 아니다}}}
$$

$$
\text{\textbf{기능상}} \text{ 낮은 전압을 쓸 뿐}
$$

$$
\text{\textbf{그래서 감전보호로 인정 안 된다}} \;-\; \text{별도 보호가 필요}
$$

$$
\text{\textbf{kec.1.4의 절연저항}}: \text{FELV는 } 500\ \mathrm{V} \text{ 시험에 } 1.0\ \mathrm{M\Omega} \;-\; \text{SELV・PELV보다 엄격}
$$

$$
\boxed{\text{\textbf{이름이 비슷해도 성격이 다르다}}} \;-\; \text{시험 함정}
$$

## 이중절연 또는 강화절연 (211.3)

$$
\text{\textbf{기본절연 + 보조절연}} \;\text{또는}\; \text{\textbf{강화절연}}
$$

$$
\boxed{\text{\textbf{절연이 두 겹}}\text{이니 하나가 깨져도 안전}}
$$

$$
\text{\textbf{Class II 기기}} \;-\; \text{\textbf{접지가 필요 없다}}
$$

$$
\text{\textbf{□ 안에 □}} \;-\; \text{이중절연 기호}
$$

$$
\text{\textbf{전동공구 ・ 헤어드라이어}} \;-\; \text{2핀 플러그인 이유}
$$

$$
\text{\textbf{mc.6.2의 만능전동기}}\text{가 대체로 이중절연}
$$

## 전기적 분리 (211.4)

$$
\text{\textbf{한 개의 전기사용기기}}\text{에 전기를 공급하기 위한}
$$

$$
\text{\textbf{절연변압기}}\text{로 계통에서 떼어놓는다}
$$

$$
\boxed{\text{\textbf{대지와 연결이 없으니}} \;\Longrightarrow\; \text{한 점을 만져도 회로가 안 된다}}
$$

$$
\text{\textbf{새가 전선에 앉는 것}}\text{과 같은 원리}
$$

$$
\text{\textbf{한 개의 기기만}} \;-\; \text{여럿을 붙이면 그들끼리 회로가 생긴다}
$$

$$
\boxed{\text{\textbf{이게 조건}}} \;-\; \text{시험 함정}
$$

$$
\text{\textbf{욕실의 면도기용 콘센트}}\text{가 이것}
$$

## 과전류에 대한 보호

> KEC **212**

$$
\text{\textbf{kec.1.2의 113.4}}\text{를 구체화}
$$

$$
\text{\textbf{과부하 보호}} + \text{\textbf{단락 보호}}
$$

### 과부하 보호 조건

$$
\boxed{I_B \leq I_n \leq I_Z}
$$

$$
\boxed{I_2 \leq 1.45 \times I_Z}
$$

| 기호 | 뜻 |
|---|---|
| $I_B$ | **설계전류** (실제 쓰는) |
| $I_n$ | **보호장치 정격전류** |
| $I_Z$ | **전선의 허용전류** |
| $I_2$ | **보호장치의 동작전류** |

$$
\text{\textbf{설계 ≤ 정격 ≤ 허용}} \;-\; \text{순서가 자연스럽다}
$$

$$
\text{\textbf{1.45}}\text{가 핵심 숫자} \;-\; \text{전선이 잠깐 견디는 여유}
$$

$$
\text{\textbf{mc.7.6의 협조 곡선}}\text{이 이 부등식}
$$

### 단락 보호

$$
\text{\textbf{차단용량}} \geq \text{\textbf{예상 단락전류}}
$$

$$
\text{\textbf{mc.7.6의 차단용량}}\text{과 같은 이야기}
$$

$$
K^2S^2 \geq I^2t \;-\; \text{\textbf{열적 등가}}
$$

$$
\textbf{전선이 견디는 } \text{ I} ^2 \text{t } \text{ 가 차단기의 } \text{ I} ^2 \text{t } \text{ 보다 커야}
$$

$$
\text{\textbf{kec.1.2의 113.5}}\text{가 이것} \;-\; \text{끊을 때까지 버티는 쪽}
$$

## 과도과전압에 대한 보호

> KEC **213**

$$
\text{\textbf{뇌 서지 ・ 개폐 서지}}
$$

$$
\text{\textbf{SPD}}\text{로}(\text{mc.7.4} \cdot \text{kec.1.6})
$$

$$
\text{\textbf{pw.4.2의 절연협조}}\text{와 이어진다}
$$

$$
\text{\textbf{기기의 내충격전압}}\text{을 등급으로} \;-\; \text{I ・ II ・ III ・ IV}
$$

$$
\text{\textbf{전원에 가까울수록 높은 등급}} \;-\; \text{서지가 크게 들어오니}
$$

## 열 영향에 대한 보호

> KEC **214**

$$
\text{\textbf{kec.1.2의 113.3}}\text{을 구체화}
$$

$$
\text{\textbf{화재 방지}} + \text{\textbf{화상 방지}}
$$

$$
\text{\textbf{접촉 가능한 부분의 온도 한계}}\text{가 정해져 있다}
$$

| 부분 | 한계 |
|---|---|
| **손으로 잡는 것** (금속) | $55°\mathrm{C}$ |
| 손으로 잡는 것 (비금속) | $65°\mathrm{C}$ |
| **만질 수 있는 것** (금속) | $70°\mathrm{C}$ |
| 만질 수 있는 것 (비금속) | $80°\mathrm{C}$ |

$$
\text{\textbf{금속이 더 낮다}} \;-\; \text{\textbf{열전도가 좋아} 더 빨리 덴다}
$$

$$
\text{\textbf{같은 온도라도 금속이 더 뜨겁게 느껴진다}}
$$

$$
\boxed{\text{\textbf{물리가 규정의 숫자를 정한다}}}
$$

## 정리

$$
\boxed{\text{\textbf{네 대책}}: \text{자동차단} \cdot \text{이중절연} \cdot \text{전기적 분리} \cdot \text{SELV・PELV}}
$$

$$
\boxed{
\begin{array}{c|c|c}
& \text{TN} & \text{TT} \\ \hline
\mathbf{120 < U_0 \leq 230}\ \text{교류} & \mathbf{0.4}\ \text{초} & \mathbf{0.2}\ \text{초} \\
\text{간선} & \mathbf{5}\ \text{초} & \mathbf{1}\ \text{초}
\end{array}
}
$$

$$
\text{\textbf{TT가 더 빠르다}} \;-\; \text{전위가 더 뜨니 더 위험}
$$

$$
\boxed{I_B \leq I_n \leq I_Z, \qquad I_2 \leq 1.45 I_Z}
$$

$$
\text{\textbf{SELV 비접지 ・ PELV 접지 ・ FELV는 안전용이 아님}}
$$
