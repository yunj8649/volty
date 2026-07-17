import 'package:flutter/material.dart';

/// Volty — 앱 마스코트. 동글동글한 노란 얼굴에 큰 눈·미소, 머리 위엔 번개 스파크.
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
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.045
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xFF7A4E00);

    // ── 머리 위 번개 스파크 ──
    final bolt = Path()
      ..moveTo(0.56 * w, 0.02 * h)
      ..lineTo(0.40 * w, 0.24 * h)
      ..lineTo(0.52 * w, 0.24 * h)
      ..lineTo(0.44 * w, 0.42 * h)
      ..lineTo(0.66 * w, 0.18 * h)
      ..lineTo(0.54 * w, 0.18 * h)
      ..close();
    canvas.drawPath(
        bolt, Paint()..color = const Color(0xFFFFC02E));
    canvas.drawPath(bolt, outline);

    // ── 얼굴(동글동글) ──
    final faceRect = Rect.fromCircle(
        center: Offset(0.5 * w, 0.66 * h), radius: 0.34 * w);
    final face = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFFDE59), Color(0xFFFFC02E)],
      ).createShader(faceRect);
    canvas.drawOval(faceRect, face);
    canvas.drawOval(faceRect, outline..strokeWidth = w * 0.05);

    // ── 볼터치(분홍) ──
    final blush = Paint()..color = const Color(0x55FF7A66);
    canvas.drawOval(
        Rect.fromCircle(center: Offset(0.28 * w, 0.72 * h), radius: 0.06 * w),
        blush);
    canvas.drawOval(
        Rect.fromCircle(center: Offset(0.72 * w, 0.72 * h), radius: 0.06 * w),
        blush);

    // ── 큰 눈 + 반짝임 ──
    final eyeL = Offset(0.38 * w, 0.62 * h);
    final eyeR = Offset(0.62 * w, 0.62 * h);
    final eyeBlack = Paint()..color = const Color(0xFF3A2600);
    final shine = Paint()..color = Colors.white;
    for (final e in [eyeL, eyeR]) {
      canvas.drawCircle(e, 0.095 * w, eyeBlack);
      canvas.drawCircle(
          e.translate(-0.03 * w, -0.035 * w), 0.035 * w, shine);
      canvas.drawCircle(
          e.translate(0.035 * w, 0.03 * w), 0.016 * w, shine);
    }

    // ── 미소 ──
    final smile = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.04
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xFF7A4E00);
    final smileRect = Rect.fromCircle(
        center: Offset(0.5 * w, 0.70 * h), radius: 0.10 * w);
    canvas.drawArc(smileRect, 0.35, 2.44, false, smile);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
