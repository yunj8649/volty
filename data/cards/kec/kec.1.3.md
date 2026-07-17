---
id: kec.1.3
title: 전선
status: reviewed
summary: 색상표가 이 단원의 전부다. 갈흑회파녹노 — 옛 기준과 완전히 다르다.
covers:
  - kec.1.3.1
  - kec.1.3.2
  - kec.1.3.3
formulas:
  - label: 전선 식별 색상 (KEC 121.2 표 121.2-1)
    tex: \text{L1 \textbf{갈색}} \cdot \text{L2 \textbf{검은색}} \cdot \text{L3 \textbf{회색}} \cdot \text{N \textbf{파란색}} \cdot \text{보호도체 \textbf{녹색-노란색}}
    note: '**"갈흑회파녹노"**. 옛 기준(흑적청)과 완전히 다르다.'
  - label: 접속 시 세기 (KEC 123-1)
    tex: \text{전선의 세기를 } \mathbf{20\%} \text{ 이상 감소시키지 말 것}
    note: 인장하중 기준. **80% 이상 유지**해야 한다는 뜻.
  - label: 병렬 사용 (KEC 123-6)
    tex: \text{구리 } \mathbf{50}\ \mathrm{mm^2} \text{ 이상}, \qquad \text{알루미늄 } \mathbf{70}\ \mathrm{mm^2} \text{ 이상}
    note: 같은 도체·재료·길이·굵기여야 한다.
  - label: 캡타이어 케이블 접속
    tex: \text{공칭단면적 } \mathbf{10}\ \mathrm{mm^2} \text{ 이상이면 예외 조건}
    note: 그 미만은 접속기·접속함을 반드시 써야.
traps:
  - '**보호도체는 녹색-노란색**이다. 녹색 단색이 아니다. 이 조합은 보호도체 전용.'
  - '**세기를 20% 이상 감소시키지 말 것** — 80% 이상 유지하라는 뜻이다. 20% 유지가 아니다.'
  - '**병렬 사용은 구리 50㎟, 알루미늄 70㎟ 이상**. 알루미늄이 더 굵어야 한다.'
  - '**전기화학적 성질이 다른 도체**(구리-알루미늄)를 접속하면 전기적 부식이 생긴다.'
related:
  - kec.1.1
  - kec.1.5
  - ct.1.2
---

> KEC **120** (121 전선의 선정 및 식별 · 122 전선의 종류 · 123 전선의 접속)
> — 시행 2026. 1. 5. 기준

## 전선의 선정 및 식별

### 일반 요구사항 (121.1)

$$
\text{전선은 \textbf{사용 상태의 온도}}\text{에 견딜 것}
$$

$$
\text{\textbf{설치장소의 환경조건}}\text{과 \textbf{전기・기계적 응력}}\text{에 견딜 것}
$$

$$
\text{\textbf{KS}}\text{에 적합하거나 \textbf{동등 이상}}
$$

$$
\text{KS가 없으면} \;\Longrightarrow\; \text{\textbf{IEC ・ EN ・ NEC}}\text{를 기준으로}
$$

$$
\boxed{\text{\textbf{KEC의 정신}} \;-\; \text{국제 표준을 받아들인다}(\text{kec.1.1})}
$$

### 전선의 식별 — 이 단원의 핵심

$$
\boxed{
\begin{array}{c|c}
\text{상(문자)} & \text{색상} \\ \hline
\mathbf{L1} & \textbf{갈색} \\
\mathbf{L2} & \textbf{검은색} \\
\mathbf{L3} & \textbf{회색} \\
\mathbf{N} & \textbf{파란색} \\
\textbf{보호도체} & \textbf{녹색-노란색}
\end{array}
}
$$

$$
\text{\textbf{"갈흑회파녹노"}}
$$

$$
\text{\textbf{L1-L2-L3-N-PE}} \;\Longrightarrow\; \text{\textbf{갈-흑-회-파-녹노}}
$$

### 옛 기준과 완전히 다르다

| | **옛 기준** | **KEC** |
|---|---|---|
| **1상** | 흑색 | **갈색** |
| **2상** | 적색 | **검은색** |
| **3상** | 청색 | **회색** |
| **중성선** | 백색 | **파란색** |
| **접지** | 녹색 | **녹색-노란색** |

$$
\boxed{\text{\textbf{하나도 안 맞는다}}}
$$

$$
\text{\textbf{옛 자료로 외우면 전멸}} \;-\; \text{5과목이 규정인 이유}
$$

$$
\text{\textbf{IEC 60446}}\text{을 그대로 들여온 것}
$$

### 보호도체는 녹색-노란색

$$
\boxed{\text{\textbf{녹색 단색이 아니다}}}
$$

