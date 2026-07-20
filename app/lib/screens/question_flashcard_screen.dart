import 'package:flutter/material.dart';

import '../models/progress.dart';
import '../models/question.dart';
import '../models/taxonomy.dart';
import '../theme.dart';
import '../widgets/card_body.dart';

/// 문제 카드. 공식 암기처럼, 문제를 넘겨보며 답을 떠올린 뒤 탭해서 답·해설을 확인한다.
/// 채점·기록은 하지 않는 '훑어보기' 모드다(점수·복습 일정에 영향 없음).
///
/// 문제는 볼티 원작(출제기준 기반) — 기출 복제가 아니다.
class QuestionFlashcardScreen extends StatefulWidget {
  const QuestionFlashcardScreen({
    super.key,
    required this.taxonomy,
    required this.questions,
    required this.progress,
  });

  final Taxonomy taxonomy;
  final QuestionBank questions;
  final StudyProgress progress;

  @override
  State<QuestionFlashcardScreen> createState() =>
      _QuestionFlashcardScreenState();
}

class _QuestionFlashcardScreenState extends State<QuestionFlashcardScreen> {
  String _subject = '전체';
  List<Question> _deck = [];
  int _index = 0;
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _rebuild();
  }

  void _rebuild() {
    _deck = _subject == '전체'
        ? widget.questions.all
        : widget.questions.bySubject(_subject);
    _index = 0;
    _revealed = false;
  }

  void _shuffle() => setState(() {
        _deck = List.of(_deck)..shuffle();
        _index = 0;
        _revealed = false;
      });

  void _go(int delta) => setState(() {
        _index = (_index + delta).clamp(0, _deck.length - 1);
        _revealed = false;
      });

  String _subjectName(String code) {
    try {
      return widget.taxonomy.subjectById(code).name;
    } catch (_) {
      return code.toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final subjects = ['전체', ...QuestionBank.examOrder];
    final q = _deck.isEmpty ? null : _deck[_index];

    return Scaffold(
      appBar: AppBar(
        title: const Text('문제 카드'),
        actions: [
          if (q != null)
            ListenableBuilder(
              listenable: widget.progress,
              builder: (context, _) {
                final marked = widget.progress.isQuestionBookmarked(q.id);
                return IconButton(
                  tooltip: marked ? '즐겨찾기 해제' : '헷갈린 문제로 저장',
                  icon: Icon(marked ? Icons.star : Icons.star_border),
                  color: marked ? scheme.primary : null,
                  onPressed: () =>
                      widget.progress.toggleQuestionBookmark(q.id),
                );
              },
            ),
          IconButton(
            tooltip: '섞기',
            icon: const Icon(Icons.shuffle),
            onPressed: _deck.isEmpty ? null : _shuffle,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: [
                for (final s in subjects)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(s == '전체' ? '전체' : _subjectName(s)),
                      selected: _subject == s,
                      onSelected: (_) => setState(() {
                        _subject = s;
                        _rebuild();
                      }),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: q == null
                ? Center(
                    child: Text('이 과목에는 문제가 없습니다.',
                        style: TextStyle(color: scheme.onSurfaceVariant)),
                  )
                : Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: GestureDetector(
                        onTap: () => setState(() => _revealed = !_revealed),
                        child: _QuestionCard(
                          question: q,
                          revealed: _revealed,
                        ),
                      ),
                    ),
                  ),
          ),
          if (q != null)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: _index > 0 ? () => _go(-1) : null,
                        icon: const Icon(Icons.chevron_left),
                        label: const Text('이전'),
                      ),
                    ),
                    Text('${_index + 1} / ${_deck.length}',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: scheme.onSurfaceVariant)),
                    Expanded(
                      child: TextButton(
                        onPressed:
                            _index < _deck.length - 1 ? () => _go(1) : null,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('다음'), Icon(Icons.chevron_right)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({required this.question, required this.revealed});
  final Question question;
  final bool revealed;

  static const _labels = ['①', '②', '③', '④', '⑤'];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final q = question;

    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 20),
      children: [
        Row(
          children: [
            _Tag(q.subject.toUpperCase()),
            const SizedBox(width: 6),
            _Tag(q.major),
            const Spacer(),
            _Tag(q.type),
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
        const SizedBox(height: 18),
        for (var i = 0; i < q.choices.length; i++)
          _Choice(
            label: _labels[i],
            text: q.choices[i],
            correct: revealed && i == q.answer,
          ),
        const SizedBox(height: 8),
        if (!revealed)
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.touch_app_outlined,
                    size: 16, color: scheme.onSurfaceVariant),
                const SizedBox(width: 6),
                Text('정답을 떠올린 뒤 탭하면 답·해설',
                    style:
                        TextStyle(fontSize: 13, color: scheme.onSurfaceVariant)),
              ],
            ),
          )
        else
          _Answer(
            label: _labels[q.answer],
            explanation: q.explanation,
          ),
      ],
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

class _Choice extends StatelessWidget {
  const _Choice(
      {required this.label, required this.text, required this.correct});
  final String label;
  final String text;
  final bool correct;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final done = Palette.done(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: correct ? done.withValues(alpha: 0.10) : Palette.card(context),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: correct ? done : Palette.hairline(context),
            width: correct ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: correct ? done : scheme.onSurfaceVariant)),
            const SizedBox(width: 10),
            Expanded(child: InlineRich(text)),
            if (correct) Icon(Icons.check_circle, size: 18, color: done),
          ],
        ),
      ),
    );
  }
}

class _Answer extends StatelessWidget {
  const _Answer({required this.label, required this.explanation});
  final String label;
  final String explanation;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final done = Palette.done(context);
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
            Icon(Icons.check_circle, size: 16, color: done),
            const SizedBox(width: 6),
            Text('정답 $label',
                style: TextStyle(fontWeight: FontWeight.w800, color: done)),
          ]),
          if (explanation.isNotEmpty) ...[
            const SizedBox(height: 8),
            InlineRich(explanation,
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
