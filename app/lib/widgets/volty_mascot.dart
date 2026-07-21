import 'package:flutter/material.dart';

/// Volty — 앱 마스코트. 통통한 몸통에 작은 팔·다리, 머리 위엔 번개 뿔, 큰 반짝이는 눈의
/// 꼬마 전기 캐릭터. "귀여움" 우선.
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
  static const _bodyTop = Color(0xFFFFE87A);
  static const _bodyBot = Color(0xFFFFBE2A);

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
      ..strokeWidth = w * 0.04
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..color = _brown;
    Paint fill(Color c) => Paint()..color = c;

    // ── 반짝임 ──
    _sparkle(canvas, 0.90 * w, 0.20 * h, 0.05 * w, const Color(0xFFFFD54A));
    _sparkle(canvas, 0.10 * w, 0.30 * h, 0.035 * w, const Color(0xFFFFE08A));

    // ── 번개 뿔(머리 위 두 개) ──
    for (final dx in [-0.11, 0.11]) {
      final cx = (0.5 + dx) * w;
      final bolt = Path()
        ..moveTo(cx + 0.03 * w, 0.03 * h)
        ..lineTo(cx - 0.03 * w, 0.16 * h)
        ..lineTo(cx + 0.01 * w, 0.16 * h)
        ..lineTo(cx - 0.02 * w, 0.27 * h)
        ..lineTo(cx + 0.06 * w, 0.13 * h)
        ..lineTo(cx + 0.02 * w, 0.13 * h)
        ..close();
      canvas.drawPath(bolt, fill(const Color(0xFFFFD23E)));
      canvas.drawPath(bolt, line);
    }

    // ── 다리(몸통 뒤에서 살짝) ──
    for (final dx in [-0.14, 0.14]) {
      final r = Rect.fromCenter(
          center: Offset((0.5 + dx) * w, 0.90 * h),
          width: 0.16 * w,
          height: 0.12 * h);
      canvas.drawOval(r, fill(_bodyBot));
      canvas.drawOval(r, line);
    }

    // ── 팔(몸통 옆 작은 나뭇가지) ──
    for (final dx in [-1.0, 1.0]) {
      final ax = (0.5 + dx * 0.30) * w;
      final arm = Rect.fromCenter(
          center: Offset(ax, 0.62 * h), width: 0.11 * w, height: 0.16 * h);
      canvas.drawOval(arm, fill(_bodyTop));
      canvas.drawOval(arm, line);
    }

    // ── 몸통(통통한 물방울) ──
    final bodyRect =
        Rect.fromCenter(center: Offset(0.5 * w, 0.58 * h), width: 0.66 * w, height: 0.68 * h);
    final body = fill(_bodyTop)
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [_bodyTop, _bodyBot],
      ).createShader(bodyRect);
    canvas.drawOval(bodyRect, body);

    // 배 쪽 광택.
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(0.40 * w, 0.42 * h), width: 0.30 * w, height: 0.20 * h),
      fill(const Color(0x40FFFFFF)),
    );
    canvas.drawOval(bodyRect, line..strokeWidth = w * 0.045);

    // ── 발그레한 볼 ──
    final blush = fill(const Color(0x66FF8A8A));
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(0.30 * w, 0.66 * h), width: 0.14 * w, height: 0.09 * h),
        blush);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(0.70 * w, 0.66 * h), width: 0.14 * w, height: 0.09 * h),
        blush);

    // ── 크고 반짝이는 눈 ──
    final eyeL = Offset(0.38 * w, 0.55 * h);
    final eyeR = Offset(0.62 * w, 0.55 * h);
    final black = fill(const Color(0xFF3A2600));
    final shine = fill(Colors.white);
    for (final e in [eyeL, eyeR]) {
      canvas.drawOval(
          Rect.fromCenter(center: e, width: 0.18 * w, height: 0.22 * w), black);
      canvas.drawCircle(e.translate(-0.04 * w, -0.045 * w), 0.045 * w, shine);
      canvas.drawCircle(e.translate(0.035 * w, 0.04 * w), 0.02 * w, shine);
    }

    // ── 앙증맞은 ω 입 ──
    final mouth = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.035
      ..strokeCap = StrokeCap.round
      ..color = _brown;
    const st = 0.15, sw = 3.14159 - 0.3;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(0.455 * w, 0.68 * h), radius: 0.045 * w),
        st, sw, false, mouth);
    canvas.drawArc(
        Rect.fromCircle(center: Offset(0.545 * w, 0.68 * h), radius: 0.045 * w),
        st, sw, false, mouth);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
