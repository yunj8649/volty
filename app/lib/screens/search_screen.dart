import 'package:flutter/material.dart';

import '../models/card.dart';
import '../models/progress.dart';
import '../theme.dart';
import 'card_screen.dart';

/// 카드 검색. 제목·요약·항목 경로·id 를 훑는다.
///
/// 시험 공부는 비선형이다 — "델타결선 어디였지" 하고 바로 튀어가고 싶다. 트리를
/// 파고들 필요 없이 단어로 찾는다.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.cards, required this.progress});

  final CardLibrary cards;
  final StudyProgress progress;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<TheoryCard> get _results {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return const [];
    return widget.cards.all.where((c) {
      final hay = [
        c.title,
        c.summary,
        c.id,
        c.path.join(' '),
      ].join(' ').toLowerCase();
      return hay.contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final wide = MediaQuery.sizeOf(context).width >= 720;
    final results = _results;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          textInputAction: TextInputAction.search,
          decoration: const InputDecoration(
            hintText: '카드 검색 (제목·요약·항목)',
            border: InputBorder.none,
          ),
          onChanged: (v) => setState(() => _query = v),
        ),
        actions: [
          if (_query.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              tooltip: '지우기',
              onPressed: () {
                _controller.clear();
                setState(() => _query = '');
              },
            ),
        ],
      ),
      body: _query.trim().isEmpty
          ? Center(
              child: Text(
                '단어로 카드를 찾습니다.',
                style: TextStyle(color: scheme.onSurfaceVariant),
              ),
            )
          : results.isEmpty
              ? Center(
                  child: Text(
                    "'$_query' 에 맞는 카드가 없습니다.",
                    style: TextStyle(color: scheme.onSurfaceVariant),
                  ),
                )
              : Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 840),
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                          horizontal: wide ? 32 : 12, vertical: 12),
                      itemCount: results.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                      itemBuilder: (context, i) {
                        final card = results[i];
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
                                progress: widget.progress,
                                siblings: results,
                              ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    card.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    card.path.take(2).join(' › '),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: scheme.onSurfaceVariant),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    card.summary,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.5,
                                      color: scheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
    );
  }
}