$$
\text{\textbf{녹색-노란색 조합은 보호도체 전용}} \;-\; \text{다른 데 쓰면 안 된다}
$$

$$
\text{\textbf{국제적으로 통일된 약속}} \;-\; \text{어느 나라에서나 같다}
$$

**색맹을 배려한 설계**이기도 하다. 두 색의 조합이라 단색보다 구별이 쉽다.

$$
\text{\textbf{중성선이 파란색}}\text{인 것도} \;-\; \text{녹색-노란색과 안 헷갈리게}
$$

### 나도체의 식별

$$
\text{\textbf{색상 식별이 종단・연결 지점에서만}} \text{ 되는 경우}
$$

$$
\text{\textbf{도색 ・ 밴드 ・ 색 테이프}}\text{로 \textbf{반영구적}}\text{으로 표시}
$$

$$
\text{\textbf{나도체는 색을 못 입히니}} \;-\; \text{끝에만 표시}
$$

$$
\text{\textbf{모선}}(\text{busbar})\text{이 그렇다} \;-\; \text{구리 막대에 색 테이프}
$$

## 전선의 종류

$$
\text{\textbf{다섯 가지}}
$$

| 조 | 종류 |
|---|---|
| **122.1** | **절연전선** |
| **122.2** | **코드** |
| **122.3** | **캡타이어케이블** |
| **122.4** | **저압케이블** |
| **122.5** | **고압 및 특고압케이블** |

$$
\text{\textbf{공통 원칙}}: \text{\textbf{전기용품안전관리법}} \text{ 또는 } \text{\textbf{KS}} \text{ 적합}
$$

### 캡타이어케이블

$$
\text{\textbf{이동용}} \;-\; \text{고무로 튼튼하게 감싼 케이블}
$$

$$
\text{KS C IEC 60502-1} \;-\; \text{정격 } 1\ \mathrm{kV} \sim 30\ \mathrm{kV}
$$

$$
\text{\textbf{휘어지고 밟혀도 되는} 곳} \;-\; \text{이동 기계, 가설 공사}
$$

### 코드

$$
\text{\textbf{안전인증}}\text{을 받은 것만}
$$

$$
\text{\textbf{규정에서 허용된 경우에 한하여}} \;-\; \text{아무 데나 못 쓴다}
$$

$$
\text{\textbf{가전제품의 전원선}} \;-\; \text{고정 배선에는 못 쓴다}
$$

## 전선의 접속

$$
\boxed{\text{\textbf{전기저항을 증가시키지 말 것}}}
$$

$$
\text{\textbf{대원칙}} \;-\; \text{나머지는 이걸 위한 방법}
$$

$$
\text{\textbf{접속점이 약점}}\text{이 된다} \;-\; \text{저항 } \uparrow \;\Longrightarrow\; \text{발열} \;\Longrightarrow\; \text{화재}
$$

**mc.7.4의 열동계전기**가 못 잡는 사고다. 접속 불량은 **국부 발열**이라 전체 전류는
정상이다.

$$
\text{\textbf{전기화재의 주요 원인}} \;-\; \text{그래서 규정이 까다롭다}
$$

### ① 나전선 상호 (123-1)

$$
\boxed{\textbf{세기를 } \mathbf{20\%} \text{ 이상 감소시키지 말 것}}
$$

$$
\text{\textbf{인장하중}}\text{으로 표시}
$$

$$
\textbf{80} \% \textbf{ 이상 유지}\text{하라는 뜻} \;-\; \text{20} \% \text{ 유지가 아니다}
$$

$$
\boxed{\text{\textbf{시험 함정}}} \;-\; \text{"20} \% \text{"라는 숫자만 보고 헷갈린다}
$$

$$
\text{\textbf{접속관 기타의 기구}}\text{를 사용할 것}
$$

$$
\text{\textbf{예외}}: \text{가공전선 상호 ・ 전차선 상호 ・ 갱도 안} \;-\; \text{기술상 곤란하면}
$$

### ② 절연전선 상호 (123-2)

$$
\text{①의 규정 + \textbf{절연}}
$$

$$
\text{\textbf{절연물과 동등 이상의 절연성능}}\text{이 있는 접속기} \text{ 또는 } \text{피복}
$$

$$
\boxed{\text{\textbf{절연도 원래대로}}} \;-\; \text{전기적으로도 절연적으로도 원상 복구}
$$

### ③ 코드·캡타이어 상호 (123-3)

$$
\text{\textbf{코드 접속기 ・ 접속함}} \text{ 기타의 기구}
$$

