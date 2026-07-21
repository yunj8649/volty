/// 이론 카드의 도식(그림) 데이터. 글만으로 이해가 어려운 개념을 코드로 그린다.
///
/// 이미지 자산 없이 CustomPainter 로 렌더한다(웹 CSP·확대 문제 없음). 4가지 타입:
///   - waveform : 정현파·정류 파형
///   - phasor   : 페이저(벡터) 선도 — 전압/전류 위상, 3상, 대칭분
///   - triangle : 직각삼각형 — 전력삼각형(P·Q·S), 임피던스삼각형(R·X·Z)
///   - plot     : x-y 특성곡선 — 토크-슬립, V곡선, 히스테리시스 등
library;

class Figure {
  const Figure({required this.type, required this.caption, required this.data});

  final String type;
  final String caption;

  /// 타입별 원본 파라미터(렌더러가 방어적으로 읽는다).
  final Map<String, dynamic> data;

  factory Figure.fromJson(Map<String, dynamic> j) => Figure(
        type: (j['type'] as String?) ?? '',
        caption: (j['caption'] as String?) ?? '',
        data: j,
      );
}
