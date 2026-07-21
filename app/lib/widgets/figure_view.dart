import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/figure.dart';
import '../theme.dart';

/// 도식 렌더러. Figure 타입에 따라 CustomPaint 로 그리고 아래에 설명(caption)을 붙인다.
/// 데이터가 이상해도 앱이 죽지 않도록 방어적으로 읽는다.
class FigureView extends StatelessWidget {
  const FigureView({super.key, required this.figure});
  final Figure figure;

  static Color _color(String? name, ColorScheme s) {
    switch (name) {
      case 'red':
        return const Color(0xFFE53935);
      case 'green':
        return const Color(0xFF2E9E5B);
      case 'amber':
        return const Color(0xFFF4A300);
      case 'purple':
        return const Color(0xFF7E57C2);
      case 'blue':
        return const Color(0xFF1E77D3);
      default:
        return s.primary;
    }
  }

  CustomPainter? _painter(BuildContext context) {
    final s = Theme.of(context).colorScheme;
    final ink = s.onSurface;
    final faint = s.onSurfaceVariant.withValues(alpha: 0.45);
    switch (figure.type) {
      case 'waveform':
        return _WaveformPainter(figure.data, ink, faint, (n) => _color(n, s));
      case 'phasor':
        return _PhasorPainter(figure.data, ink, faint, (n) => _color(n, s));
      case 'triangle':
        return _TrianglePainter(figure.data, ink, faint, (n) => _color(n, s));
      case 'plot':
        return _PlotPainter(figure.data, ink, faint, (n) => _color(n, s));
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final painter = _painter(context);
    if (painter == null) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
      decoration: BoxDecoration(
        color: Palette.card(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Palette.hairline(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.7,
            child: CustomPaint(painter: painter, size: Size.infinite),
          ),
          if (figure.caption.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.image_outlined,
                    size: 14, color: scheme.onSurfaceVariant),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    figure.caption,
                    style: TextStyle(
                        fontFamily: 'NanumGothic',
                        fontSize: 12.5,
                        height: 1.45,
                        color: scheme.onSurfaceVariant),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ── 공통 헬퍼 ──
double _d(dynamic v, [double f = 0]) =>
    v is num ? v.toDouble() : (v is String ? double.tryParse(v) ?? f : f);

TextPainter _label(String text, Color color, double size) {
  // TextPainter 는 DefaultTextStyle 을 상속하지 않으므로 폰트를 명시한다(한글·그리스 두부 방지).
  final tp = TextPainter(
    text: TextSpan(
        text: text,
        style: TextStyle(
            fontFamily: 'NanumGothic',
            color: color,
            fontSize: size,
            fontWeight: FontWeight.w600)),
    textDirection: TextDirection.ltr,
  )..layout();
  return tp;
}

void _arrow(Canvas canvas, Offset from, Offset to, Paint paint, double head) {
  canvas.drawLine(from, to, paint);
  final ang = math.atan2(to.dy - from.dy, to.dx - from.dx);
  const spread = 0.4;
  final p1 = to -
      Offset(head * math.cos(ang - spread), head * math.sin(ang - spread));
  final p2 = to -
      Offset(head * math.cos(ang + spread), head * math.sin(ang + spread));
  final path = Path()
    ..moveTo(to.dx, to.dy)
    ..lineTo(p1.dx, p1.dy)
    ..lineTo(p2.dx, p2.dy)
    ..close();
  canvas.drawPath(path, Paint()..color = paint.color);
}

// ── 파형 ──
class _WaveformPainter extends CustomPainter {
  _WaveformPainter(this.d, this.ink, this.faint, this.color);
  final Map<String, dynamic> d;
  final Color ink, faint;
  final Color Function(String?) color;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final pad = w * 0.06;
    final midY = h * 0.52;
    final axis = Paint()
      ..color = faint
      ..strokeWidth = 1.2;
    // 축
    _arrow(canvas, Offset(pad, midY), Offset(w - pad * 0.5, midY), axis, 6);
    canvas.drawLine(Offset(pad, h * 0.08), Offset(pad, h * 0.95), axis);
    final tp = _label('t', faint, h * 0.10);
    tp.paint(canvas, Offset(w - pad, midY + 3));

    final waves = (d['waves'] as List?) ?? const [];
    final ampMax = waves.fold<double>(
        1.0, (m, wv) => math.max(m, _d((wv as Map)['amp'], 1)));
    final scaleY = (h * 0.40) / ampMax;
    final x0 = pad, x1 = w - pad * 0.5;
    var legendY = h * 0.06;
    for (final raw in waves) {
      final wv = raw as Map;
      final amp = _d(wv['amp'], 1);
      final cycles = _d(wv['cycles'], 2);
      final phase = _d(wv['phase']) * math.pi / 180;
      final rect = (wv['rectify'] as String?) ?? 'none';
      final c = color(wv['color'] as String?);
      final path = Path();
      var started = false;
      for (var px = 0.0; px <= 1.0001; px += 0.01) {
        var y = amp * math.sin(2 * math.pi * cycles * px + phase);
        if (rect == 'half') y = y < 0 ? 0 : y;
        if (rect == 'full') y = y.abs();
        final X = x0 + (x1 - x0) * px;
        final Y = midY - y * scaleY;
        if (!started) {
          path.moveTo(X, Y);
          started = true;
        } else {
          path.lineTo(X, Y);
        }
      }
      canvas.drawPath(
          path,
          Paint()
            ..color = c
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2.2
            ..strokeJoin = StrokeJoin.round);
      final lbl = wv['label'] as String?;
      if (lbl != null) {
        final t = _label(lbl, c, h * 0.11);
        t.paint(canvas, Offset(x1 - t.width - 2, legendY));
        legendY += t.height + 2;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _WaveformPainter old) => false;
}

// ── 페이저(벡터) 선도 ──
class _PhasorPainter extends CustomPainter {
  _PhasorPainter(this.d, this.ink, this.faint, this.color);
  final Map<String, dynamic> d;
  final Color ink, faint;
  final Color Function(String?) color;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final o = Offset(w * 0.5, h * 0.5);
    final R = math.min(w, h) * 0.40;
    final axis = Paint()
      ..color = faint
      ..strokeWidth = 1.0;
    // 기준 축(십자)
    canvas.drawLine(Offset(o.dx - R * 1.15, o.dy),
        Offset(o.dx + R * 1.15, o.dy), axis);
    canvas.drawLine(Offset(o.dx, o.dy - R * 1.1),
        Offset(o.dx, o.dy + R * 1.1), axis);

    final vecs = (d['vectors'] as List?) ?? const [];
    for (final raw in vecs) {
      final v = raw as Map;
      final mag = _d(v['mag'], 1).clamp(0.0, 1.0);
      final ang = _d(v['angle']) * math.pi / 180;
      final c = color(v['color'] as String?);
      final tip = Offset(
          o.dx + R * mag * math.cos(ang), o.dy - R * mag * math.sin(ang));
      _arrow(
          canvas,
          o,
          tip,
          Paint()
            ..color = c
            ..strokeWidth = 2.4
            ..strokeCap = StrokeCap.round,
          9);
      final lbl = v['label'] as String?;
      if (lbl != null) {
        final t = _label(lbl, c, h * 0.12);
        final off = Offset(tip.dx + 4 * math.cos(ang), tip.dy - 4 * math.sin(ang));
        t.paint(canvas, off.translate(ang.abs() > math.pi / 2 ? -t.width - 6 : 2,
            math.sin(ang) > 0 ? -t.height : 0));
      }
    }
  }

  @override
  bool shouldRepaint(covariant _PhasorPainter old) => false;
}

// ── 직각삼각형(전력·임피던스) ──
class _TrianglePainter extends CustomPainter {
  _TrianglePainter(this.d, this.ink, this.faint, this.color);
  final Map<String, dynamic> d;
  final Color ink, faint;
  final Color Function(String?) color;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final a = Offset(w * 0.14, h * 0.82); // 좌하(각 θ)
    final b = Offset(w * 0.80, h * 0.82); // 우하(직각)
    final c = Offset(w * 0.80, h * 0.20); // 우상
    final tri = Path()
      ..moveTo(a.dx, a.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(c.dx, c.dy)
      ..close();
    canvas.drawPath(tri, Paint()..color = color('blue').withValues(alpha: 0.10));
    canvas.drawPath(
        tri,
        Paint()
          ..color = color('blue')
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.2
          ..strokeJoin = StrokeJoin.round);
    // 직각 표시
    canvas.drawRect(
        Rect.fromLTWH(b.dx - h * 0.09, b.dy - h * 0.09, h * 0.09, h * 0.09),
        Paint()
          ..color = faint
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0);
    // θ 호
    canvas.drawArc(Rect.fromCircle(center: a, radius: h * 0.18), -0.72, 0.72,
        false, Paint()..color = faint..style = PaintingStyle.stroke..strokeWidth = 1.2);

    void lab(String? s, Offset at, {bool center = false}) {
      if (s == null || s.isEmpty) return;
      final t = _label(s, ink, h * 0.105);
      t.paint(canvas, center ? at.translate(-t.width / 2, 0) : at);
    }

    lab(d['base'] as String?, Offset((a.dx + b.dx) / 2, b.dy + 4), center: true);
    lab(d['height'] as String?, Offset(c.dx + 6, (b.dy + c.dy) / 2 - h * 0.05));
    lab(d['hyp'] as String?,
        Offset((a.dx + c.dx) / 2 - w * 0.02, (a.dy + c.dy) / 2 - h * 0.14));
    lab(d['angle'] as String? ?? 'θ', a.translate(h * 0.16, -h * 0.14));
  }

  @override
  bool shouldRepaint(covariant _TrianglePainter old) => false;
}

// ── x-y 특성곡선 ──
class _PlotPainter extends CustomPainter {
  _PlotPainter(this.d, this.ink, this.faint, this.color);
  final Map<String, dynamic> d;
  final Color ink, faint;
  final Color Function(String?) color;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final left = w * 0.12, right = w * 0.96, top = h * 0.10, bot = h * 0.84;
    final axis = Paint()
      ..color = faint
      ..strokeWidth = 1.2;
    _arrow(canvas, Offset(left, bot), Offset(right, bot), axis, 6); // x
    _arrow(canvas, Offset(left, bot), Offset(left, top), axis, 6); // y

    Offset pt(double x, double y) => Offset(
        left + (right - left) * x.clamp(0.0, 1.0),
        bot - (bot - top) * y.clamp(0.0, 1.0));

    final curves = (d['curves'] as List?) ?? const [];
    var legendY = top;
    for (final raw in curves) {
      final cv = raw as Map;
      final pts = (cv['points'] as List?) ?? const [];
      final c = color(cv['color'] as String?);
      final path = Path();
      var started = false;
      for (final p in pts) {
        final xy = p as List;
        final o = pt(_d(xy[0]), _d(xy[1]));
        if (!started) {
          path.moveTo(o.dx, o.dy);
          started = true;
        } else {
          path.lineTo(o.dx, o.dy);
        }
      }
      canvas.drawPath(
          path,
          Paint()
            ..color = c
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2.3
            ..strokeJoin = StrokeJoin.round);
      final lbl = cv['label'] as String?;
      if (lbl != null) {
        final t = _label(lbl, c, h * 0.11);
        t.paint(canvas, Offset(right - t.width, legendY));
        legendY += t.height + 2;
      }
    }
    // 축 라벨
    final xl = d['xlabel'] as String?;
    final yl = d['ylabel'] as String?;
    if (xl != null) {
      final t = _label(xl, faint, h * 0.10);
      t.paint(canvas, Offset(right - t.width, bot + 4));
    }
    if (yl != null) {
      final t = _label(yl, faint, h * 0.10);
      t.paint(canvas, Offset(left + 3, top - 2));
    }
  }

  @override
  bool shouldRepaint(covariant _PlotPainter old) => false;
}
