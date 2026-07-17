import 'package:flutter/material.dart';

import '../models/card.dart';
import '../models/progress.dart';
import '../models/question.dart';
import '../models/taxonomy.dart';
import '../theme.dart';
import 'card_screen.dart';
import 'quiz_screen.dart';

/// 한 과목의 출제기준 트리. 세부항목을 누르면 이론 카드로 들어간다.
///
/// 학습을 완료한 세부항목엔 체크가 붙고, 주요항목마다 완료 수를 센다.
class SubjectScreen extends StatelessWidget {
  const SubjectScreen({
    super.key,
    required this.subject,
    required this.cards,
    required this.progress,
    required this.questions,
  });

  final Subject subject;
  final CardLibrary cards;
  final StudyProgress progress;
  final QuestionBank questions;

  void _practice(BuildContext context, String title, List<Question> qs) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => QuizScreen(
          progress: progress,
          config: QuizConfig(title: title, questions: qs, isExam: false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 720;
    final scheme = Theme.of(context).colorScheme;

    // 과목 안에서 카드를 연속으로 넘겨볼 수 있게 출제기준 순서로 모아둔다.
    final subjectCards = <TheoryCard>[
      for (final major in subject.majors)
        for (final minor in major.minors) ?cards.byId(minor.id),
    ];

    final subjectQs = questions.bySubject(subject.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
        actions: [
          if (subjectQs.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TextButton.icon(
                onPressed: () =>
                    _practice(context, '${subject.name} 문제', subjectQs),
                icon: const Icon(Icons.quiz_outlined, size: 18),
                label: Text('문제 ${subjectQs.length}'),
              ),
            ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 840),
          child: ListenableBuilder(
            listenable: progress,
            builder: (context, _) => ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: wide ? 32 : 12,
                vertical: 12,
              ),
              itemCount: subject.majors.length,
              itemBuilder: (context, i) {
                final major = subject.majors[i];
                final cardIds =
                    major.minors.where((m) => cards.has(m.id)).map((m) => m.id);
                final studied = progress.studiedAmong(cardIds);
                return Card(
                  elevation: 0,
                  color: scheme.surface,
                  margin: const EdgeInsets.only(bottom: 10),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide(color: Palette.hairline(context)),
                  ),
                  child: ExpansionTile(
                    shape: const Border(),
                    title: Text(
                      '${i + 1}. ${major.name}',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      '세부 ${major.minors.length} · 개념 ${major.conceptCount} · '
                      '학습 $studied/${major.minors.where((m) => cards.has(m.id)).length}',
                      style: TextStyle(
                        color: scheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                    children: [
                      for (final minor in major.minors)
                        _MinorTile(
                          minor: minor,
                          card: cards.byMinorId(minor.id),
                          progress: progress,
                          siblings: subjectCards,
                        ),
                      if (questions.hasMajor(major.id))
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 4, 16, 14),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FilledButton.tonalIcon(
                              onPressed: () => _practice(
                                context,
                                '${major.name} 문제',
                                questions.byMajor(major.id),
                              ),
                              icon: const Icon(Icons.quiz_outlined, size: 18),
                              label: Text(
                                  '이 단원 문제 풀기 (${questions.countMajor(major.id)})'),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _MinorTile extends StatelessWidget {
  const _MinorTile({
    required this.minor,
    this.card,
    required this.progress,
    required this.siblings,
  });

  final Minor minor;

  /// 아직 안 쓴 세부항목이면 null.
  final TheoryCard? card;
  final StudyProgress progress;

  /// 같은 과목 카드들 — 카드 화면에서 이전/다음으로 넘겨본다.
  final List<TheoryCard> siblings;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final ready = card != null;
    final studied = ready && progress.isStudied(minor.id);

    return InkWell(
      onTap: ready
          ? () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => CardScreen(
                    card: card!,
                    progress: progress,
                    siblings: siblings,
                  ),
                ),
              )
          : null,
      child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (studied) ...[
                Icon(Icons.check_circle, size: 15, color: scheme.primary),
                const SizedBox(width: 6),
              ],
              Expanded(
                child: Text(
                  minor.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ready ? scheme.primary : scheme.onSurfaceVariant,
                    fontSize: 13,
                  ),
                ),
              ),
              if (ready)
                Icon(Icons.chevron_right, size: 18, color: scheme.primary)
              else
                Text(
                  '카드 없음',
                  style: TextStyle(fontSize: 11, color: scheme.outline),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final c in minor.concepts)
                Tooltip(
                  message: c.id,
                  child: Chip(
                    label: Text(conceptLabel(c.name),
                        style: const TextStyle(fontSize: 12)),
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: BorderSide(color: scheme.outlineVariant),
                    backgroundColor: scheme.surfaceContainerLow,
                  ),
                ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
