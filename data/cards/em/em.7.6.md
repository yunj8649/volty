---
id: em.7.6
title: 전자유도에 의한 전계
status: reviewed
summary: 시변 자계는 도체가 없어도 빈 공간에 전계를 만든다. 이 전계는 회전하고, 전위를 정의할 수 없다.
covers:
  - em.7.6.1
formulas:
  - label: 유도 전계 (적분형)
    tex: \oint_C E \cdot dl = -\dfrac{d\phi}{dt}
    note: 정전계의 $\oint E \cdot dl = 0$ 이 깨진다.
  - label: 유도 전계 (미분형)
    tex: \nabla \times E = -\dfrac{\partial B}{\partial t}
    note: 맥스웰 제2방정식.
  - label: 벡터 포텐셜로 쓴 전계
    tex: E = -\nabla V - \dfrac{\partial A}{\partial t}
    note: 앞항은 전하가 만든 몫, 뒷항은 시변 자계가 만든 몫.
traps:
  - '**도체가 없어도 전계가 생긴다.** 코일은 그 전계를 눈에 보이게 해주는 장치일 뿐이고,
    빈 공간에도 전계는 이미 있다.'
  - 유도 전계는 **보존장이 아니다.** 한 바퀴 돌면 일이 0이 아니라서 전위를 정의할 수
    없다. 폐곡선 모양의 전기력선이 생긴다.
  - 정전계의 전기력선은 (+)에서 (−)로 가는 열린 선인데, 유도 전계의 전기력선은
    **폐곡선**이다. 자계처럼 생겼다.
related:
  - em.7.1
  - em.1.5
  - em.8.2
---

## 전자유도에 의한 전계

패러데이 법칙을 보통은 "코일에 기전력이 생긴다"고 읽는다. 그런데 더 근본적인 해석이
있다.

$$
\oint_C E \cdot dl = -\dfrac{d\phi}{dt}
$$

이 식 어디에도 **도체가 없다.** 그냥 공간의 어떤 폐곡선 $C$ 에 대한 식이다.

$$
\text{시변 자계는 그 주위 \textbf{공간}에 전계를 만든다}
$$

코일이 있으면 그 전계가 자유전자를 밀어 전류가 흐르니 눈에 보이는 것뿐이다. **코일이
없어도 전계는 이미 거기 있다.**

이 관점이 왜 중요한가. 이게 없으면 **전자파가 성립하지 않는다.** 전자파는 도체 하나
없는 빈 공간을 날아가는데, 그때 전계와 자계가 서로를 만들어내며 간다. "자계 변화가
공간에 전계를 만든다"를 받아들여야 그게 이해된다.

## 이 전계는 정전계와 다르다

같은 $E$ 인데 성질이 완전히 다르다.

| | 정전계 (전하가 만듦) | 유도 전계 (시변 자계가 만듦) |
|---|---|---|
| 원천 | 전하 | **시변 자계** |
| 회전 | $\nabla \times E = 0$ | $\nabla \times E = -\dfrac{\partial B}{\partial t}$ |
| $\oint E \cdot dl$ | $0$ | $-\dfrac{d\phi}{dt}$ |
| 보존장 | **그렇다** | **아니다** |
| 전위 | 정의된다 | **정의 안 된다** |
| 전기력선 | (+)→(−), **열린 선** | **폐곡선** |

### 전위를 정의할 수 없다

앞서 전위가 정의되는 근거가 **보존장**이라고 했다. 경로에 무관하게 일이 정해져야
"그 점의 전위"라는 값이 하나로 나온다.

유도 전계는 $\oint E \cdot dl \neq 0$ 이다. 한 바퀴 돌아 제자리에 왔는데 일이 0이
아니다. 그러면 같은 점의 전위가 여러 값이 되어 버린다. **전위라는 개념 자체가 성립하지
않는다.**

