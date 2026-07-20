import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:volty/widgets/handwriting_canvas.dart';

Widget _host(String key) => MaterialApp(
      home: Scaffold(
        body: HandwritingCanvas(
          key: ValueKey(key),
          storageKey: key,
          child: const SizedBox.expand(child: ColoredBox(color: Colors.white)),
        ),
      ),
    );

void main() {
  testWidgets('펜슬 필기가 저장되고 다시 불러온다', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(_host('note_a'));
    await tester.pumpAndSettle();

    var prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('note_a'), isNull);

    // 애플펜슬로 한 획 — 도구막대를 열지 않아도 펜슬은 항상 그려진다.
    final g = await tester.startGesture(const Offset(120, 160),
        kind: PointerDeviceKind.stylus);
    await g.moveBy(const Offset(40, 0));
    await g.moveBy(const Offset(40, 20));
    await g.up();
    await tester.pumpAndSettle();

    prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('note_a');
    expect(saved, isNotNull);
    expect(saved, contains('"p"'));

    // 다른 화면(위젯 키는 다르되 같은 저장키)에서 열면 이전 필기를 불러온다 → 도구 열면 되돌리기가 산다.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: HandwritingCanvas(
          key: const ValueKey('reopen'),
          storageKey: 'note_a',
          child: const SizedBox.expand(child: ColoredBox(color: Colors.white)),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.edit_outlined)); // 도구막대 열기
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.undo), findsOneWidget);
  });

  testWidgets('펜슬은 필기로 가로채고, 손가락은 아래 버튼을 누른다', (tester) async {
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

    // 손가락 탭 → 아래 버튼이 눌린다(스크롤·선택 그대로).
    await tester.tap(find.text('보기'));
    expect(tapped, isTrue);

    // 펜슬 탭 → 인식기가 포인터를 가로채 버튼이 안 눌린다.
    tapped = false;
    final g = await tester.startGesture(tester.getCenter(find.text('보기')),
        kind: PointerDeviceKind.stylus);
    await g.up();
    await tester.pump();
    expect(tapped, isFalse);
  });

  testWidgets('손가락 필기를 켜면 손가락으로도 그려진다', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(_host('note_finger'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.edit_outlined)); // 도구 열기
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.back_hand_outlined)); // 손가락 필기 켜기
    await tester.pumpAndSettle();

    final g = await tester.startGesture(const Offset(100, 150),
        kind: PointerDeviceKind.touch);
    await g.moveBy(const Offset(40, 0));
    await g.moveBy(const Offset(0, 30));
    await g.up();
    await tester.pumpAndSettle();

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('note_finger'), isNotNull);
  });
}
