import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_math_fork/tex.dart';
import 'package:flutter_test/flutter_test.dart';

/// 연습문제 데이터 무결성 — 정답 범위, 단원(major) 존재, ID 중복, LaTeX 파싱.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final inlineRe = RegExp(r'\$([^$]+?)\$');

  test('모든 문항이 유효하다', () async {
    final qdoc = jsonDecode(await rootBundle.loadString('assets/questions.json'))
        as Map<String, dynamic>;
    final questions = (qdoc['questions'] as List).cast<Map<String, dynamic>>();

    final tax = jsonDecode(await rootBundle.loadString('assets/taxonomy.json'))
        as Map<String, dynamic>;
    final majorIds = <String>{
      for (final s in (tax['subjects'] as List))
        for (final m in ((s as Map)['majors'] as List)) (m as Map)['id'] as String,
    };
    final subjectIds = <String>{
      for (final s in (tax['subjects'] as List)) (s as Map)['id'] as String,
    };

    final seen = <String>{};
    for (final q in questions) {
      final id = q['id'] as String;
      expect(seen.add(id), isTrue, reason: 'ID 중복: $id');

      final choices = (q['choices'] as List);
      expect(choices.length, inInclusiveRange(2, 5), reason: '$id 보기 수');

      final answer = q['answer'] as int;
      expect(answer, inInclusiveRange(0, choices.length - 1),
          reason: '$id 정답 인덱스 범위');

      expect(subjectIds.contains(q['subject']), isTrue,
          reason: '$id 과목 없음: ${q['subject']}');
      expect(majorIds.contains(q['major']), isTrue,
          reason: '$id 단원(major) 없음: ${q['major']}');

      // 지문·보기·해설·힌트의 $…$ LaTeX 가 렌더(파싱)되는지.
      final texts = <String>[
        q['stem'] as String,
        ...choices.cast<String>(),
        (q['explanation'] as String?) ?? '',
        (q['hint'] as String?) ?? '',
      ];
      for (final t in texts) {
        for (final m in inlineRe.allMatches(t)) {
          expect(() => TexParser(m.group(1)!, const TexParserSettings()).parse(),
              returnsNormally,
              reason: '$id LaTeX 파싱 실패: ${m.group(1)}');
        }
      }
    }
  });
}
