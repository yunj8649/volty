---
id: kec.4.6
title: 전기철도의 설비를 위한 보호
status: reviewed
summary: 보호협조와 절연협조가 핵심이다. 계통에서 배운 것이 철도에 그대로 적용된다.
covers:
  - kec.4.6.1
formulas:
  - label: 보호협조 (KEC 451.1)
    tex: \text{사고 시 \textbf{그 구간만} 차단} \;-\; \text{선택성 + 후비 보호}
    note: mc.7.6의 보호협조. 정전 범위 최소화.
  - label: 절연협조 (KEC 451.2)
    tex: \text{\textbf{피뢰기}}\text{로 서지를 제한} \;-\; \text{기기 절연을 보호}
    note: pw.4.2의 절연협조. BIL 체계.
traps:
  - '**보호협조는 사고점에 가까운 것이 먼저** 차단한다(mc.7.6).'
  - '**절연협조는 피뢰기가 서지를 제한**해 기기를 지킨다(pw.4.2).'
related:
  - mc.7.6
  - pw.4.2
  - kec.4.4
---

> KEC **450** (451 설비보호의 일반사항) — 시행 2026. 1. 5. 기준

## 설비보호의 일반사항

> KEC **451**

## 보호협조 (451.1)

$$
\boxed{\text{사고 시 \textbf{그 구간만} 차단}}
$$

$$
\text{\textbf{mc.7.6에서 본 그것}}
$$

$$
\text{\textbf{선택성}} + \text{\textbf{후비 보호}}
$$

$$
\text{\textbf{말단이 먼저, 상위가 나중}}
$$

$$
\boxed{\text{\textbf{정전 범위를 최소화}}}(\text{kec.4.4의 SCADA})
$$

$$
\text{\textbf{한 구간 사고로 전 노선을 세우지 않게}}
$$

$$
\text{\textbf{급전구분소}}\text{로 구간을 나눈다}(\text{kec.4.1})
$$

## 절연협조 (451.2)

$$
\boxed{\text{\textbf{피뢰기}}\text{로 서지를 제한}}
$$

$$
\text{\textbf{pw.4.2에서 본 그것}}
$$

$$
\text{\textbf{여러 기기의 절연강도를 조율}}
$$

$$
\text{\textbf{피뢰기의 제한전압}} < \text{\textbf{기기의 내충격전압}}(\text{BIL})
$$

$$
\boxed{\text{\textbf{피뢰기가 먼저 방전}}\text{해 기기를 지킨다}}
$$

$$
\text{\textbf{서지가 오면 피뢰기가 받아낸다}} \;-\; \text{기기는 무사}
$$

### 왜 철도에 중요한가

$$
\text{\textbf{전차선이 옥외에 노출}} \;-\; \text{뇌 서지}
$$

$$
\text{\textbf{긴 선로}} \;-\; \text{유도뢰 확률 높음}(\text{kec.1.6})
$$

$$
\text{\textbf{차량 전자기기}}\text{가 약하다} \;-\; \text{서지에 취약}
$$

$$
\boxed{\text{\textbf{절연협조가 필수}}}
$$

## 피뢰기의 선정 (451.4)

$$
\text{\textbf{정격전압 ・ 제한전압}}\text{을 계통에 맞게}
$$

$$
\text{\textbf{mc.7.5의 산화아연}}(\mathrm{ZnO})\text{ 피뢰기}
$$

$$
\text{\textbf{갭리스}} \;-\; \text{평소 절연, 서지에 도통}
$$

$$
\textbf{교류 } \text{ 25} \  \mathrm{kV}\text{용, } \textbf{직류 } \text{ 1{,}500} \  \mathrm{V}\text{용 따로}
$$

## 정리

$$
\boxed{\text{\textbf{보호협조}}: \text{그 구간만 차단}(\text{mc.7.6})}
$$

$$
\boxed{\text{\textbf{절연협조}}: \text{피뢰기로 서지 제한}(\text{pw.4.2})}
$$

$$
\text{\textbf{계통에서 배운 두 협조}}\text{가 철도에 그대로}
$$

$$
\text{\textbf{피뢰기 제한전압} < \text{기기 BIL}} \;-\; \text{절연협조의 핵심}
$$
