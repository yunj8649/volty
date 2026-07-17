import 'package:flutter/material.dart';

import '../models/card.dart';
import '../models/progress.dart';
import '../models/question.dart';
import '../models/taxonomy.dart';
import '../theme.dart';
import '../widgets/volty_mascot.dart';
import 'mock_menu_screen.dart';
import 'quiz_screen.dart';
import 'review_screen.dart';
import 'search_screen.dart';
import 'subject_screen.dart';

/// 과목 5개를 펼쳐놓는 첫 화면. 과목마다 학습 진척(완료/카드 수)을 함께 보여준다.
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.taxonomy,
    required this.cards,
    required this.progress,
    required this.questions,
  });

  final Taxonomy taxonomy;
  final CardLibrary cards;
  final StudyProgress progress;
  final QuestionBank questions;

  /// 한 과목이 가진 '카드가 있는' 세부항목 ID들. 진척 계산의 분모.
  List<String> _cardIds(Subject s) => [
        for (final major in s.majors)
          for (final minor in major.minors)
            if (cards.has(minor.id)) minor.id,
      ];

  /// 이어서 볼 과목: 아직 안 끝난 과목 중 학습 진척이 가장 낮은 것.
  /// 동률이면 출제기준 순서상 앞 과목. 다 끝냈으면 null.
  Subject? _recommend() {
    Subject? best;
    var bestRatio = 2.0;
    for (final s in taxonomy.subjects) {
      final ids = _cardIds(s);
      if (ids.isEmpty) continue;
      final ratio = progress.studiedAmong(ids) / ids.length;
      if (ratio >= 1.0) continue; // 완료 과목 제외
      if (ratio < bestRatio) {
        bestRatio = ratio;
        best = s;
      }
    }
    return best;
  }

  static const _examOrder = QuestionBank.examOrder;

  void _openMock(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (_) => MockMenuScreen(bank: questions, progress: progress),
        ),
      );

  void _startWrongNote(BuildContext context) {
    final qs = questions.byIds(progress.wrongIds)..shuffle();
    if (qs.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => QuizScreen(
          progress: progress,
          config: QuizConfig(title: '오답노트', questions: qs, isExam: false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 720;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VoltyMascot(size: 30),
            const SizedBox(width: 8),
            Text(
              'Volty',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: '카드 검색',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => SearchScreen(cards: cards, progress: progress),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bookmarks_outlined),
            tooltip: '모아보기 (즐겨찾기·이어보기)',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => ReviewScreen(cards: cards, progress: progress),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: '출제기준 정보',
            onPressed: () => showDialog<void>(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('출제기준'),
                content: Text(
                  '${taxonomy.source}\n\n'
                  '개념 ${taxonomy.conceptCount}개 · 이론 카드 ${cards.count}/198장\n'
                  '학습 완료 ${progress.studiedCount}/${cards.count}장\n'
                  '합격: 평균 ${taxonomy.passRule.averageMin}점 이상, '
                  '과목당 ${taxonomy.passRule.perSubjectMin}점 이상',
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      final ok = await showDialog<bool>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('학습 기록 초기화'),
                          content: const Text(
                            '학습 완료·즐겨찾기를 모두 지웁니다. 되돌릴 수 없습니다.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('취소'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('초기화'),
                            ),
                          ],
                        ),
                      );
                      if (ok == true) {
                        progress.clear();
                        if (context.mounted) Navigator.pop(context);
                      }
                    },
                    child: const Text('학습 기록 초기화'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('닫기'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: progress,
        builder: (context, _) => ListView(
          padding: EdgeInsets.symmetric(
            horizontal: wide ? 32 : 16,
            vertical: 16,
          ),
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 840),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _PassRuleBanner(),
                    const SizedBox(height: 12),
                    _NextUp(
                      subject: _recommend(),
                      studied: _recommend() == null
                          ? 0
                          : progress.studiedAmong(_cardIds(_recommend()!)),
                      cardCount: _recommend() == null
                          ? 0
                          : _cardIds(_recommend()!).length,
                      onTap: () {
                        final s = _recommend();
                        if (s == null) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => SubjectScreen(
                              subject: s,
                              cards: cards,
                              progress: progress,
                              questions: questions,
                            ),
                          ),
                        );
                      },
                    ),
                    if (questions.count > 0) ...[
                      const SizedBox(height: 12),
                      _MockExamCard(
                        count: _examOrder.fold(
                            0,
                            (a, sid) =>
                                a + questions.bySubject(sid).length.clamp(0, 20)),
                        lastScore: progress.lastExam?.score,
                        onTap: () => _openMock(context),
                      ),
                    ],
                    if (progress.wrongCount > 0) ...[
                      const SizedBox(height: 12),
                      _WrongNoteCard(
                        count: progress.wrongCount,
                        onTap: () => _startWrongNote(context),
                      ),
                    ],
                    const SizedBox(height: 20),
                    for (final s in taxonomy.subjects) ...[
                      _SubjectCard(
                        subject: s,
                        studied: progress.studiedAmong(_cardIds(s)),
                        cardCount: _cardIds(s).length,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => SubjectScreen(
                              subject: s,
                              cards: cards,
                              progress: progress,
                              questions: questions,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PassRuleBanner extends StatelessWidget {
  const _PassRuleBanner();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(Icons.flag_outlined, color: scheme.onPrimaryContainer),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '평균 60점 넘고, 한 과목도 40점 아래로 떨어지지 않기',
              style: TextStyle(
                color: scheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// "이어서 볼 과목" 추천 배너. 진척이 가장 뒤처진 과목을 지목한다.
/// 과락(과목당 40점)이 있는 시험이라, 고르게 못 봤을 때 가장 약한 데를 짚어준다.
class _NextUp extends StatelessWidget {
  const _NextUp({
    required this.subject,
    required this.studied,
    required this.cardCount,
    required this.onTap,
  });

  final Subject? subject;
  final int studied;
  final int cardCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    if (subject == null) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: scheme.secondaryContainer,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(Icons.celebration_outlined,
                color: scheme.onSecondaryContainer),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '198장을 모두 학습 완료했습니다. 이제 모아보기로 복습하세요.',
                style: TextStyle(
                  color: scheme.onSecondaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Material(
      color: scheme.primary,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.play_circle_fill, color: scheme.onPrimary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이어서 볼 과목',
                      style: TextStyle(
                        color: scheme.onPrimary.withValues(alpha: 0.85),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${subject!.name}  ·  학습 $studied/$cardCount',
                      style: TextStyle(
                        color: scheme.onPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: scheme.onPrimary),
            ],
          ),
        ),
      ),
    );
  }
}

/// 홈 진입 카드(모의고사·오답노트 공용 형태).
class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
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
                  color: iconColor.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor),
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
              Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}

class _MockExamCard extends StatelessWidget {
  const _MockExamCard(
      {required this.count, required this.lastScore, required this.onTap});
  final int count;
  final int? lastScore;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final minutes = (count * 1.5).ceil();
    final last = lastScore == null ? '' : ' · 지난 점수 $lastScore점';
    return _ActionCard(
      icon: Icons.timer_outlined,
      iconColor: Theme.of(context).colorScheme.primary,
      title: '모의고사',
      subtitle: '회차별·랜덤 · $count문항 · 약 $minutes분$last',
      onTap: onTap,
    );
  }
}

class _WrongNoteCard extends StatelessWidget {
  const _WrongNoteCard({required this.count, required this.onTap});
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _ActionCard(
      icon: Icons.replay_rounded,
      iconColor: Palette.trapFg(context),
      title: '오답노트',
      subtitle: '틀린 문제 $count개 다시 풀기',
      onTap: onTap,
    );
  }
}

class _SubjectCard extends StatelessWidget {
  const _SubjectCard({
    required this.subject,
    required this.studied,
    required this.cardCount,
    required this.onTap,
  });

  final Subject subject;
  final int studied;
  final int cardCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final done = cardCount > 0 && studied == cardCount;
    final ratio = cardCount == 0 ? 0.0 : studied / cardCount;
    return Material(
      color: scheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Palette.hairline(context)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subject.name,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${subject.questionCount}문항 · '
                          '주요항목 ${subject.majors.length} · '
                          '개념 ${subject.conceptCount}',
                          style: TextStyle(
                            color: scheme.onSurfaceVariant,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (done)
                    Icon(Icons.check_circle, color: scheme.primary, size: 20)
                  else
                    Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: ratio,
                        minHeight: 6,
                        backgroundColor: scheme.surfaceContainerHighest,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '학습 $studied/$cardCount',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
