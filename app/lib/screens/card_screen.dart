import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../models/card.dart';
import '../models/progress.dart';
import '../theme.dart';
import '../widgets/card_body.dart';
import '../widgets/figure_view.dart';
import '../widgets/handwriting_canvas.dart';

/// 이론 카드 화면. 폰과 패드가 같은 카드를 다르게 쓴다.
///
///   폰   — 요약 + 공식 + 함정만. 본문은 접혀 있다. 지하철에서 훑는 용도.
///   패드 — 왼쪽에 요약/공식/함정 고정, 오른쪽에 본문. 집중 학습용.
class CardScreen extends StatelessWidget {
  const CardScreen({
    super.key,
    required this.card,
    required this.progress,
    this.siblings,
  });

  final TheoryCard card;
  final StudyProgress progress;

  /// 카드를 연속으로 넘겨보게 하는 문맥 목록(과목 순서·검색 결과·즐겨찾기 등).
  /// null 이면 이전/다음 바를 숨긴다.
  final List<TheoryCard>? siblings;

  void _go(BuildContext context, TheoryCard target) => Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (_) => CardScreen(
            card: target,
            progress: progress,
            siblings: siblings,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 900;
    final scheme = Theme.of(context).colorScheme;

    final sibs = siblings;
    final idx = sibs == null ? -1 : sibs.indexWhere((c) => c.id == card.id);
    final hasNav = sibs != null && sibs.length > 1 && idx >= 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(card.title),
        actions: [
          ListenableBuilder(
            listenable: progress,
            builder: (context, _) {
              final marked = progress.isBookmarked(card.id);
              final done = progress.isStudied(card.id);
              return Row(
                children: [
                  IconButton(
                    tooltip: marked ? '즐겨찾기 해제' : '즐겨찾기',
                    icon: Icon(marked ? Icons.star : Icons.star_border),
                    color: marked ? scheme.primary : null,
                    onPressed: () => progress.toggleBookmark(card.id),
                  ),
                  IconButton(
                    tooltip: done ? '학습 완료 취소' : '학습 완료',
                    icon: Icon(
                      done ? Icons.check_circle : Icons.check_circle_outline,
                    ),
                    color: done ? scheme.primary : null,
                    onPressed: () => progress.toggleStudied(card.id),
                  ),
                  const SizedBox(width: 4),
                ],
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                card.path.take(2).join(' › '),
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
      ),
      body: HandwritingCanvas(
        key: ValueKey('note_c_${card.id}'),
        storageKey: 'note_c_${card.id}',
        child: wide ? _WideLayout(card: card) : _PhoneLayout(card: card),
      ),
      bottomNavigationBar: hasNav
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: idx > 0
                            ? () => _go(context, sibs[idx - 1])
                            : null,
                        icon: const Icon(Icons.chevron_left),
                        label: const Text('이전'),
                      ),
                    ),
                    Text(
                      '${idx + 1} / ${sibs.length}',
                      style: TextStyle(
                        fontSize: 12,
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: idx < sibs.length - 1
                            ? () => _go(context, sibs[idx + 1])
                            : null,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('다음'), Icon(Icons.chevron_right)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}

/// 패드/웹: 2단. 왼쪽은 스크롤해도 따라오는 요점, 오른쪽은 본문.
class _WideLayout extends StatelessWidget {
  const _WideLayout({required this.card});

  final TheoryCard card;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 340,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 12, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _essentials(context, card),
            ),
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(28, 16, 28, 48),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final s in card.sections) _Section(section: s),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 폰: 요점만 펼치고 본문은 접어둔다.
class _PhoneLayout extends StatelessWidget {
  const _PhoneLayout({required this.card});

  final TheoryCard card;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
      children: [
        ..._essentials(context, card),
        const SizedBox(height: 8),
        for (var i = 0; i < card.sections.length; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Palette.card(context),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Palette.hairline(context)),
            ),
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              // 첫 섹션은 펼쳐서 보여준다 — 열자마자 읽을 게 있게.
              initiallyExpanded: i == 0,
              shape: const Border(),
              collapsedShape: const Border(),
              tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              title: Text(
                card.sections[i].heading,
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15.5),
              ),
              children: [CardBody(card.sections[i].body)],
            ),
          ),
      ],
    );
  }
}

