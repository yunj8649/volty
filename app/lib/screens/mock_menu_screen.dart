import 'package:flutter/material.dart';

import '../models/progress.dart';
import '../models/question.dart';
import '../theme.dart';
import 'mock_setup_screen.dart';
import 'quiz_screen.dart';

/// 모의고사 선택 — CBT처럼 회차별(고정·재응시 가능)과 랜덤 중 고른다.
class MockMenuScreen extends StatelessWidget {
  const MockMenuScreen({super.key, required this.bank, required this.progress});

  final QuestionBank bank;
  final StudyProgress progress;

  void _start(BuildContext context,
      {required String title,
      required String label,
      required List<Question> qs}) {
    final minutes = (qs.length * 1.5).ceil();
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => QuizScreen(
          progress: progress,
          config: QuizConfig(
            title: title,
            questions: qs,
            isExam: true,
            timeLimit: Duration(minutes: minutes),
            examLabel: label,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final rounds = bank.roundCount;

    return Scaffold(
      appBar: AppBar(title: const Text('모의고사')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListenableBuilder(
            listenable: progress,
            builder: (context, _) => ListView(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
              children: [
                Text('실제 시험처럼 5과목 × 20문항 = 100문항, 약 150분',
                    style: TextStyle(
                        color: scheme.onSurfaceVariant, fontSize: 13)),
                const SizedBox(height: 16),
                _MockTile(
                  icon: Icons.shuffle_rounded,
                  title: '랜덤 모의고사',
                  subtitle: '풀 때마다 새로 섞인 100문항',
                  score: progress.lastExamFor('랜덤')?.score,
                  onTap: () => _start(context,
                      title: '랜덤 모의고사',
                      label: '랜덤',
                      qs: bank.randomExam()),
                ),
                const SizedBox(height: 10),
                _MockTile(
                  icon: Icons.tune_rounded,
                  title: '직접 설정',
                  subtitle: '과목별 문항 수·유형(계산/개념)을 골라 출제',
                  score: progress.lastExamFor('설정')?.score,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) =>
                          MockSetupScreen(bank: bank, progress: progress),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('회차별 (고정 · 다시 풀어 점수 비교)',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: scheme.primary)),
                const SizedBox(height: 10),
                if (rounds == 0)
                  Text('아직 회차를 만들 문항이 부족합니다.',
                      style: TextStyle(color: scheme.onSurfaceVariant))
                else
                  for (var r = 1; r <= rounds; r++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _MockTile(
                        icon: Icons.assignment_outlined,
                        title: '볼티 실전 $r회',
                        subtitle: '고정된 100문항 — 언제 풀어도 같은 문제',
                        score: progress.lastExamFor('$r회')?.score,
                        onTap: () => _start(context,
                            title: '볼티 실전 $r회',
                            label: '$r회',
                            qs: bank.roundExam(r)),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MockTile extends StatelessWidget {
  const _MockTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.score,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final int? score;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Palette.hairline(context)),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: scheme.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: scheme.primary),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 15.5, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: TextStyle(
                            fontSize: 12.5, color: scheme.onSurfaceVariant)),
                  ],
                ),
              ),
              if (score != null) ...[
                Text('$score점',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Palette.done(context))),
                const SizedBox(width: 6),
              ],
              Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
