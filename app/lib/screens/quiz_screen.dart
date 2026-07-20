import 'dart:async';

import 'package:flutter/material.dart';

import '../models/progress.dart';
import '../models/question.dart';
import '../theme.dart';
import '../widgets/card_body.dart';
import '../widgets/handwriting_canvas.dart';
import 'quiz_result_screen.dart';

/// 문제풀이 설정.
class QuizConfig {
  const QuizConfig({
    required this.title,
    required this.questions,
    required this.isExam,
    this.timeLimit,
    this.examLabel = '',
  });

  final String title;
  final List<Question> questions;

  /// true = 모의고사(타이머·제출 후 일괄 채점), false = 단원 연습(즉시 채점·해설).
  final bool isExam;
  final Duration? timeLimit;

  /// 성적 이력에 남길 모의고사 이름('랜덤', '1회' 등).
  final String examLabel;
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.config, required this.progress});
  final QuizConfig config;
  final StudyProgress progress;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _index = 0;
  final Map<int, int> _selected = {}; // 문항 index -> 고른 보기 index
  Timer? _timer;
  Duration _remaining = Duration.zero;

  List<Question> get _qs => widget.config.questions;
  bool get _exam => widget.config.isExam;

  @override
  void initState() {
    super.initState();
    if (_exam && widget.config.timeLimit != null) {
      _remaining = widget.config.timeLimit!;
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (!mounted) return;
        setState(() {
          _remaining -= const Duration(seconds: 1);
          if (_remaining <= Duration.zero) {
            _remaining = Duration.zero;
            _timer?.cancel();
            _finish();
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _pick(int choice) {
    // 연습은 한 번 고르면 잠금(즉시 채점). 시험은 제출 전까지 변경 가능.
    if (!_exam && _selected.containsKey(_index)) return;
    setState(() => _selected[_index] = choice);
  }

  void _finish() {
    _timer?.cancel();
    // 채점 결과를 기록: SRS 복습·오답노트·단원통계·오늘 학습량, 모의고사면 성적 이력.
    final answers = <AnswerRecord>[
      for (var i = 0; i < _qs.length; i++)
        if (_selected.containsKey(i))
          (
            id: _qs[i].id,
            major: _qs[i].major,
            correct: _selected[i] == _qs[i].answer,
          ),
    ];
    widget.progress.recordAnswers(answers,
        isExam: _exam, examLabel: widget.config.examLabel);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (_) => QuizResultScreen(
          title: widget.config.title,
          questions: _qs,
          selected: Map.of(_selected),
        ),
      ),
    );
  }

  Future<void> _confirmSubmit() async {
    final unanswered = _qs.length - _selected.length;
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('제출할까요?'),
        content: Text(unanswered > 0
            ? '아직 안 푼 문제가 $unanswered개 있습니다. 제출하면 채점됩니다.'
            : '모든 문제를 풀었습니다. 제출하면 채점됩니다.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('더 풀기')),
          FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('제출')),
        ],
      ),
    );
    if (ok == true && mounted) _finish();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final q = _qs[_index];
    final revealed = !_exam && _selected.containsKey(_index);
    final last = _index == _qs.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.config.title),
        actions: [
          IconButton(
            tooltip: widget.progress.isQuestionBookmarked(q.id)
                ? '즐겨찾기 해제'
                : '헷갈린 문제로 저장',
            icon: Icon(widget.progress.isQuestionBookmarked(q.id)
                ? Icons.star
                : Icons.star_border),
            color: widget.progress.isQuestionBookmarked(q.id)
                ? scheme.primary
                : null,
            onPressed: () => setState(
                () => widget.progress.toggleQuestionBookmark(q.id)),
          ),
          if (_exam && widget.config.timeLimit != null)
            Center(child: _TimerChip(remaining: _remaining)),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: (_index + 1) / _qs.length,
            minHeight: 4,
            backgroundColor: scheme.surfaceContainerHighest,
          ),
        ),
      ),
      body: HandwritingCanvas(
        key: ValueKey('note_q_${q.id}'),
        storageKey: 'note_q_${q.id}',
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
              children: [
              Row(
                children: [
                  Text('${_index + 1} / ${_qs.length}',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: scheme.primary,
                          fontSize: 15)),
                  const SizedBox(width: 8),
                  _Tag(q.subject.toUpperCase()),
                  const SizedBox(width: 6),
                  _Tag(q.major),
                ],
              ),
              const SizedBox(height: 16),
              InlineRich(
                q.stem,
                style: TextStyle(
                  fontFamily: 'NanumGothic',
                  fontSize: 17,
                  height: 1.7,
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurface,
                ),
              ),
              const SizedBox(height: 20),
              for (var i = 0; i < q.choices.length; i++)
                _ChoiceTile(
                  index: i,
                  text: q.choices[i],
                  selected: _selected[_index] == i,
                  revealed: revealed,
                  correct: q.answer == i,
                  onTap: () => _pick(i),
                ),
              if (revealed) ...[
                const SizedBox(height: 8),
                _Explanation(correct: _selected[_index] == q.answer, text: q.explanation),
              ],
            ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
          child: Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed:
                      _index > 0 ? () => setState(() => _index--) : null,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('이전'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: last
                    ? FilledButton(
                        onPressed: _confirmSubmit,
                        child: Text(_exam ? '제출하고 채점' : '결과 보기'),
                      )
                    : FilledButton.tonal(
                        onPressed: () => setState(() => _index++),
                        child: const Text('다음'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimerChip extends StatelessWidget {
  const _TimerChip({required this.remaining});
  final Duration remaining;

  @override
  Widget build(BuildContext context) {
    final m = remaining.inMinutes;
    final s = remaining.inSeconds % 60;
    final low = remaining.inSeconds <= 60;
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: low ? scheme.errorContainer : scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_outlined,
              size: 15, color: low ? scheme.error : scheme.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(
            '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}',
            style: TextStyle(
              fontFeatures: const [FontFeature.tabularFigures()],
              fontWeight: FontWeight.w700,
              color: low ? scheme.error : scheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text,
          style: TextStyle(fontSize: 11, color: scheme.onSurfaceVariant)),
    );
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({
    required this.index,
    required this.text,
    required this.selected,
    required this.revealed,
    required this.correct,
    required this.onTap,
  });

  final int index;
  final String text;
  final bool selected;
  final bool revealed;
  final bool correct;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final done = Palette.done(context);

    Color border = Palette.hairline(context);
    Color bg = Palette.card(context);
    Color mark = scheme.onSurfaceVariant;
    if (revealed && correct) {
      border = done;
      bg = done.withValues(alpha: 0.10);
      mark = done;
    } else if (revealed && selected && !correct) {
      border = scheme.error;
      bg = scheme.error.withValues(alpha: 0.08);
      mark = scheme.error;
    } else if (selected) {
      border = scheme.primary;
      bg = scheme.primary.withValues(alpha: 0.06);
      mark = scheme.primary;
    }

    const labels = ['①', '②', '③', '④', '⑤'];
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: bg,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: border, width: selected || (revealed && correct) ? 1.5 : 1),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(labels[index],
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700, color: mark)),
                const SizedBox(width: 10),
                Expanded(child: InlineRich(text)),
                if (revealed && correct)
                  Icon(Icons.check_circle, size: 18, color: done)
                else if (revealed && selected && !correct)
                  Icon(Icons.cancel, size: 18, color: scheme.error),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Explanation extends StatelessWidget {
  const _Explanation({required this.correct, required this.text});
  final bool correct;
  final String text;

  @override
  Widget build(BuildContext context) {
    final done = Palette.done(context);
    final scheme = Theme.of(context).colorScheme;
    final head = correct ? '정답입니다' : '틀렸습니다';
    final color = correct ? done : scheme.error;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Palette.formulaBg(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Palette.formulaBorder(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(correct ? Icons.check_circle : Icons.cancel,
                size: 16, color: color),
            const SizedBox(width: 6),
            Text(head,
                style: TextStyle(fontWeight: FontWeight.w800, color: color)),
          ]),
          if (text.isNotEmpty) ...[
            const SizedBox(height: 8),
            InlineRich(text,
                style: TextStyle(
                    fontFamily: 'NanumGothic',
                    fontSize: 14,
                    height: 1.6,
                    color: scheme.onSurface)),
          ],
        ],
      ),
    );
  }
}
