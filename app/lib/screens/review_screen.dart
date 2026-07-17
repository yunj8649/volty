import 'package:flutter/material.dart';

import '../models/card.dart';
import '../models/progress.dart';
import '../theme.dart';
import 'card_screen.dart';

/// 모아보기. 흩어진 카드를 두 갈래로 다시 모은다.
///
///   즐겨찾기 — 별 붙인 카드. 시험 직전 다시 볼 것들.
///   이어보기 — 아직 학습 완료 안 한 카드. 출제기준 순서라 "다음 볼 것"이 위에 온다.
class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key, required this.cards, required this.progress});

  final CardLibrary cards;
  final StudyProgress progress;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('모아보기'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '즐겨찾기'),
              Tab(text: '이어보기'),
            ],
          ),
        ),
        body: ListenableBuilder(
          listenable: progress,
          builder: (context, _) {
            final bookmarked =
                cards.all.where((c) => progress.isBookmarked(c.id)).toList();
            final unstudied =
                cards.all.where((c) => !progress.isStudied(c.id)).toList();
            return TabBarView(
              children: [
                _CardList(
                  cards: bookmarked,
                  progress: progress,
                  empty: '즐겨찾기한 카드가 없습니다.\n카드 화면의 ★ 를 눌러 담아두세요.',
                ),
                _CardList(
                  cards: unstudied,
                  progress: progress,
                  empty: '모든 카드를 학습 완료했습니다. 🎉',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CardList extends StatelessWidget {
  const _CardList({
    required this.cards,
    required this.progress,
    required this.empty,
  });

  final List<TheoryCard> cards;
  final StudyProgress progress;
  final String empty;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    if (cards.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            empty,
            textAlign: TextAlign.center,
            style: TextStyle(color: scheme.onSurfaceVariant, height: 1.6),
          ),
        ),
      );
    }
    final wide = MediaQuery.sizeOf(context).width >= 720;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 840),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: wide ? 32 : 12, vertical: 12),
          itemCount: cards.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final card = cards[i];
            final studied = progress.isStudied(card.id);
            return Material(
              color: scheme.surface,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(color: Palette.hairline(context)),
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => CardScreen(
                      card: card,
                      progress: progress,
                      siblings: cards,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              card.path.take(2).join(' › '),
                              style: TextStyle(
                                fontSize: 12,
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (progress.isBookmarked(card.id))
                        Icon(Icons.star, size: 16, color: scheme.primary),
                      if (studied) ...[
                        const SizedBox(width: 6),
                        Icon(Icons.check_circle,
                            size: 16, color: scheme.primary),
                      ],
                      const SizedBox(width: 4),
                      Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
