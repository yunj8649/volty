import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../models/card.dart';
import '../theme.dart';
import '../widgets/card_body.dart';

/// 공식 암기 플래시카드. 카드들의 '핵심 공식'을 모아, 이름만 보고 식을 떠올린 뒤
/// 뒤집어 확인한다. 전기기사는 공식이 곧 점수라, 끊어서 반복 암기하기 좋게 만들었다.
class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key, required this.cards});

  final CardLibrary cards;

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _Item {
  const _Item(this.card, this.formula);
  final TheoryCard card;
  final Formula formula;
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  late final List<_Item> _all;
  late final Map<String, String> _subjectNames; // 과목코드 -> 이름

  String _subject = '전체';
  List<_Item> _deck = [];
  int _index = 0;
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _all = [
      for (final c in widget.cards.all)
        for (final f in c.formulas) _Item(c, f),
    ];
    _subjectNames = {
      for (final c in widget.cards.all)
        if (c.path.isNotEmpty) c.subject: c.path.first,
    };
    _rebuild();
  }

  void _rebuild() {
    _deck = _subject == '전체'
        ? List.of(_all)
        : _all.where((i) => i.card.subject == _subject).toList();
    _index = 0;
    _revealed = false;
  }

  void _shuffle() => setState(() {
        _deck.shuffle();
        _index = 0;
        _revealed = false;
      });

  void _go(int delta) => setState(() {
        _index = (_index + delta).clamp(0, _deck.length - 1);
        _revealed = false;
      });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final subjects = ['전체', ..._subjectNames.keys];

    return Scaffold(
      appBar: AppBar(
        title: const Text('공식 암기'),
        actions: [
          IconButton(
            tooltip: '섞기',
            icon: const Icon(Icons.shuffle),
            onPressed: _deck.isEmpty ? null : _shuffle,
          ),
        ],
      ),
      body: Column(
        children: [
          // 과목 필터.
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
                      label: Text(s == '전체' ? '전체' : (_subjectNames[s] ?? s)),
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
            child: _deck.isEmpty
                ? Center(
                    child: Text('이 과목에는 공식 카드가 없습니다.',
                        style: TextStyle(color: scheme.onSurfaceVariant)),
                  )
                : Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 640),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                        child: GestureDetector(
                          onTap: () => setState(() => _revealed = !_revealed),
                          child: _FlipCard(
                            item: _deck[_index],
                            revealed: _revealed,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          if (_deck.isNotEmpty)
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

class _FlipCard extends StatelessWidget {
  const _FlipCard({required this.item, required this.revealed});
  final _Item item;
  final bool revealed;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final f = item.formula;
    final front = f.label ?? item.card.title;
    final source = item.card.path.take(2).join(' › ');

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      transitionBuilder: (child, anim) => FadeTransition(
        opacity: anim,
        child: ScaleTransition(
            scale: Tween(begin: 0.97, end: 1.0).animate(anim), child: child),
      ),
      child: Container(
        key: ValueKey(revealed),
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: revealed ? Palette.formulaBg(context) : Palette.card(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: revealed
                ? Palette.formulaBorder(context)
                : Palette.hairline(context),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(source,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
            const SizedBox(height: 20),
            if (!revealed) ...[
              Text(front,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800, height: 1.4)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.touch_app_outlined,
                      size: 16, color: scheme.onSurfaceVariant),
                  const SizedBox(width: 6),
                  Text('공식을 떠올린 뒤 탭해서 확인',
                      style: TextStyle(
                          fontSize: 13, color: scheme.onSurfaceVariant)),
                ],
              ),
            ] else ...[
              if (f.label != null) ...[
                Text(f.label!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: scheme.primary)),
                const SizedBox(height: 14),
              ],
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Math.tex(
                  f.tex,
                  textStyle: TextStyle(
                      fontFamily: 'NanumGothic',
                      fontSize: 22,
                      color: scheme.onSurface),
                  onErrorFallback: (e) => Text(f.tex,
                      style: TextStyle(color: scheme.error, fontSize: 13)),
                ),
              ),
              if (f.note != null) ...[
                const SizedBox(height: 16),
                CardBody(f.note!),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
