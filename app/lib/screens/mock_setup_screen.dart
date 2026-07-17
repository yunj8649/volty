import 'package:flutter/material.dart';

import '../models/progress.dart';
import '../models/question.dart';
import '../theme.dart';
import 'quiz_screen.dart';

/// 모의시험 직접 설정 — CBT처럼 과목별 문항 수와 유형을 골라 랜덤 출제한다.
class MockSetupScreen extends StatefulWidget {
  const MockSetupScreen({super.key, required this.bank, required this.progress});
  final QuestionBank bank;
  final StudyProgress progress;

  @override
  State<MockSetupScreen> createState() => _MockSetupScreenState();
}

class _MockSetupScreenState extends State<MockSetupScreen> {
  static const _names = {
    'em': '전기자기학',
    'pw': '전력공학',
    'mc': '전기기기',
    'ct': '회로이론 및 제어공학',
    'kec': '전기설비기술기준',
  };

  String? _type; // null = 전체
  final Map<String, int> _counts = {
    for (final s in QuestionBank.examOrder) s: 20,
  };

  void _clamp() {
    for (final s in QuestionBank.examOrder) {
      final max = widget.bank.availableFor(s, _type);
      if (_counts[s]! > max) _counts[s] = max;
    }
  }

  int get _total =>
      QuestionBank.examOrder.fold(0, (a, s) => a + _counts[s]!);

  void _start() {
    final qs = widget.bank.customExam(_counts, type: _type);
    if (qs.isEmpty) return;
    final minutes = (qs.length * 1.5).ceil();
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => QuizScreen(
          progress: widget.progress,
          config: QuizConfig(
            title: '모의시험',
            questions: qs,
            isExam: true,
            timeLimit: Duration(minutes: minutes),
            examLabel: '설정',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('모의시험 설정')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
            children: [
              Text('유형',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                      color: scheme.primary)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  for (final t in [null, '계산', '개념'])
                    ChoiceChip(
                      label: Text(t == null ? '전체' : '$t형'),
                      selected: _type == t,
                      onSelected: (_) => setState(() {
                        _type = t;
                        _clamp();
                      }),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Text('과목별 문항 수',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                      color: scheme.primary)),
              const SizedBox(height: 10),
              for (final s in QuestionBank.examOrder)
                _SubjectRow(
                  name: _names[s]!,
                  count: _counts[s]!,
                  max: widget.bank.availableFor(s, _type),
                  onChanged: (v) => setState(() => _counts[s] = v),
                ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Palette.formulaBg(context),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('총 문항',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text('$_total문항 · 약 ${(_total * 1.5).ceil()}분',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: scheme.primary)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 12),
          child: FilledButton(
            onPressed: _total > 0 ? _start : null,
            child: Text(_total > 0 ? '시험 시작 ($_total문항)' : '문항을 1개 이상 선택하세요'),
          ),
        ),
      ),
    );
  }
}

class _SubjectRow extends StatelessWidget {
  const _SubjectRow({
    required this.name,
    required this.count,
    required this.max,
    required this.onChanged,
  });
  final String name;
  final int count;
  final int max;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
        decoration: BoxDecoration(
          color: Palette.card(context),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Palette.hairline(context)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700)),
                  Text('최대 $max문항',
                      style: TextStyle(
                          fontSize: 11, color: scheme.onSurfaceVariant)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: count > 0 ? () => onChanged(count - 1) : null,
              visualDensity: VisualDensity.compact,
            ),
            SizedBox(
              width: 34,
              child: Text('$count',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800)),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: count < max ? () => onChanged(count + 1) : null,
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
      ),
    );
  }
}
