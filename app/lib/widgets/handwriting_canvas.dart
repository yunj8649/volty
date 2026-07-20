/// 손필기 레이어. 문제·이론 카드 본문 위에 애플펜슬로 풀이를 끄적이는 스크래치 판.
///
/// 직장인은 계산문제를 손으로 풀어봐야 는다 — 문제 옆에서 바로 필기하고, 그 필기가
/// 문항·카드별로 기기에 남아 다시 볼 수 있어야 한다. shared_preferences 라 웹은
/// localStorage, 네이티브는 각 OS 저장소에 들어간다.
///
/// 상호작용 규칙:
///   - 필기 Off — 필기는 보이되 잠긴다. 아래 문제 풀이·스크롤이 그대로 된다.
///   - 필기 On  — 본문을 덮어 그리기 전용. 애플펜슬(stylus)이 한 번이라도 감지되면
///                그 뒤 손바닥 터치는 무시한다(팜 리젝션). 펜슬이 없으면 손가락으로 그린다.
library;

import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme.dart';

/// 한 획. 색은 테마(라이트/다크)에 맞춰 그릴 때 풀어야 하므로 인덱스로만 저장한다.
class _Stroke {
  _Stroke(this.colorIdx, this.width, this.points);
  final int colorIdx; // 0 펜, 1 빨강, 2 형광펜
  final double width;
  final List<Offset> points;

  Map<String, dynamic> toJson() => {
        'k': colorIdx,
        'w': width,
        'p': [for (final o in points) ...[o.dx, o.dy]],
      };

  static _Stroke? fromJson(Map<String, dynamic> j) {
    final raw = (j['p'] as List?) ?? const [];
    final pts = <Offset>[];
    for (var i = 0; i + 1 < raw.length; i += 2) {
      pts.add(Offset((raw[i] as num).toDouble(), (raw[i + 1] as num).toDouble()));
    }
    if (pts.isEmpty) return null;
    return _Stroke(
      (j['k'] as num?)?.toInt() ?? 0,
      (j['w'] as num?)?.toDouble() ?? 2.4,
      pts,
    );
  }
}

class HandwritingCanvas extends StatefulWidget {
  const HandwritingCanvas({
    super.key,
    required this.storageKey,
    required this.child,
  });

  /// 필기를 문항·카드와 묶는 키(예: 'note_em.1.r3'). 이 값이 저장 키가 된다.
  final String storageKey;
  final Widget child;

  @override
  State<HandwritingCanvas> createState() => _HandwritingCanvasState();
}

class _HandwritingCanvasState extends State<HandwritingCanvas> {
  static const _penWidth = 2.4;
  static const _highlightWidth = 15.0;

  final List<_Stroke> _strokes = [];
  _Stroke? _current;
  int? _activePointer; // 지금 그리는 포인터 하나만 따라간다(멀티터치 무시)
  bool _sawStylus = false; // 펜슬을 본 적 있으면 손가락은 팜으로 취급

