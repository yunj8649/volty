import 'package:flutter_math_fork/tex.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:volty/screens/calc_tips_screen.dart';
import 'package:volty/screens/exam_tips_screen.dart';

/// 계산 팁·시험 꿀팁은 정적 데이터라 문항 오라클 밖에 있다.
/// 여기 $…$ LaTeX 가 flutter_math_fork 로 파싱되는지 따로 지킨다.
void main() {
  final inlineRe = RegExp(r'\$([^$]+?)\$');

  void check(List<(String, List<(String, String)>)> sections, String label) {
    for (final section in sections) {
      for (final tip in section.$2) {
        for (final text in [tip.$1, tip.$2]) {
          for (final m in inlineRe.allMatches(text)) {
            expect(
              () => TexParser(m.group(1)!, const TexParserSettings()).parse(),
              returnsNormally,
              reason: '$label LaTeX 파싱 실패: ${m.group(1)}',
            );
          }
        }
      }
    }
  }

  test('계산 팁·시험 꿀팁의 LaTeX 가 모두 파싱된다', () {
    check(CalcTipsScreen.sections, '계산 팁');
    check(ExamTipsScreen.sections, '시험 꿀팁');
  });
}