$$
\text{\textbf{예외}}: \text{공칭단면적 } \mathbf{10}\ \mathrm{mm^2} \text{ 이상인 캡타이어 케이블}
$$

$$
\text{그때는 \textbf{유화}}(\text{硫化})\text{하거나 \textbf{금속제 방호장치}}
$$

$$
\text{\textbf{굵으면 기구를 못 쓰니}} \;-\; \text{직접 접속하고 보강}
$$

### ④ 다른 금속끼리 (123-4)

$$
\boxed{\text{\textbf{전기적 부식}}(\text{電氣的腐蝕})\text{이 생기지 않도록}}
$$

$$
\text{\textbf{구리와 알루미늄}}\text{을 접속하면} \;\Longrightarrow\; \text{\textbf{갈바닉 부식}}
$$

$$
\text{\textbf{이온화 경향이 다르니}} \;\Longrightarrow\; \text{습기가 있으면 \textbf{전지}}\text{가 된다}
$$

$$
\text{\textbf{알루미늄이 녹는다}} \;-\; \text{이온화 경향이 크니}
$$

$$
\text{\textbf{대책}}: \text{\textbf{동-알 접속용 단자}}(\text{CU-AL})\text{를 쓴다}
$$

**em.4.3의 전지 작용**이 여기서 사고를 만든다. 두 금속 + 전해질(습기) = 전지다.

$$
\text{\textbf{ct.1.2의 알루미늄}}\text{이 왜 문제인지} \;-\; \text{싸고 가벼운데 부식이}
$$

### ⑤ 병렬 사용 (123-6)

$$
\boxed{\text{구리 } \mathbf{50}\ \mathrm{mm^2} \text{ 이상}, \qquad \text{알루미늄 } \mathbf{70}\ \mathrm{mm^2} \text{ 이상}}
$$

$$
\text{\textbf{같은 도체 ・ 같은 재료 ・ 같은 길이 ・ 같은 굵기}}
$$

$$
\text{\textbf{같은 극의 각 전선은 동일한 터미널러그}}\text{에}
$$

$$
\text{\textbf{알루미늄이 더 굵어야}} \;-\; \text{도전율이 61} \% \text{니}(\text{ct.1.2})
$$

$$
\dfrac{50}{0.61} \approx 82 \;-\; \text{그런데 규정은 } 70
$$

$$
\text{\textbf{정확한 비례는 아니다}} \;-\; \text{규정은 실용적 값}
$$

### 왜 조건이 까다로운가

$$
\text{\textbf{병렬인데 굵기가 다르면}} \;\Longrightarrow\; \text{\textbf{전류가 불균등}}\text{하게 나뉜다}
$$

$$
\text{ct.1.2의 \textbf{분류}}: I_1 = I\dfrac{R_2}{R_1+R_2} \;-\; \text{저항이 작은 쪽에 더 많이}
$$

$$
\text{\textbf{한 가닥에 몰리면}} \;\Longrightarrow\; \text{\textbf{그 가닥만 과열}}
$$

$$
\boxed{\text{\textbf{전체는 정상인데 한 가닥이 탄다}}}
$$

$$
\text{\textbf{그래서 같은 것으로만}} \;-\; \text{도체 ・ 재료 ・ 길이 ・ 굵기 넷 다}
$$

$$
\text{\textbf{길이까지 같아야}} \;-\; R = \rho\dfrac{l}{A} \text{ 니 길이도 저항}
$$

**회로이론이 규정을 설명한다.** 분류 법칙 하나가 네 가지 조건을 전부 낳는다.

$$
\text{\textbf{굵어야 하는 이유}}\text{도} \;-\; \text{가는 걸 여러 가닥 쓰면 관리가 어려우니}
$$

## 정리

$$
\boxed{
\begin{array}{c|c}
\mathbf{L1} & \textbf{갈색} \\
\mathbf{L2} & \textbf{검은색} \\
\mathbf{L3} & \textbf{회색} \\
\mathbf{N} & \textbf{파란색} \\
\textbf{PE} & \textbf{녹색-노란색}
\end{array}
} \qquad \text{\textbf{"갈흑회파녹노"}}
$$

| 접속 | 규정 |
|---|---|
| **세기** | **20% 이상 감소 금지** (= 80% 이상 유지) |
| **저항** | **증가시키지 말 것** (대원칙) |
| **병렬** | **구리 50㎟ · 알루미늄 70㎟** 이상, 같은 것끼리 |
| **다른 금속** | **전기적 부식** 방지 |
| **캡타이어** | $10\ \mathrm{mm^2}$ 이상이면 예외 |

$$
\text{\textbf{색상표가 이 단원의 전부}} \;-\; \text{옛 기준과 하나도 안 맞으니 반드시 새로}
$$
