import 'package:flutter/material.dart';

/// Volty — 앱 마스코트. 말랑말랑한 슬라임(젤리) 몸통에 큰 반짝이는 눈, 발그레한 볼,
/// 앙증맞은 입, 머리 위엔 번개 스파크. "말랑·귀여움" 우선.
///
/// 이미지 자산 없이 CustomPainter 로 그린다(선명하게 확대되고 웹 CSP·폰트 문제 없음).
class VoltyMascot extends StatelessWidget {
  const VoltyMascot({super.key, this.size = 32});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _VoltyPainter()),
    );
  }
}

class _VoltyPainter extends CustomPainter {
  static const _brown = Color(0xFF7A4E00);
  static const _top = Color(0xFFFFEA85);
  static const _bot = Color(0xFFFFBE2A);

  void _sparkle(Canvas c, double x, double y, double s, Color col) {
    final p = Path()
      ..moveTo(x, y - s)
      ..lineTo(x + 0.22 * s, y - 0.22 * s)
      ..lineTo(x + s, y)
      ..lineTo(x + 0.22 * s, y + 0.22 * s)
      ..lineTo(x, y + s)
      ..lineTo(x - 0.22 * s, y + 0.22 * s)
      ..lineTo(x - s, y)
      ..lineTo(x - 0.22 * s, y - 0.22 * s)
      ..close();
    c.drawPath(p, Paint()..color = col);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final line = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.045
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..color = _brown;
    Paint fill(Color c) => Paint()..color = c;

    // ── 반짝임 + 머리 위 작은 번개 ──
    _sparkle(canvas, 0.86 * w, 0.20 * h, 0.05 * w, const Color(0xFFFFD54A));
    _sparkle(canvas, 0.13 * w, 0.28 * h, 0.035 * w, const Color(0xFFFFE08A));
    final bolt = Path()
      ..moveTo(0.55 * w, 0.02 * h)
      ..lineTo(0.44 * w, 0.15 * h)
      ..lineTo(0.52 * w, 0.15 * h)
      ..lineTo(0.46 * w, 0.26 * h)
      ..lineTo(0.60 * w, 0.11 * h)
      ..lineTo(0.52 * w, 0.11 * h)
      ..close();
    canvas.drawPath(bolt, fill(const Color(0xFFFFD23E)));
    canvas.drawPath(bolt, line);

    // ── 튀는 물방울(젤리가 튀는 느낌) ──
    canvas.drawCircle(Offset(0.90 * w, 0.60 * h), 0.028 * w, fill(_bot));
    canvas.drawCircle(Offset(0.90 * w, 0.60 * h), 0.028 * w, line);

    // ── 슬라임 몸통(말랑한 젤리 블롭: 위는 몽글, 아래는 넓고 물결) ──
    final body = Path()
      ..moveTo(0.12 * w, 0.72 * h)
      ..cubicTo(0.03 * w, 0.52 * h, 0.13 * w, 0.30 * h, 0.34 * w, 0.28 * h)
      ..cubicTo(0.40 * w, 0.20 * h, 0.46 * w, 0.24 * h, 0.50 * w, 0.30 * h)
      ..cubicTo(0.55 * w, 0.22 * h, 0.64 * w, 0.24 * h, 0.68 * w, 0.31 * h)
      ..cubicTo(0.89 * w, 0.34 * h, 0.96 * w, 0.54 * h, 0.87 * w, 0.72 * h)
      ..cubicTo(0.90 * w, 0.82 * h, 0.83 * w, 0.90 * h, 0.74 * w, 0.86 * h)
      ..cubicTo(0.68 * w, 0.91 * h, 0.60 * w, 0.90 * h, 0.56 * w, 0.86 * h)
      ..cubicTo(0.50 * w, 0.90 * h, 0.40 * w, 0.90 * h, 0.36 * w, 0.85 * h)
      ..cubicTo(0.30 * w, 0.91 * h, 0.20 * w, 0.90 * h, 0.20 * w, 0.82 * h)
      ..cubicTo(0.12 * w, 0.84 * h, 0.09 * w, 0.78 * h, 0.12 * w, 0.72 * h)
      ..close();
    final bodyRect = Rect.fromLTRB(0.03 * w, 0.20 * h, 0.97 * w, 0.92 * h);
    canvas.drawPath(
      body,
      fill(_top)
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [_top, _bot],
        ).createShader(bodyRect),
    );
    canvas.drawPath(body, line..strokeWidth = w * 0.05);

    // ── 젤리 광택(큰 하이라이트 + 작은 점) ──
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(0.36 * w, 0.42 * h), width: 0.26 * w, height: 0.18 * h),
      fill(const Color(0x55FFFFFF)),
    );
    canvas.drawCircle(Offset(0.66 * w, 0.40 * h), 0.03 * w, fill(const Color(0x66FFFFFF)));

    // ── 발그레한 볼 ──
    final blush = fill(const Color(0x66FF8A8A));
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(0.30 * w, 0.66 * h), width: 0.13 * w, height: 0.085 * h),
        blush);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(0.70 * w, 0.66 * h), width: 0.13 * w, height: 0.085 * h),
        blush);

    // ── 크고 반짝이는 눈 ──
    final black = fill(const Color(0xFF3A2600));
    final shine = fill(Colors.white);
    for (final e in [Offset(0.39 * w, 0.58 * h), Offset(0.61 * w, 0.58 * h)]) {
      canvas.drawOval(
          Rect.fromCenter(center: e, width: 0.17 * w, height: 0.21 * w), black);
      canvas.drawCircle(e.translate(-0.037 * w, -0.045 * w), 0.043 * w, shine);
      canvas.drawCircle(e.translate(0.033 * w, 0.038 * w), 0.019 * w, shine);
    }

    // ── 앙증맞은 ω 입 ──
    final mouth = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.035
      ..strokeCap = StrokeCap.round
      ..color = _brown;
    const st = 0.15, sw = 3.14159 - 0.3;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(0.455 * w, 0.72 * h), radius: 0.045 * w),
        st, sw, false, mouth);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(0.545 * w, 0.72 * h), radius: 0.045 * w),
        st, sw, false, mouth);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
