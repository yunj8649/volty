import 'package:flutter/material.dart';

import '../models/card.dart';
import '../models/progress.dart';
import '../models/question.dart';
import '../models/taxonomy.dart';
import '../theme.dart';
import '../widgets/volty_mascot.dart';
import 'analysis_screen.dart';
import 'flashcard_screen.dart';
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

  /// 플래시카드로 넘겨볼 수 있는 공식 총수.
  int get _formulaCount =>
      cards.all.fold(0, (a, c) => a + c.formulas.length);

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

  /// 오늘 복습 예정(due)인 문제를 모아 푼다. 간격반복(SRS)의 핵심 진입.
  void _startReview(BuildContext context) {
    final qs = questions.byIds(progress.dueIds())..shuffle();
    if (qs.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => QuizScreen(
          progress: progress,
          config: QuizConfig(title: '오늘의 복습', questions: qs, isExam: false),
        ),
      ),
    );
  }

  void _openAnalysis(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (_) => AnalysisScreen(
            taxonomy: taxonomy,
            questions: questions,
            progress: progress,
          ),
        ),
      );

  /// 별표(헷갈린) 문제만 모아 다시 푼다.
  void _startStarred(BuildContext context) {
    final qs = questions.byIds(progress.questionBookmarks)..shuffle();
    if (qs.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => QuizScreen(
          progress: progress,
          config: QuizConfig(title: '즐겨찾은 문제', questions: qs, isExam: false),
        ),
      ),
    );
  }

  void _openFlashcards(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (_) => FlashcardScreen(cards: cards),
        ),
      );

  Future<void> _editGoal(BuildContext context) async {
    var g = progress.dailyGoal;
    final saved = await showDialog<int>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('일일 목표'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$g문제', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
              Slider(
                value: g.toDouble(),
                min: 5,
                max: 100,
                divisions: 19,
                label: '$g',
                onChanged: (v) => setState(() => g = v.round()),
              ),
              Text('하루에 풀 문제 수를 정해두면 스트릭을 이어가기 좋아요.',
                  style: TextStyle(fontSize: 12.5, color: Theme.of(context).colorScheme.onSurfaceVariant)),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
            FilledButton(onPressed: () => Navigator.pop(context, g), child: const Text('저장')),
          ],
        ),
      ),
    );
    if (saved != null) progress.setDailyGoal(saved);
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
            icon: const Icon(Icons.insights_outlined),
            tooltip: '실력 분석',
            onPressed: () => _openAnalysis(context),
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
                    _StreakStrip(
                      streak: progress.streak(),
                      today: progress.todayCount(),
                      goal: progress.dailyGoal,
                      days: progress.dayCounts,
                      onEditGoal: () => _editGoal(context),
                    ),
                    const SizedBox(height: 12),
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
                    if (progress.dueCount() > 0) ...[
                      const SizedBox(height: 12),
                      _ReviewCard(
                        count: progress.dueCount(),
                        onTap: () => _startReview(context),
                      ),
                    ],
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
                    if (progress.questionBookmarkCount > 0) ...[
                      const SizedBox(height: 12),
                      _StarredCard(
                        count: progress.questionBookmarkCount,
                        onTap: () => _startStarred(context),
                      ),
                    ],
                    if (_formulaCount > 0) ...[
                      const SizedBox(height: 12),
                      _FlashcardCard(
                        count: _formulaCount,
                        onTap: () => _openFlashcards(context),
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

/// 즐겨찾은(헷갈린) 문제 다시 풀기 카드.
class _StarredCard extends StatelessWidget {
  const _StarredCard({required this.count, required this.onTap});
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _ActionCard(
      icon: Icons.star_rounded,
      iconColor: const Color(0xFFF4B400),
      title: '즐겨찾은 문제',
      subtitle: '헷갈려서 담아둔 문제 $count개 다시 풀기',
      onTap: onTap,
    );
  }
}

/// 공식 암기 플래시카드 진입 카드.
class _FlashcardCard extends StatelessWidget {
  const _FlashcardCard({required this.count, required this.onTap});
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _ActionCard(
      icon: Icons.style_outlined,
      iconColor: Theme.of(context).colorScheme.secondary,
      title: '공식 암기',
      subtitle: '핵심 공식 $count개 · 이름 보고 떠올린 뒤 뒤집기',
      onTap: onTap,
    );
  }
}

/// 간격반복 복습 진입 카드. 오늘 복습할(due) 문항 수를 보여준다.
class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.count, required this.onTap});
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _ActionCard(
      icon: Icons.event_repeat_outlined,
      iconColor: Theme.of(context).colorScheme.tertiary,
      title: '오늘의 복습',
      subtitle: '복습할 때가 된 문제 $count개 · 망각곡선 간격 반복',
      onTap: onTap,
    );
  }
}

/// 스트릭·오늘 목표·최근 2주 잔디. 끊어 공부하는 습관을 눈에 보이게 한다.
class _StreakStrip extends StatelessWidget {
  const _StreakStrip({
    required this.streak,
    required this.today,
    required this.goal,
    required this.days,
    required this.onEditGoal,
  });

  final int streak;
  final int today;
  final int goal;
  final Map<int, int> days;
  final VoidCallback onEditGoal;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final ratio = goal == 0 ? 0.0 : (today / goal).clamp(0.0, 1.0);
    final metGoal = today >= goal;
    final todayIdx = StudyProgress.dayOf(DateTime.now());

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
      decoration: BoxDecoration(
        color: Palette.card(context),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Palette.hairline(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('🔥', style: TextStyle(fontSize: 20, color: scheme.onSurface)),
              const SizedBox(width: 8),
              Text('$streak일 연속',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
              const Spacer(),
              InkWell(
                onTap: onEditGoal,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '오늘 $today/$goal',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: metGoal ? scheme.primary : scheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Icon(Icons.tune, size: 14, color: scheme.onSurfaceVariant),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 6,
              backgroundColor: scheme.surfaceContainerHighest,
              color: metGoal ? scheme.primary : scheme.tertiary,
            ),
          ),
          const SizedBox(height: 12),
          // 최근 2주 잔디.
          Row(
            children: [
              for (var i = 13; i >= 0; i--)
                Expanded(
                  child: _HeatCell(
                    count: days[todayIdx - i] ?? 0,
                    goal: goal,
                    isToday: i == 0,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeatCell extends StatelessWidget {
  const _HeatCell({required this.count, required this.goal, required this.isToday});
  final int count;
  final int goal;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final Color c;
    if (count == 0) {
      c = scheme.surfaceContainerHighest;
    } else {
      final f = goal == 0 ? 1.0 : (count / goal).clamp(0.25, 1.0);
      c = Color.lerp(scheme.primary.withValues(alpha: 0.25), scheme.primary, f)!;
    }
    return Container(
      height: 18,
      margin: const EdgeInsets.symmetric(horizontal: 1.5),
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(4),
        border: isToday
            ? Border.all(color: scheme.primary, width: 1.5)
            : null,
      ),
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
