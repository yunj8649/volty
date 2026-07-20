import 'package:flutter/material.dart';

import '../models/card.dart';
import '../models/progress.dart';
import '../models/question.dart';
import '../models/taxonomy.dart';
import '../theme.dart';
import 'quiz_screen.dart';

/// 실력 분석. 지금까지 푼 문제를 과목·단원(주요항목)별 정답률로 되짚어,
/// 어디가 약한지 한눈에 보여준다. 과락(과목당 40점)이 있는 시험이라 고른 실력이 중요하다.
/// 약한 단원을 누르면 바로 그 단원을 연습할 수 있다(진단→연습).
class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({
    super.key,
    required this.taxonomy,
    required this.questions,
    required this.progress,
    required this.cards,
  });

  final Taxonomy taxonomy;
  final QuestionBank questions;
  final StudyProgress progress;
  final CardLibrary cards;

  void _practice(BuildContext context, String majorId, String title) {
    final qs = questions.byMajor(majorId)..shuffle();
    if (qs.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => QuizScreen(
          progress: progress,
          config: QuizConfig(
              title: title, questions: qs, isExam: false, cards: cards),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('실력 분석')),
      body: ListenableBuilder(
        listenable: progress,
        builder: (context, _) {
          final stats = progress.majorStats;
          final totalAtt =
              stats.values.fold(0, (a, s) => a + s.attempts);

          if (totalAtt == 0) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  '아직 푼 문제가 없습니다.\n단원 연습이나 모의고사를 풀면\n여기서 단원별 정답률을 볼 수 있어요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    height: 1.7,
                  ),
                ),
              ),
            );
          }

          final totalCor =
              stats.values.fold(0, (a, s) => a + s.correct);

          // 약한 단원 Top 3 (최소 3번 이상 푼 것 중 정답률 낮은 순).
          final weak = stats.entries
              .where((e) => e.value.attempts >= 3)
              .toList()
            ..sort((a, b) => a.value.accuracy.compareTo(b.value.accuracy));

          final wide = MediaQuery.sizeOf(context).width >= 720;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820),
              child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: wide ? 32 : 16, vertical: 16),
                children: [
                  _OverallCard(
                    attempts: totalAtt,
                    correct: totalCor,
                  ),
                  if (progress.reasonCounts().isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _ReasonCard(counts: progress.reasonCounts()),
                  ],
                  if (weak.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _WeakCard(
                      items: weak.take(3).toList(),
                      nameOf: _majorName,
                      onTap: (id) => _practice(context, id, '약점 연습'),
                    ),
                  ],
                  const SizedBox(height: 20),
                  for (final s in taxonomy.subjects) ...[
                    _SubjectBlock(
                      subject: s,
                      progress: progress,
                      hasQuestions: questions.hasMajor,
                      onPractice: (id, name) => _practice(context, id, name),
                    ),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _majorName(String majorId) {
    for (final s in taxonomy.subjects) {
      for (final m in s.majors) {
        if (m.id == majorId) return '${s.name.split(' ').first} · ${m.name}';
      }
    }
    return majorId;
  }
}

class _OverallCard extends StatelessWidget {
  const _OverallCard({required this.attempts, required this.correct});
  final int attempts;
  final int correct;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final pct = attempts == 0 ? 0 : (correct / attempts * 100).round();
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('전체 정답률',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: scheme.onPrimaryContainer.withValues(alpha: 0.8))),
              const SizedBox(height: 4),
              Text('$pct%',
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: scheme.onPrimaryContainer)),
            ],
          ),
          const Spacer(),
          Text('$correct / $attempts',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: scheme.onPrimaryContainer.withValues(alpha: 0.9))),
        ],
      ),
    );
  }
}

class _WeakCard extends StatelessWidget {
  const _WeakCard(
      {required this.items, required this.nameOf, required this.onTap});
  final List<MapEntry<String, MajorStat>> items;
  final String Function(String) nameOf;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final fg = Palette.trapFg(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      decoration: BoxDecoration(
        color: Palette.trapBg(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Palette.trapBorder(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.priority_high_rounded, size: 16, color: fg),
              const SizedBox(width: 6),
              Text('약한 단원 · 눌러서 바로 연습',
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w800, color: fg)),
            ],
          ),
          const SizedBox(height: 6),
          for (final e in items)
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => onTap(e.key),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(nameOf(e.key),
                          style: TextStyle(
                              fontSize: 13.5, color: scheme.onSurface)),
                    ),
                    const SizedBox(width: 8),
                    Text('${(e.value.accuracy * 100).round()}%',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: fg)),
                    Icon(Icons.chevron_right, size: 18, color: fg),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// 오답 원인 분포. 왜 틀리는지(계산실수·개념·함정) 패턴을 보여준다.
class _ReasonCard extends StatelessWidget {
  const _ReasonCard({required this.counts});
  final Map<String, int> counts;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final total = counts.values.fold(0, (a, b) => a + b);
    final entries = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Palette.hairline(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('오답 원인 ($total개 태그)',
              style: const TextStyle(
                  fontSize: 13.5, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final e in entries)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: scheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('${e.key} ${e.value}',
                      style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                          color: scheme.onSurface)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SubjectBlock extends StatelessWidget {
  const _SubjectBlock({
    required this.subject,
    required this.progress,
    required this.hasQuestions,
    required this.onPractice,
  });
  final Subject subject;
  final StudyProgress progress;
  final bool Function(String) hasQuestions;
  final void Function(String majorId, String title) onPractice;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    var att = 0, cor = 0;
    for (final m in subject.majors) {
      final s = progress.majorStat(m.id);
      if (s != null) {
        att += s.attempts;
        cor += s.correct;
      }
    }
    final pct = att == 0 ? null : (cor / att * 100).round();

    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Palette.hairline(context)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(subject.name,
                    style: const TextStyle(
                        fontSize: 15.5, fontWeight: FontWeight.w800)),
              ),
              Text(
                pct == null ? '기록 없음' : '$pct%  ($cor/$att)',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: pct == null
                      ? scheme.onSurfaceVariant
                      : (pct < 40 ? scheme.error : scheme.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final m in subject.majors)
            _MajorBar(
              name: m.name,
              stat: progress.majorStat(m.id),
              onTap: hasQuestions(m.id)
                  ? () => onPractice(m.id, '${m.name} 연습')
                  : null,
            ),
        ],
      ),
    );
  }
}

class _MajorBar extends StatelessWidget {
  const _MajorBar({required this.name, required this.stat, this.onTap});
  final String name;
  final MajorStat? stat;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final s = stat;
    final acc = s == null || s.attempts == 0 ? null : s.accuracy;
    final barColor = acc == null
        ? scheme.surfaceContainerHighest
        : (acc < 0.4
            ? scheme.error
            : (acc < 0.7 ? scheme.tertiary : scheme.primary));
    final row = Row(
      children: [
        SizedBox(
          width: 122,
          child: Text(name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12.5, color: scheme.onSurface)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: acc ?? 0,
              minHeight: 7,
              backgroundColor: scheme.surfaceContainerHighest,
              color: barColor,
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 44,
          child: Text(
            acc == null ? '—' : '${(acc * 100).round()}%',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: scheme.onSurfaceVariant,
            ),
          ),
        ),
        Icon(Icons.chevron_right,
            size: 16,
            color: onTap == null
                ? Colors.transparent
                : scheme.onSurfaceVariant),
      ],
    );
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: row,
      ),
    );
  }
}