/// 폰에서도 패드에서도 항상 보이는 것들.
List<Widget> _essentials(BuildContext context, TheoryCard card) {
  return [
    if (card.isDraft) ...[
      _DraftBadge(),
      const SizedBox(height: 14),
    ],
    _SummaryCard(text: card.summary),
    const SizedBox(height: 18),
    if (card.figures.isNotEmpty) ...[
      _Label('그림으로 이해', Icons.insights_rounded, Palette.accent(context)),
      const SizedBox(height: 10),
      for (final f in card.figures) FigureView(figure: f),
      const SizedBox(height: 8),
    ],
    if (card.formulas.isNotEmpty) ...[
      _Label('핵심 공식', Icons.functions_rounded, Palette.accent(context)),
      const SizedBox(height: 10),
      for (final f in card.formulas) _FormulaTile(formula: f),
      const SizedBox(height: 18),
    ],
    if (card.traps.isNotEmpty) ...[
      _Label('자주 틀리는 것', Icons.push_pin_rounded, Palette.trapFg(context)),
      const SizedBox(height: 10),
      _TrapCard(traps: card.traps),
      const SizedBox(height: 8),
    ],
  ];
}

class _DraftBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: scheme.errorContainer.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 16, color: scheme.error),
          const SizedBox(width: 6),
          Expanded(
            child: Text('검수 전 — 내용이 틀릴 수 있습니다',
                style: TextStyle(fontSize: 12.5, color: scheme.onErrorContainer)),
          ),
        ],
      ),
    );
  }
}

/// 한 줄 요약 — 카드의 첫인상. 왼쪽 형광 바 + 살짝 도드라진 종이.
class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final accent = Palette.accent(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: Palette.summaryBg(context),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Palette.hairline(context)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 3.5,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: InlineRich(
                text,
                style: TextStyle(
                  fontFamily: 'NanumGothic',
                  fontSize: 15.5,
                  height: 1.7,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text, this.icon, this.color);

  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.2,
              color: color,
            ),
          ),
        ],
      );
}

class _FormulaTile extends StatelessWidget {
  const _FormulaTile({required this.formula});

  final Formula formula;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Palette.formulaBg(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Palette.formulaBorder(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (formula.label != null) ...[
            Text(
              formula.label!,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.2,
                color: scheme.primary,
              ),
            ),
            const SizedBox(height: 10),
          ],
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Math.tex(
              formula.tex,
              // fontFamily 가 있어야 `\text{...}` 속 한글이 두부가 안 된다.
              textStyle: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 16,
                color: scheme.onSurface,
              ),
              onErrorFallback: (e) => Text(
                formula.tex,
                style: TextStyle(color: scheme.error, fontSize: 12),
              ),
            ),
          ),
          if (formula.note != null) ...[
            const SizedBox(height: 10),
            InlineRich(
              formula.note!,
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 12.5,
                height: 1.55,
                color: scheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// 함정 모음 — 앰버 형광펜 노트. 각 항목 앞에 핀.
class _TrapCard extends StatelessWidget {
  const _TrapCard({required this.traps});
  final List<String> traps;

  @override
  Widget build(BuildContext context) {
    final fg = Palette.trapFg(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 4),
      decoration: BoxDecoration(
        color: Palette.trapBg(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Palette.trapBorder(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final t in traps)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7, right: 9),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                          color: fg, shape: BoxShape.circle),
                    ),
                  ),
                  Expanded(child: CardBody(t)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.section});

  final CardSection section;

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (section.heading.isNotEmpty) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 4,
                height: 20,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: Text(
                  section.heading,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800, height: 1.3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
        ],
        CardBody(section.body),
        const SizedBox(height: 22),
      ],
    );
  }
}
