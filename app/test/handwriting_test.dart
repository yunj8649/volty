import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:volty/widgets/handwriting_canvas.dart';

void main() {
  testWidgets('펜슬 필기가 저장되고 다시 불러온다', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: HandwritingCanvas(
          key: ValueKey('a'),
          storageKey: 'note_test',
          child: SizedBox.expand(child: ColoredBox(color: Colors.white)),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    // 필기 Off 상태에서는 저장된 것이 없다.
    var prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('note_test'), isNull);

    // 토글을 눌러 필기 On.
    await tester.tap(find.byIcon(Icons.edit_outlined));
    await tester.pumpAndSettle();

    // 애플펜슬로 한 획 긋는다.
    final g = await tester.startGesture(const Offset(120, 160),
        kind: PointerDeviceKind.stylus);
    await g.moveBy(const Offset(40, 0));
    await g.moveBy(const Offset(40, 20));
    await g.up();
    await tester.pumpAndSettle();

    // 획이 기기에 저장됐다.
    prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('note_test');
    expect(saved, isNotNull);
    expect(saved, contains('"p"')); // 점 배열이 직렬화됐다

    // 같은 저장키를 새 화면(다른 위젯 키)에서 열면 이전 필기를 불러온다.
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: HandwritingCanvas(
          key: ValueKey('b'),
          storageKey: 'note_test',
          child: SizedBox.expand(child: ColoredBox(color: Colors.white)),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    // 되돌리기 버튼을 쓰려면 필기 On 이어야 한다 — 불러온 획이 있으면 On 시 버튼이 살아난다.
    await tester.tap(find.byIcon(Icons.edit_outlined));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.undo), findsOneWidget);
  });

  testWidgets('필기 Off 면 아래 위젯이 탭을 받는다', (tester) async {
    SharedPreferences.setMockInitialValues({});
    var tapped = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: HandwritingCanvas(
          storageKey: 'note_tap',
          child: Center(
            child: ElevatedButton(
              onPressed: () => tapped = true,
              child: const Text('보기'),
            ),
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    // Off(기본) 상태: 아래 버튼이 눌린다.
    await tester.tap(find.text('보기'));
    expect(tapped, isTrue);

    // On 으로 바꾸면 본문이 잠겨 버튼이 안 눌린다.
    tapped = false;
    await tester.tap(find.byIcon(Icons.edit_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.text('보기'), warnIfMissed: false);
    expect(tapped, isFalse);
  });
}