  bool _enabled = false;
  bool _eraser = false;
  int _colorIdx = 0;

  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(widget.storageKey);
    if (!mounted) return;
    setState(() {
      _prefs = prefs;
      _strokes.clear();
      if (raw != null) {
        try {
          for (final e in jsonDecode(raw) as List) {
            final s = _Stroke.fromJson(e as Map<String, dynamic>);
            if (s != null) _strokes.add(s);
          }
        } catch (_) {/* 손상된 필기는 버린다 */}
      }
    });
  }

  void _save() {
    _prefs?.setString(
      widget.storageKey,
      jsonEncode([for (final s in _strokes) s.toJson()]),
    );
  }

  double _strokeWidth(PointerEvent e) {
    if (_colorIdx == 2) return _highlightWidth;
    // 펜슬 필압이 있으면 굵기에 반영(없으면 기본값).
    final range = e.pressureMax - e.pressureMin;
    if (range > 0.0001) {
      final p = ((e.pressure - e.pressureMin) / range).clamp(0.0, 1.0);
      return _penWidth * (0.55 + 0.9 * p);
    }
    return _penWidth;
  }

  bool _shouldDraw(PointerDownEvent e) {
    if (!_enabled) return false;
    if (e.kind == ui.PointerDeviceKind.stylus ||
        e.kind == ui.PointerDeviceKind.invertedStylus) {
      _sawStylus = true;
      return true;
    }
    if (e.kind == ui.PointerDeviceKind.touch) {
      return !_sawStylus; // 펜슬을 쓰는 중이면 손바닥으로 보고 무시
    }
    return true; // 마우스·트랙패드(데스크톱 확인용)
  }

  void _down(PointerDownEvent e) {
    if (_activePointer != null || !_shouldDraw(e)) return;
    _activePointer = e.pointer;
    if (_eraser) {
      _eraseAt(e.localPosition);
      return;
    }
    setState(() {
      _current = _Stroke(_colorIdx, _strokeWidth(e), [e.localPosition]);
    });
  }

  void _move(PointerMoveEvent e) {
    if (e.pointer != _activePointer) return;
    if (_eraser) {
      _eraseAt(e.localPosition);
      return;
    }
    setState(() => _current?.points.add(e.localPosition));
  }

  void _up(PointerUpEvent e) {
    if (e.pointer != _activePointer) return;
    _activePointer = null;
    if (_eraser) {
      _save();
      return;
    }
    final s = _current;
    _current = null;
    if (s == null) return;
    // 점 하나(탭)는 획으로 남기지 않는다.
    if (s.points.length < 2) {
      setState(() {});
      return;
    }
    setState(() => _strokes.add(s));
    _save();
  }

  void _cancel(PointerCancelEvent e) {
    if (e.pointer != _activePointer) return;
    _activePointer = null;
    setState(() => _current = null);
  }

  void _eraseAt(Offset p) {
    const r = 16.0;
    final before = _strokes.length;
    _strokes.removeWhere((s) => s.points.any((o) => (o - p).distance <= r));
    if (_strokes.length != before) setState(() {});
  }

  void _undo() {
    if (_strokes.isEmpty) return;
    setState(() => _strokes.removeLast());
    _save();
  }

  Future<void> _clearAll() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('필기를 모두 지울까요?'),
        content: const Text('이 문항의 손필기가 전부 지워집니다. 되돌릴 수 없습니다.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('취소')),
          FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('모두 지우기')),
        ],
      ),
    );
    if (ok == true) {
      setState(() {
        _strokes.clear();
        _current = null;
      });
      _save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 본문 — 필기 On 이면 잠가서(스크롤·탭 차단) 그리기 전용으로 만든다.
        Positioned.fill(
          child: AbsorbPointer(absorbing: _enabled, child: widget.child),
        ),
        // 필기 그림(항상 보이되 터치는 안 먹는다).
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(
              painter: _InkPainter(
                strokes: _strokes,
                current: _current,
                brightness: Theme.of(context).brightness,
              ),
            ),
          ),
        ),
        // 그리기 입력 레이어 — On 일 때만 얹는다.
        if (_enabled)
          Positioned.fill(
            child: Listener(
              behavior: HitTestBehavior.opaque,
              onPointerDown: _down,
              onPointerMove: _move,
              onPointerUp: _up,
              onPointerCancel: _cancel,
            ),
          ),
        // 도구 막대 + On/Off 토글.
        Positioned(
          right: 12,
          bottom: 12,
          child: _Toolbar(
            enabled: _enabled,
            eraser: _eraser,
            colorIdx: _colorIdx,
            hasInk: _strokes.isNotEmpty,
            onToggle: () => setState(() {
              _enabled = !_enabled;
              if (!_enabled) _eraser = false;
            }),
            onPickColor: (i) => setState(() {
              _colorIdx = i;
              _eraser = false;
            }),
            onEraser: () => setState(() => _eraser = !_eraser),
            onUndo: _undo,
            onClear: _clearAll,
          ),
        ),
      ],
    );
  }
}

/// 인덱스 색을 테마에 맞는 실제 색으로 푼다.
Color _inkColor(int idx, Brightness b) {
  switch (idx) {
    case 1:
      return const Color(0xFFE53935); // 빨강
    case 2:
      return const Color(0x66FFC107); // 형광펜(반투명 앰버)
    default:
      return b == Brightness.dark
          ? const Color(0xFFECEFF1) // 다크: 밝은 잉크
          : const Color(0xFF1A2330); // 라이트: 짙은 잉크
  }
}

