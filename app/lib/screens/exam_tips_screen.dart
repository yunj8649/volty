import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/card_body.dart';

/// 시험 꿀팁 — 객관식 소거법·암기 두문자·과목별 빠른 판정·시험장 요령.
/// "야매 찍기"는 실력을 대신하지 못한다. 여기 요령은 **모를 때의 최후의 보루·확률**일 뿐,
/// 아는 문제는 정공법으로 푸는 게 언제나 옳다.
class ExamTipsScreen extends StatelessWidget {
  const ExamTipsScreen({super.key});

  static const _sections = <(String, List<(String, String)>)>[
    (
      '객관식 소거법 · 최후의 보루',
      [
        ('말 안 되는 보기부터 버려라',
            r'음수 저항, $100\%$ 넘는 효율·역률, 자릿수(단위)가 안 맞는 값은 바로 소거. 4개를 2개로만 줄여도 확률이 두 배.'),
        ('유독 크거나 작은 값 주의',
            '보기 넷 중 혼자 튀는 극단값은 계산 실수를 유도하는 함정인 경우가 많다.'),
        (r'$\sqrt3$·$\sqrt2$ 짝 보기',
            r'내가 구한 값에 $\sqrt3$ 곱하거나 나눈 값이 보기에 또 있으면, 공식의 $\sqrt3$ 위치를 착각한 것. 대개 그 짝 중 하나가 정답.'),
        ('비슷한 보기 두 개',
            '출제자가 헷갈리라고 만든 쌍이라, 정답이 그 둘 중 하나일 확률이 높다.'),
        ('단정 표현 경계',
            '"항상·반드시·모두·절대"로 못 박은 개념 보기는 예외에 걸려 오답인 경우가 잦다(맹신은 금물).'),
        ('정 모르면',
            '찍더라도 소거 후 찍어라. 무작정 한 번호로 미는 건 정말 시간 없을 때만.'),
      ],
    ),
    (
      '암기 두문자 · 야매 연상',
      [
        ('차단기 소호매질',
            r'GCB=$\mathrm{SF_6}$, VCB=진공, OCB=기름, ABB=압축공기, MBB=자기. "가스·진공·기름·공기·자기".'),
        (r'$\sqrt3$ 위치',
            r'**Y결선은 전압이 $\sqrt3$배**(Y로 벌어져 전압↑), **$\Delta$결선은 전류가 $\sqrt3$배**. "전압 와이, 전류 델타".'),
        ('유도기 전력비',
            r'$P_2:P_{c2}:P_m=1:s:(1-s)$ → "일 · 에스 · 남은 것".'),
        ('안정도 향상 대책',
            '리액턴스↓·속응여자·복도체·직렬콘덴서·병행회선·중간조상 → "리·속·복·직·병·중".'),
        ('수차 낙차 순',
            '펠턴 > 프란시스 > 사류 > 카플란(프로펠러). 특유속도는 정반대 순서.'),
        ('제동 방식',
            '발전제동(저항 소모)·회생제동(전원 반환)·역상제동(플러깅). "발·회·역".'),
      ],
    ),
    (
      '과목별 빠른 판정',
      [
        ('3상은 선간전압 그대로',
            r'$P=\sqrt3\,V_l I_l\cos\theta$ 에 **선간전압을 그냥** 넣어라. 상전압으로 바꾸려다 $\sqrt3$ 를 두 번 쓰는 실수가 흔하다.'),
        ('퍼센트 임피던스',
            r'단락은 무조건 "$\dfrac{100}{\%Z}$ 배". 전류든 용량이든 이 배수.'),
        ('역률 tan 값 암기',
            r'$\cos\theta=0.6\to\tan\theta=1.333$, $0.8\to0.75$. 콘덴서 용량 문제 즉답.'),
        ('"옳지 않은 것"',
            '비례/반비례가 **뒤집힌 보기**부터 봐라. 안정도·리액턴스·코로나에서 단골.'),
        ('라플라스 최종값',
            r'$f(\infty)=\lim_{s\to0}sF(s)$ — $s$ 곱하고 $s\to0$ 대입이면 끝.'),
        ('KEC 자주 나오는 값 묶음',
            r'저압 AC $1000$V·DC $1500$V, 접지도체 구리 $6\,\mathrm{mm^2}$, 접지극 $0.75$m, 차단 $0.4$s. 세트로 묶어 외우면 여러 문제 커버.'),
      ],
    ),
    (
      '시험장 · 시간 배분',
      [
        ('과락부터 막아라',
            r'평균 $60$점보다 **과목당 $40$점 미만(과락)**이 더 무섭다. 한 과목도 버리지 말고 고르게.'),
        ('개념문제 먼저 수확',
            '오래 걸리는 계산은 표시하고 넘겨라. 짧은 개념문제로 점수부터 확보하고 돌아온다.'),
        ('OMR 밀림 방지',
            '한 문제씩 말고 5문제 단위로 모아 마킹하면 밀려 쓰는 사고를 막는다.'),
        ('마지막 검산',
            r'답 낸 뒤 **단위·$\sqrt3$·효율**만 빠르게 되짚어라. 계산은 대부분 이 셋에서 갈린다.'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 720;
    return Scaffold(
      appBar: AppBar(title: const Text('시험 꿀팁')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: wide ? 32 : 16, vertical: 16),
            children: [
              const _Disclaimer(),
              const SizedBox(height: 16),
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

class _Disclaimer extends StatelessWidget {
  const _Disclaimer();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: scheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 18, color: scheme.onSecondaryContainer),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '요령은 실력의 보조일 뿐, 모를 때의 최후의 보루예요. 아는 문제는 정공법으로.',
              style: TextStyle(
                fontSize: 12.5,
                height: 1.5,
                color: scheme.onSecondaryContainer,
              ),
            ),
          ),
        ],
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
        Icon(Icons.emoji_objects_outlined, size: 18, color: scheme.tertiary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: scheme.tertiary)),
        ),
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
          InlineRich(
            title,
            style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w800,
                color: scheme.onSurface),
          ),
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
