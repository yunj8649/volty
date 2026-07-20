import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/card_body.dart';

/// 계산 팁 모음. "이렇게 하면 쉽다" 식의 시험용 계산 요령·근사값·단축식을 모았다.
/// 문항마다 붙는 힌트가 '무슨 공식을 쓸지'라면, 여기는 '어떻게 빨리·안 틀리고 계산하나'다.
class CalcTipsScreen extends StatelessWidget {
  const CalcTipsScreen({super.key});

  // (섹션 제목, [(팁 제목, 팁 내용)])
  static const _sections = <(String, List<(String, String)>)>[
    (
      '공통 · 단위와 근사값',
      [
        ('자주 쓰는 근사값',
            r'$\sqrt2\approx1.414$, $\sqrt3\approx1.732$, $\dfrac{1}{\sqrt2}\approx0.707$, $\dfrac{1}{\sqrt3}\approx0.577$, $\pi\approx3.14$, $\dfrac{\sqrt3}{2}\approx0.866$'),
        ('60Hz 상수',
            r'$\omega=2\pi f=2\pi\times60\approx377$. 공교롭게 고유임피던스 $\eta_0=120\pi\approx377\,\Omega$ 와 같은 값이라 외워두면 빠르다.'),
        ('단위 접두어',
            r'$\mathrm{k}=10^{3}$, $\mathrm{M}=10^{6}$, $\mathrm{m}=10^{-3}$, $\mu=10^{-6}$, $\mathrm{n}=10^{-9}$, $\mathrm{p}=10^{-12}$. **계산 전에 접두어부터 정리**하면 자릿수 실수가 준다.'),
        ('면적 환산',
            r'$\mathrm{mm^2}\to\mathrm{m^2}$ 는 $\times10^{-6}$. 단면적이 섞이면 이것부터 맞춘다.'),
        ('데시벨',
            r'$g=20\log_{10}|G|$. 10배=20dB, 100배=40dB, 1000배=60dB, 2배$\approx$6dB.'),
      ],
    ),
    (
      '전기자기학',
      [
        ('쿨롱 상수',
            r'$\dfrac{1}{4\pi\varepsilon_0}=9\times10^9$. $F,E$ 는 거리 **제곱**에 반비례, 전위 $V$·선전하는 거리 **1승**에 반비례.'),
        ('진공 상수',
            r'$\varepsilon_0=8.855\times10^{-12}$, $\mu_0=4\pi\times10^{-7}$.'),
        ('자계 공식 구분',
            r'무한직선 $H=\dfrac{I}{2\pi r}$, 원형코일 중심 $H=\dfrac{NI}{2r}$, 솔레노이드 $H=\dfrac{NI}{l}$ — 분모의 $2\pi r/2r/l$ 만 다르다.'),
        ('상호인덕턴스',
            r'$M=k\sqrt{L_1 L_2}$. 가동접속 $L=L_1+L_2+2M$, 차동 $-2M$.'),
      ],
    ),
    (
      '전력공학',
      [
        ('수력 출력',
            r'$P=9.8\,Q\,H\,\eta$ [kW]. **효율 곱하기를 빠뜨리지 말 것**(대표 함정).'),
        ('3상 전력',
            r'$P=\sqrt3\,V_l I_l\cos\theta$ — 여기 $V_l$ 은 **선간전압 그대로**. $\sqrt3$ 위치만 조심하면 된다.'),
        ('퍼센트 임피던스',
            r'단락전류 $I_s=\dfrac{100}{\%Z}I_n$, 단락용량 $P_s=\dfrac{100}{\%Z}P_n$. $\%Z$ 는 기준용량에 **비례**해 환산.'),
        ('역률 개선',
            r'$Q_c=P(\tan\theta_1-\tan\theta_2)$. 각도별 $\tan$: $\cos0.6\to\tan=1.333$, $\cos0.8\to0.75$.'),
        ('충전용량',
            r'3상 $Q_c=\omega C V^2$ ($V$=선간전압), 상당 $2\pi f C E^2$.'),
      ],
    ),
    (
      '전기기기',
      [
        ('동기속도·슬립',
            r'$N_s=\dfrac{120f}{p}$, $s=\dfrac{N_s-N}{N_s}$, $N=(1-s)N_s$.'),
        ('유도기 전력 분배',
            r'$P_2:P_{c2}:P_m=1:s:(1-s)$. 2차동손 $=sP_2$, 기계출력 $=(1-s)P_2$.'),
        ('변압기 비',
            r'$a=\dfrac{V_1}{V_2}=\dfrac{N_1}{N_2}=\dfrac{I_2}{I_1}$. 임피던스 환산은 $Z_1=a^2 Z_2$ (**제곱**).'),
        ('V결선',
            r'출력 $=\sqrt3\times$(변압기 1대), 이용률 $86.6\%$, 출력비 $57.7\%$ — 셋을 구분.'),
      ],
    ),
    (
      '회로이론 · 제어',
      [
        ('실효·평균값',
            r'정현파 실효값 $=\dfrac{V_m}{\sqrt2}$, 전파정류 평균 $=\dfrac{2V_m}{\pi}\approx0.9V_m$, 반파 $0.45V_m$.'),
        ('임피던스·역률',
            r'$Z=\sqrt{R^2+(X_L-X_C)^2}$, $\cos\theta=\dfrac{R}{Z}$. $3{-}4{-}5$, $8{-}6{-}10$ 직각삼각형을 알아두면 암산이 빠르다.'),
        ('공진·시정수',
            r'공진 $f_0=\dfrac{1}{2\pi\sqrt{LC}}$. 시정수 RL $\dfrac{L}{R}$, RC $RC$ — $t=\tau$ 에서 $63.2\%$ 도달.'),
        ('라플라스 정리',
            r'최종값 $\lim_{s\to0}sF(s)$, 초기값 $\lim_{s\to\infty}sF(s)$.'),
        ('2차계 표준형',
            r'$s^2+2\zeta\omega_n s+\omega_n^2$ 와 비교: $\omega_n=\sqrt{\text{상수항}}$, $\zeta=\dfrac{s\text{항 계수}}{2\omega_n}$.'),
      ],
    ),
    (
      '검산 · 실수 줄이기',
      [
        ('자릿수 먼저',
            '정확한 값보다 **자릿수(단위)**를 먼저 맞춰라. 보기 4개가 자릿수만 다르면 접두어 실수를 노린 문제다.'),
        ('보기로 되짚기',
            r'$0.9E$ vs $0.45E$, $\sqrt3$ 배 vs $\dfrac{1}{\sqrt3}$ 배처럼 **배수 관계 오답**이 흔하다. 내 답의 배수 짝이 보기에 있으면 공식을 재확인.'),
        ('"옳지 않은 것"',
            '비례/반비례가 **뒤집힌 보기**를 가장 먼저 의심하라. 안정도·리액턴스·코로나 문제에서 자주 나온다.'),
        ('부분점수는 없다',
            r'계산은 마지막 단위·$\sqrt3$·효율에서 갈린다. 답 내고 **단위 한 번 더 확인**.'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 720;
    return Scaffold(
      appBar: AppBar(title: const Text('계산 팁')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: wide ? 32 : 16, vertical: 16),
            children: [
              for (final section in _sections) ...[
                _SectionTitle(section.$1),
                const SizedBox(height: 10),
                for (final tip in section.$2) _TipCard(title: tip.$1, body: tip.$2),
                const SizedBox(height: 18),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(Icons.calculate_outlined, size: 18, color: scheme.primary),
        const SizedBox(width: 8),
        Text(text,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w800, color: scheme.primary)),
      ],
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard({required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Palette.card(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Palette.hairline(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w800,
                  color: scheme.onSurface)),
          const SizedBox(height: 6),
          InlineRich(
            body,
            style: TextStyle(
              fontFamily: 'NanumGothic',
              fontSize: 14,
              height: 1.6,
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
