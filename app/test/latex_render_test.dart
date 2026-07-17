import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_math_fork/tex.dart';
import 'package:flutter_test/flutter_test.dart';

/// 모든 카드의 LaTeX 가 실제로 렌더링되는지 검증한다.
///
/// 앱은 파싱 실패를 crash 시키지 않고 빨간 원문(onErrorFallback)으로 떨군다 — 화면을
/// 봐야만 아는 결함이다. flutter_math_fork 의 파서가 던지는 지점이 곧 그 fallback 이
/// 뜨는 지점이라, 여기서 전 카드의 수식을 파싱해 미지원 명령을 잡는다.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final blockRe = RegExp(r'\$\$(.+?)\$\$', dotAll: true);
  final inlineRe = RegExp(r'\$([^$]+?)\$');

  test('전 카드의 LaTeX 가 flutter_math_fork 로 파싱된다', () async {
    final raw = await rootBundle.loadString('assets/cards.json');
    final doc = jsonDecode(raw) as Map<String, dynamic>;
    final cards = (doc['cards'] as List).cast<Map<String, dynamic>>();

    final snippets = <(String, String)>[]; // (cardId, tex)

    void fromProse(String id, String s) {
      for (final m in blockRe.allMatches(s)) {
        snippets.add((id, m.group(1)!.trim()));
      }
      for (final m in inlineRe.allMatches(s.replaceAll(blockRe, ' '))) {
        snippets.add((id, m.group(1)!.trim()));
      }
    }

    for (final c in cards) {
      final id = c['id'] as String;
      for (final f in (c['formulas'] as List).cast<Map<String, dynamic>>()) {
        snippets.add((id, f['tex'] as String)); // 원본 LaTeX (달러 없음)
        final note = f['note'] as String?;
        if (note != null) fromProse(id, note);
      }
      fromProse(id, c['summary'] as String);
      for (final t in (c['traps'] as List)) {
        fromProse(id, t as String);
      }
      for (final sec in (c['sections'] as List).cast<Map<String, dynamic>>()) {
        fromProse(id, sec['body'] as String);
      }
    }

    final failures = <String>[];
    for (final (id, tex) in snippets) {
      try {
        TexParser(tex, const TexParserSettings()).parse();
      } catch (e) {
        final short = tex.length > 60 ? '${tex.substring(0, 60)}…' : tex;
        failures.add('$id: $short  →  $e');
      }
    }

    expect(
      failures,
      isEmpty,
      reason: '수식 ${snippets.length}개 중 파싱 실패 ${failures.length}건:\n'
          '${failures.take(40).join('\n')}',
    );
  });
}