class _InkPainter extends CustomPainter {
  _InkPainter({
    required this.strokes,
    required this.current,
    required this.brightness,
  });

  final List<_Stroke> strokes;
  final _Stroke? current;
  final Brightness brightness;

  void _draw(Canvas canvas, _Stroke s) {
    if (s.points.isEmpty) return;
    final paint = Paint()
      ..color = _inkColor(s.colorIdx, brightness)
      ..strokeWidth = s.width
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
    if (s.points.length == 1) {
      canvas.drawPoints(ui.PointMode.points, s.points, paint);
      return;
    }
    final path = Path()..moveTo(s.points.first.dx, s.points.first.dy);
    for (var i = 1; i < s.points.length; i++) {
      path.lineTo(s.points[i].dx, s.points[i].dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (final s in strokes) {
      _draw(canvas, s);
    }
    if (current != null) _draw(canvas, current!);
  }

  @override
  bool shouldRepaint(_InkPainter old) =>
      old.strokes != strokes ||
      old.current != current ||
      old.brightness != brightness;
}

class _Toolbar extends StatelessWidget {
  const _Toolbar({
    required this.enabled,
    required this.eraser,
    required this.colorIdx,
    required this.hasInk,
    required this.onToggle,
    required this.onPickColor,
    required this.onEraser,
    required this.onUndo,
    required this.onClear,
  });

  final bool enabled;
  final bool eraser;
  final int colorIdx;
  final bool hasInk;
  final VoidCallback onToggle;
  final ValueChanged<int> onPickColor;
  final VoidCallback onEraser;
  final VoidCallback onUndo;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (enabled)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: Palette.card(context),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Palette.hairline(context)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _PenDot(
                    color: const Color(0xFF1A2330),
                    selected: !eraser && colorIdx == 0,
                    onTap: () => onPickColor(0)),
                _PenDot(
                    color: const Color(0xFFE53935),
                    selected: !eraser && colorIdx == 1,
                    onTap: () => onPickColor(1)),
                _PenDot(
                    color: const Color(0xFFFFC107),
                    selected: !eraser && colorIdx == 2,
                    onTap: () => onPickColor(2)),
                const SizedBox(width: 2),
                _ToolBtn(
                  icon: Icons.cleaning_services_outlined,
                  active: eraser,
                  onTap: onEraser,
                  tooltip: '지우개',
                ),
                _ToolBtn(
                  icon: Icons.undo,
                  onTap: hasInk ? onUndo : null,
                  tooltip: '되돌리기',
                ),
                _ToolBtn(
                  icon: Icons.delete_outline,
                  onTap: hasInk ? onClear : null,
                  tooltip: '전체 지우기',
                ),
              ],
            ),
          ),
        // On/Off 토글.
        Material(
          color: enabled ? scheme.primary : Palette.card(context),
          shape: const CircleBorder(),
          elevation: 3,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Icon(
                enabled ? Icons.edit : Icons.edit_outlined,
                size: 22,
                color: enabled ? scheme.onPrimary : scheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PenDot extends StatelessWidget {
  const _PenDot(
      {required this.color, required this.selected, required this.onTap});
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        alignment: Alignment.center,
        child: Container(
          width: selected ? 22 : 18,
          height: selected ? 22 : 18,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: selected ? scheme.primary : Palette.hairline(context),
              width: selected ? 2.5 : 1,
            ),
          ),
        ),
      ),
    );
  }
}

class _ToolBtn extends StatelessWidget {
  const _ToolBtn({
    required this.icon,
    required this.onTap,
    this.active = false,
    this.tooltip,
  });
  final IconData icon;
  final VoidCallback? onTap;
  final bool active;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = onTap == null
        ? scheme.onSurfaceVariant.withValues(alpha: 0.35)
        : active
            ? scheme.primary
            : scheme.onSurfaceVariant;
    return IconButton(
      icon: Icon(icon, size: 20, color: color),
      onPressed: onTap,
      tooltip: tooltip,
      visualDensity: VisualDensity.compact,
      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      padding: EdgeInsets.zero,
    );
  }
}
