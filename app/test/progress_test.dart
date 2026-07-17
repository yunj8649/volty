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
}
