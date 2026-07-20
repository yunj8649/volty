import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:volty/models/progress.dart';

/// 학습 기록은 앱 상태의 핵심이고 기기에 영속된다. 토글·집계·저장을 검증한다.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('학습 완료 토글이 상태와 카운트에 반영된다', () async {
    final p = await StudyProgress.load();
    expect(p.isStudied('em.1.1'), isFalse);
    expect(p.studiedCount, 0);

    p.toggleStudied('em.1.1');
    expect(p.isStudied('em.1.1'), isTrue);
    expect(p.studiedCount, 1);

    p.toggleStudied('em.1.1');
    expect(p.isStudied('em.1.1'), isFalse);
    expect(p.studiedCount, 0);
  });

  test('즐겨찾기는 학습 완료와 독립적이다', () async {
    final p = await StudyProgress.load();
    p.toggleBookmark('mc.5.3');
    expect(p.isBookmarked('mc.5.3'), isTrue);
    expect(p.isStudied('mc.5.3'), isFalse);
    expect(p.bookmarkCount, 1);
  });

  test('문제 즐겨찾기는 카드 즐겨찾기와 분리되어 저장·복원된다', () async {
    var p = await StudyProgress.load();
    expect(p.isQuestionBookmarked('em.1.r1'), isFalse);
    p.toggleQuestionBookmark('em.1.r1');
    expect(p.isQuestionBookmarked('em.1.r1'), isTrue);
    expect(p.questionBookmarkCount, 1);
    expect(p.bookmarkCount, 0); // 카드 즐겨찾기와 별개

    p = await StudyProgress.load(); // 다시 로드
    expect(p.questionBookmarks, contains('em.1.r1'));
  });

  test('studiedAmong 은 교집합 수를 센다', () async {
    final p = await StudyProgress.load();
    p.toggleStudied('a');
    p.toggleStudied('b');
    expect(p.studiedAmong(['a', 'b', 'c']), 2);
    expect(p.studiedAmong(['c', 'd']), 0);
    expect(p.studiedAmong(const []), 0);
  });

  test('toggle 은 리스너에게 알린다', () async {
    final p = await StudyProgress.load();
    var notified = 0;
    p.addListener(() => notified++);
    p.toggleStudied('x');
    p.toggleBookmark('y');
    expect(notified, 2);
  });

  test('완료 기록이 저장소에 남는다', () async {
    final p = await StudyProgress.load();
    p.toggleStudied('kec.5.1');
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getStringList('studied_ids'), contains('kec.5.1'));
  });

  test('clear 는 완료·즐겨찾기를 모두 지운다', () async {
    final p = await StudyProgress.load();
    p.toggleStudied('a');
    p.toggleBookmark('b');
    p.clear();
    expect(p.studiedCount, 0);
    expect(p.bookmarkCount, 0);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getStringList('studied_ids'), isNull);
  });

  // ── 간격반복(SRS)·스트릭·단원 통계 ──
  final d0 = DateTime(2026, 7, 20);
  final d1 = DateTime(2026, 7, 21);
  final d2 = DateTime(2026, 7, 22);
  final d4 = DateTime(2026, 7, 24);

  test('오답은 오늘 복습 대상, 정답은 상자가 올라가 미뤄진다', () async {
    final p = await StudyProgress.load();
    p.recordAnswers([(id: 'q1', major: 'em.1', correct: false)], now: d0);
    expect(p.dueIds(now: d0), contains('q1'));
    expect(p.wrongCount, 1);

    p.recordAnswers([(id: 'q1', major: 'em.1', correct: true)], now: d0);
    expect(p.dueIds(now: d0), isEmpty); // 내일로 미뤄짐
    expect(p.wrongCount, 0);
    expect(p.dueIds(now: d1), contains('q1'));
  });

  test('단원 통계가 누적된다', () async {
    final p = await StudyProgress.load();
    p.recordAnswers([
      (id: 'a', major: 'pw.1', correct: true),
      (id: 'b', major: 'pw.1', correct: false),
    ], now: d0);
    final st = p.majorStat('pw.1')!;
    expect(st.attempts, 2);
    expect(st.correct, 1);
    expect(st.accuracy, closeTo(0.5, 1e-9));
  });

  test('스트릭·오늘 학습량이 집계된다', () async {
    final p = await StudyProgress.load();
    p.recordAnswers([(id: 'a', major: 'em.1', correct: true)], now: d0);
    expect(p.todayCount(now: d0), 1);
    expect(p.streak(now: d0), 1);
    p.recordAnswers([(id: 'b', major: 'em.1', correct: true)], now: d1);
    p.recordAnswers([(id: 'c', major: 'em.1', correct: true)], now: d2);
    expect(p.streak(now: d2), 3);
    expect(p.streak(now: d4), 0); // 하루 이상 건너뛰면 끊긴다
  });

  test('일일 목표와 기록이 저장·복원된다', () async {
    var p = await StudyProgress.load();
    expect(p.dailyGoal, StudyProgress.defaultGoal);
    p.setDailyGoal(15);
    p.recordAnswers([(id: 'q9', major: 'ct.1', correct: false)], now: d0);

    p = await StudyProgress.load(); // 다시 로드
    expect(p.dailyGoal, 15);
    expect(p.dueIds(now: d0), contains('q9'));
    expect(p.majorStat('ct.1')!.attempts, 1);
  });
}
