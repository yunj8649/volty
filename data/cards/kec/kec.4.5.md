---
id: kec.4.5
title: 전기철도의 전기철도차량 설비
status: reviewed
summary: 차량 역률은 0.8 이상이어야 한다. 회생제동은 발전한 전기를 계통에 돌려준다.
covers:
  - kec.4.5.1
formulas:
  - label: 차량의 역률 (KEC 441.4)
    tex: \text{유효전력 } \mathbf{200}\ \mathrm{kW} \text{ 이상이면 총 역률 } \mathbf{0.8} \text{ 이상}
    note: 계통에 무효전력 부담을 줄이려고.
  - label: 회생제동 (KEC 441.5)
    tex: \text{제동 시 \textbf{발전}} \;\Longrightarrow\; \text{계통에 \textbf{반환}}
    note: mc.1.8·mc.5.3의 회생제동. 에너지 절약.
  - label: 절연구간 통과 (KEC 441.1)
    tex: \text{\textbf{타행}}(\text{무동력})\text{으로 통과}
    note: 두 급전 구간을 잇지 않게.
traps:
  - '**유효전력 200kW 이상이면 역률 0.8 이상**이어야 한다.'
  - '**회생제동은 계통에 전기를 돌려준다** — mc.1.8·mc.5.3의 그것.'
  - '**절연구간은 타행으로** 통과한다 — 단락 방지.'
related:
  - mc.5.3
  - mc.5.4
  - kec.4.3
---

> KEC **440** (441 전기철도차량 설비의 일반사항) — 시행 2026. 1. 5. 기준

## 전기철도차량 설비의 일반사항

> KEC **441**

## 절연구간 (441.1)

$$
\boxed{\text{\textbf{타행}}(\text{무동력})\text{으로 통과}}
$$

$$
\text{\textbf{두 급전 구간의 경계}}(\text{kec.4.3})
$$

$$
\text{\textbf{팬터그래프가 두 구간을 이으면}} \;\Longrightarrow\; \text{\textbf{단락}}
$$

$$
\text{\textbf{그래서 전기를 끊고 관성으로}}
$$

## 팬터그래프 (441.2~441.3)

$$
\text{\textbf{집전장치}} \;-\; \text{전차선에서 전기를 받는다}
$$

$$
\text{\textbf{전차선과의 상호작용}}\text{을 고려}
$$

$$
\text{\textbf{튀지 않게}} \;-\; \text{튀면 아크}(\text{mc.7.5})
$$

$$
\text{\textbf{kec.4.4의 지그재그 편위}}\text{와 이어진다}
$$

## 차량의 역률 (441.4)

$$
\boxed{\text{유효전력 } \mathbf{200}\ \mathrm{kW} \text{ 이상이면 총 역률 } \mathbf{0.8} \text{ 이상}}
$$

$$
\text{\textbf{유도성 역률}} \;-\; \text{전동기 부하}(\text{mc.5})
$$

### 왜 역률을 규제하나

$$
\text{\textbf{역률이 나쁘면}} \;\Longrightarrow\; \text{\textbf{무효전력}}\text{을 계통에서 끌어옴}(\text{pw.2.6})
$$

$$
\text{\textbf{계통에 부담}} \;-\; \text{전압강하・손실}
$$

$$
\boxed{\text{\textbf{철도가 계통을 덜 괴롭히게}}}(\text{kec.4.2})
$$

$$
\text{\textbf{인버터 제어}}(\text{mc.5.4})\text{로 역률을 개선}
$$

$$
\text{\textbf{PWM 컨버터}}\text{는 역률 1에 가깝게}(\text{mc.3.3})
$$

### 회생제동 시

$$
\text{\textbf{전압을 제한 범위로 유지}}\text{하려 \textbf{유도성 역률을 낮출 수}}
$$

$$
\text{\textbf{동력 운전 시}}\text{는 \textbf{용량성 역률}}\text{도}
$$

$$
\text{\textbf{상황에 따라 역률을 조절}} \;-\; \text{전압 관리}
$$

## 회생제동 (441.5)

$$
\boxed{\text{제동 시 \textbf{발전}} \;\Longrightarrow\; \text{계통에 \textbf{반환}}}
$$

$$
\text{\textbf{mc.1.8・mc.5.3에서 본 그것}}
$$

$$
\text{\textbf{전동기를 발전기로}} \;-\; \text{운동에너지를 전기로}
$$

$$
\text{\textbf{내리막・감속}} \;\Longrightarrow\; \text{\textbf{다른 열차가 쓴다}}
$$

$$
\boxed{\text{\textbf{에너지 절약}}} \;-\; \text{제동 에너지를 버리지 않는다}
$$

### 직류의 회생 문제

$$
\text{\textbf{받아줄 열차가 없으면}} \;\Longrightarrow\; \text{\textbf{전압 상승}}
$$

$$
\text{\textbf{최고 비영구 전압까지 상승 허용}}(\text{kec.4.2의 표 411.2-1})
$$

$$
750\ \mathrm{V} \text{ 계통: 회생 시 } 1{,}000\ \mathrm{V} \;/\; 1{,}500\ \mathrm{V} \text{ 계통: } 1{,}950\ \mathrm{V}
$$

$$
\text{\textbf{저항으로 태우거나}}(\text{발전제동}) \;-\; \text{못 돌려주면}
$$

$$
\text{\textbf{전기저장장치}}(\text{kec.5.2})\text{로 저장} \;-\; \text{요즘 방식}
$$

$$
\boxed{\text{\textbf{회생 → 저장 → 재사용}}}
$$

## 전기위험방지 보호대책 (441.6)

$$
\text{\textbf{차량 내 승객・승무원}}\text{ 보호}
$$

$$
\text{\textbf{kec.2.2의 감전 보호}}\text{를 차량에}
$$

$$
\text{\textbf{차체 접지}} \;-\; \text{레일을 통해}
$$

## 정리

$$
\boxed{\text{유효전력 } \mathbf{200}\ \mathrm{kW} \text{ 이상} \;\Longrightarrow\; \text{역률 } \mathbf{0.8} \text{ 이상}}
$$

$$
\boxed{\text{\textbf{회생제동}}: \text{발전} \to \text{반환} \to \text{저장}}
$$

$$
\text{\textbf{절연구간은 타행}} \;-\; \text{단락 방지}
$$

$$
\text{\textbf{mc.5.4의 인버터}}\text{가 역률・회생을 다 해결} \;-\; \text{반도체가 철도를 바꿨다}
$$
