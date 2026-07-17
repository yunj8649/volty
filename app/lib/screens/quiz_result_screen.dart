import 'package:flutter/material.dart';

import '../models/question.dart';
import '../theme.dart';
import '../widgets/card_body.dart';

/// 채점 결과. 총점·과목별 점수·합격 판정 + 문항별 복습.
///
/// 합격 규칙은 실제 시험과 같다: 평균 60점 이상 + 과목당 40점 미만 없기(과락).
class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({
    super.key,
    required this.title,
    required this.questions,
    required this.selected,
  });

  final String title;
  final List<Question> questions;
  final Map<int, int> selected;

  static const _subjectName = {
    'em': '전기자기학',
    'pw': '전력공학',
    'mc': '전기기기',
    'ct': '회로이론·제어',
    'kec': '전기설비',
  };

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final done = Palette.done(context);

    var correct = 0;
    final bySubject = <String, List<bool>>{}; // subject -> [정답여부...]
    for (var i = 0; i < questions.length; i++) {
      final q = questions[i];
      final ok = selected[i] == q.answer;
      if (ok) correct++;
      bySubject.putIfAbsent(q.subject, () => []).add(ok);
    }
    final total = questions.length;
    final overall = total == 0 ? 0.0 : correct / total * 100;

    // 과락: 문항이 있는 과목 중 40점 미만이 하나라도 있으면 불합격.
    final subjectScores = {
      for (final e in bySubject.entries)
        e.key: e.value.where((x) => x).length / e.value.length * 100,
    };
    final noFail = subjectScores.values.every((s) => s >= 40);
    final passed = overall >= 60 && noFail;

    return Scaffold(
      appBar: AppBar(title: const Text('채점 결과')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 32),
            children: [
              // 총점 + 합격 판정
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: (passed ? done : scheme.error).withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: (passed ? done : scheme.error).withValues(alpha: 0.4)),
                ),
                child: Column(
                  children: [
                    Text(passed ? '합격' : '불합격',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: passed ? done : scheme.error)),
                    const SizedBox(height: 6),
                    Text('${overall.toStringAsFixed(0)}점  ·  $correct / $total 문항',
                        style: TextStyle(
                            fontSize: 15, color: scheme.onSurfaceVariant)),
                    const SizedBox(height: 4),
                    Text(
                      passed
                          ? '평균 60점 이상, 과락 없음'
                          : overall < 60
                              ? '평균이 60점에 못 미칩니다'
                              : '40점 미만 과목이 있습니다(과락)',
                      style:
                          TextStyle(fontSize: 12.5, color: scheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Text('과목별',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      color: scheme.primary)),
              const SizedBox(height: 10),
              for (final e in bySubject.entries)
                _SubjectRow(
                  name: _subjectName[e.key] ?? e.key,
                  correct: e.value.where((x) => x).length,
                  total: e.value.length,
                  score: subjectScores[e.key]!,
                ),
              const SizedBox(height: 24),
              Text('문항 복습',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      color: scheme.primary)),
              const SizedBox(height: 10),
              for (var i = 0; i < questions.length; i++)
                _ReviewTile(
                  number: i + 1,
                  question: questions[i],
                  picked: selected[i],
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 12),
          child: FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('마치기'),
          ),
        ),
      ),
    );
  }
}

class _SubjectRow extends StatelessWidget {
  const _SubjectRow({
    required this.name,
    required this.correct,
    required this.total,
    required this.score,
  });
  final String name;
  final int correct;
  final int total;
  final double score;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final fail = score < 40;
    final color = fail ? scheme.error : Palette.done(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
              width: 92,
              child: Text(name,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600))),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: score / 100,
                minHeight: 8,
                backgroundColor: scheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(color),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 66,
            child: Text('${score.toStringAsFixed(0)}점 ($correct/$total)',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: fail ? scheme.error : scheme.onSurface)),
          ),
        ],
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({
    required this.number,
    required this.question,
    required this.picked,
  });
  final int number;
  final Question question;
  final int? picked;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final done = Palette.done(context);
    final ok = picked == question.answer;
    final unanswered = picked == null;
    final color = unanswered
        ? scheme.onSurfaceVariant
        : ok
            ? done
            : scheme.error;
    const labels = ['①', '②', '③', '④', '⑤'];

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Palette.card(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Palette.hairline(context)),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        shape: const Border(),
        collapsedShape: const Border(),
        leading: Icon(
            unanswered
                ? Icons.remove_circle_outline
                : ok
                    ? Icons.check_circle
                    : Icons.cancel,
            color: color),
        title: Text('$number번  ${question.subject.toUpperCase()}',
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
        subtitle: Text(
          unanswered
              ? '미응답 · 정답 ${labels[question.answer]}'
              : ok
                  ? '정답'
                  : '내 답 ${labels[picked!]} · 정답 ${labels[question.answer]}',
          style: TextStyle(fontSize: 12, color: color),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InlineRich(question.stem,
                style: TextStyle(
                    fontFamily: 'NanumGothic',
                    fontSize: 14.5,
                    height: 1.6,
                    color: scheme.onSurface)),
          ),
          const SizedBox(height: 10),
          for (var i = 0; i < question.choices.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(labels[i],
                    style: TextStyle(
                        color: i == question.answer
                            ? done
                            : (i == picked ? scheme.error : scheme.onSurfaceVariant),
                        fontWeight: i == question.answer
                            ? FontWeight.w800
                            : FontWeight.normal)),
                const SizedBox(width: 8),
                Expanded(child: InlineRich(question.choices[i])),
              ]),
            ),
          if (question.explanation.isNotEmpty) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Palette.formulaBg(context),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InlineRich(question.explanation,
                  style: TextStyle(
                      fontFamily: 'NanumGothic',
                      fontSize: 13.5,
                      height: 1.6,
                      color: scheme.onSurface)),
            ),
          ],
        ],
      ),
    );
  }
}
