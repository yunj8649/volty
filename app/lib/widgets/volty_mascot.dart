import 'package:flutter/material.dart';

/// Volty — 앱 마스코트. 동글동글한 노란 얼굴에 큰 반짝이는 눈·발그레한 볼·앙증맞은 입,
/// 머리 위엔 번개 스파크와 반짝임(✦). "귀여움" 우선.
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

  void _sparkle(Canvas canvas, double cx, double cy, double s, Color color) {
    final p = Path()
      ..moveTo(cx, cy - s)
      ..lineTo(cx + 0.22 * s, cy - 0.22 * s)
      ..lineTo(cx + s, cy)
      ..lineTo(cx + 0.22 * s, cy + 0.22 * s)
      ..lineTo(cx, cy + s)
      ..lineTo(cx - 0.22 * s, cy + 0.22 * s)
      ..lineTo(cx - s, cy)
      ..lineTo(cx - 0.22 * s, cy - 0.22 * s)
      ..close();
    canvas.drawPath(p, Paint()..color = color);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.045
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..color = _brown;

    // ── 반짝임(머리 주변) ──
    _sparkle(canvas, 0.83 * w, 0.14 * h, 0.06 * w, const Color(0xFFFFD54A));
    _sparkle(canvas, 0.90 * w, 0.30 * h, 0.032 * w, const Color(0xFFFFE08A));
    _sparkle(canvas, 0.14 * w, 0.30 * h, 0.03 * w, const Color(0xFFFFE08A));

    // ── 머리 위 번개 스파크 (은은한 글로우 + 본체) ──
    final bolt = Path()
      ..moveTo(0.56 * w, 0.02 * h)
      ..lineTo(0.40 * w, 0.24 * h)
      ..lineTo(0.52 * w, 0.24 * h)
      ..lineTo(0.44 * w, 0.42 * h)
      ..lineTo(0.66 * w, 0.18 * h)
      ..lineTo(0.54 * w, 0.18 * h)
      ..close();
    canvas.drawPath(
        bolt,
        Paint()
          ..color = const Color(0x55FFD54A)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3));
    canvas.drawPath(bolt, Paint()..color = const Color(0xFFFFD23E));
    canvas.drawPath(bolt, outline);

    // ── 얼굴(더 동글·큰 머리) ──
    final faceRect = Rect.fromCircle(
        center: Offset(0.5 * w, 0.64 * h), radius: 0.36 * w);
    final face = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFFE87A), Color(0xFFFFC02E)],
      ).createShader(faceRect);
    canvas.drawOval(faceRect, face);

    // 윗부분 광택(볼록해 보이게).
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(0.42 * w, 0.46 * h), width: 0.34 * w, height: 0.20 * h),
      Paint()..color = const Color(0x40FFFFFF),
    );
    canvas.drawOval(faceRect, outline..strokeWidth = w * 0.05);

    // ── 발그레한 볼(더 크고 진하게) ──
    final blush = Paint()
      ..color = const Color(0x66FF8A8A)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.2);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(0.255 * w, 0.75 * h),
            width: 0.17 * w,
            height: 0.11 * h),
        blush);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(0.745 * w, 0.75 * h),
            width: 0.17 * w,
            height: 0.11 * h),
        blush);

    // ── 크고 반짝이는 눈 ──
    final eyeL = Offset(0.365 * w, 0.66 * h);
    final eyeR = Offset(0.635 * w, 0.66 * h);
    final eyeColor = Paint()..color = const Color(0xFF3A2600);
    final shine = Paint()..color = Colors.white;
    for (final e in [eyeL, eyeR]) {
      // 살짝 세로로 긴 눈(더 또렷·귀엽게).
      canvas.drawOval(
          Rect.fromCenter(
              center: e, width: 0.20 * w, height: 0.235 * w),
          eyeColor);
      // 큰 반짝임 + 작은 반짝임.
      canvas.drawCircle(e.translate(-0.045 * w, -0.05 * w), 0.05 * w, shine);
      canvas.drawCircle(e.translate(0.04 * w, 0.045 * w), 0.022 * w, shine);
    }

    // ── 앙증맞은 입 (ω 모양: 웃는 곡선 두 개) ──
    final mouth = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.038
      ..strokeCap = StrokeCap.round
      ..color = _brown;
    const start = 0.15; // 살짝 안쪽에서 시작해 부드럽게
    const sweep = 3.14159 - 0.30;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(0.435 * w, 0.80 * h), radius: 0.055 * w),
        start, sweep, false, mouth);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(0.565 * w, 0.80 * h), radius: 0.055 * w),
        start, sweep, false, mouth);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