이건 앞서 자위가 다가함수였던 것과 같은 상황이다. 전류 주위를 돌면 자위가 계속
늘어났듯, 변하는 자속 주위를 돌면 전위가 계속 변한다.

### 전기력선이 폐곡선이다

정전계의 전기력선은 (+)전하에서 시작해 (−)전하에서 끝난다. 시작과 끝이 있는 **열린
선**이다.

유도 전계는 만들어낸 전하가 없다. 그러니 시작할 데도 끝날 데도 없어서 **폐곡선**을
이룬다. 변하는 자속을 **감아 도는** 모양이다.

$$
\nabla \cdot E = 0 \quad(\text{전하가 없으므로}), \qquad \nabla \times E \neq 0
$$

**자계처럼 생겼다.** 자속선이 전류를 감아 돌듯, 유도 전계는 변하는 자속을 감아 돈다.
전기와 자기가 대칭에 가까워지는 지점이다.

## 완전한 전계

실제 공간의 전계는 두 몫의 합이다.

$$
E = \underbrace{-\nabla V}_{\text{전하가 만든 몫}} \; \underbrace{-\dfrac{\partial A}{\partial t}}_{\text{시변 자계가 만든 몫}}
$$

$A$ 는 앞서 나온 **벡터 포텐셜**($B = \nabla \times A$)이다.

- 첫 항 — 보존장이고 회전이 없다. 정전계다.
- 둘째 항 — 회전하고 전위가 없다. 유도 전계다.

정전계만 다룰 때는 $\dfrac{\partial A}{\partial t} = 0$ 이라 익숙한
$E = -\nabla V$ 로 돌아간다.

### 확인해보기

$B = \nabla \times A$ 를 패러데이 법칙에 넣어보면 이 식이 나온다.

$$
\nabla \times E = -\dfrac{\partial B}{\partial t} = -\dfrac{\partial}{\partial t}(\nabla \times A) = -\nabla \times \dfrac{\partial A}{\partial t}
$$

$$
\nabla \times \left(E + \dfrac{\partial A}{\partial t}\right) = 0
$$

회전이 0인 벡터는 어떤 스칼라의 기울기로 쓸 수 있다(벡터 항등식
$\nabla \times \nabla V = 0$). 그래서

$$
E + \dfrac{\partial A}{\partial t} = -\nabla V \quad\Longrightarrow\quad E = -\nabla V - \dfrac{\partial A}{\partial t}
$$

앞서 "$\mathrm{div}\,B = 0$ 이 벡터 포텐셜의 존재를 보장한다"고 했는데, 여기서는
"$\mathrm{rot}(E + \partial A/\partial t) = 0$ 이 스칼라 포텐셜의 존재를 보장한다."
같은 논리 구조다.

## 왜 이게 KVL을 깨는가

앞 카드에서 인덕터가 있으면 KVL이 깨진다고 했다. 이제 이유가 명확하다.

KVL의 근거가 $\oint E \cdot dl = 0$ 인데, 자속이 변하는 회로에서는

$$
\oint E \cdot dl = -\dfrac{d\phi}{dt} \neq 0
$$

이다. **회로를 한 바퀴 돌면 전압의 합이 0이 아니다.**

실무에서는 이걸 **유도기전력을 전압원으로 취급**해서 우회한다.

$$
\sum V + \left(-L\dfrac{di}{dt}\right) = 0 \quad\Longrightarrow\quad \sum V = L\dfrac{di}{dt}
$$

인덕터를 "전압 강하가 $L\dfrac{di}{dt}$ 인 소자"로 보면 KVL이 다시 성립하는 것처럼
쓸 수 있다. 회로이론에서 인덕터를 그렇게 다루는 이유다.

**엄밀히는 KVL이 깨진 건데, 깨진 몫을 소자로 옮겨 담아 형식을 지킨 것**이다.
회로이론 과목에서 아무 의심 없이 쓰는 $v_L = L\dfrac{di}{dt}$ 의 뒷면에 이런 사정이
있다.
