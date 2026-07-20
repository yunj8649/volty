/// 손필기 레이어. 문제·이론 카드 본문 위에 애플펜슬로 풀이를 끄적이는 스크래치 판.
///
/// 직장인은 계산문제를 손으로 풀어봐야 는다 — 문제 옆에서 바로 필기하고, 그 필기가
/// 문항·카드별로 기기에 남아 다시 볼 수 있어야 한다. shared_preferences 라 웹은
/// localStorage, 네이티브는 각 OS 저장소에 들어간다.
///
/// 상호작용 규칙(펜슬 필기 + 손가락 스크롤 동시):
///   - 애플펜슬(stylus) — 전용 제스처 인식기가 포인터를 가로채 항상 그린다. 아래 스크롤·탭은
///                        일어나지 않는다(인식기가 아레나를 선점).
///   - 손가락(touch)   — 인식기가 잡지 않으므로 그대로 아래로 흘러 스크롤·보기 선택이 된다.
///   - 펜슬이 없으면 도구막대의 '손가락 필기'를 켜서 손가락으로도 그릴 수 있다(그 땐 스크롤 대신 그리기).
library;

import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
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

/// 애플펜슬(및 '손가락 필기' 켤 때 터치/마우스)만 낚아채는 인식기.
/// 포인터 down 에서 즉시 아레나 승리를 선언해 아래 스크롤·탭이 안 먹게 한다.
class _DrawRecognizer extends OneSequenceGestureRecognizer {
  bool Function(ui.PointerDeviceKind)? allow;
  void Function(PointerEvent)? onDown;
  void Function(PointerEvent)? onUpdate;
  void Function(PointerEvent)? onEnd;

  @override
  bool isPointerAllowed(PointerDownEvent event) => allow?.call(event.kind) ?? false;

  @override
  void addAllowedPointer(PointerDownEvent event) {
    startTrackingPointer(event.pointer, event.transform);
    resolve(GestureDisposition.accepted); // 펜슬 포인터 선점 → 스크롤/탭 차단
    onDown?.call(event);
  }

  @override
  void handleEvent(PointerEvent event) {
    if (event is PointerMoveEvent) {
      onUpdate?.call(event);
    } else if (event is PointerUpEvent || event is PointerCancelEvent) {
      onEnd?.call(event);
      stopTrackingPointer(event.pointer);
    }
  }

  @override
  String get debugDescription => 'volty-handwriting';

  @override
  void didStopTrackingLastPointer(int pointer) {}
}

class HandwritingCanvas extends StatefulWidget {
  const HandwritingCanvas({
    super.key,
    required this.storageKey,
    required this.child,
  });

  /// 필기를 문항·카드와 묶는 키(예: 'note_q_em.1.r3'). 이 값이 저장 키가 된다.
  final String storageKey;
  final Widget child;

  @override
  State<HandwritingCanvas> createState() => _HandwritingCanvasState();
}

class _HandwritingCanvasState extends State<HandwritingCanvas> {
  static const _penWidth = 2.4;
  static const _highlightWidth = 15.0;

  final GlobalKey _paintKey = GlobalKey();
  final List<_Stroke> _strokes = [];
  _Stroke? _current;
  int? _activePointer; // 지금 그리는 포인터 하나만 따라간다(멀티터치 무시)

  bool _showTools = false; // 도구막대 펼침
  bool _fingerDraw = false; // 펜슬 없이 손가락으로 그리기(그 땐 스크롤 대신 필기)
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

  bool _allowKind(ui.PointerDeviceKind k) {
    if (k == ui.PointerDeviceKind.stylus ||
        k == ui.PointerDeviceKind.invertedStylus) {
      return true; // 펜슬은 언제나 필기
    }
    // 손가락·마우스는 '손가락 필기'를 켰을 때만 그린다(평소엔 스크롤/선택).
    return _fingerDraw &&
        (k == ui.PointerDeviceKind.touch || k == ui.PointerDeviceKind.mouse);
  }

  Offset _local(PointerEvent e) {
    final box = _paintKey.currentContext?.findRenderObject() as RenderBox?;
    return box?.globalToLocal(e.position) ?? e.localPosition;
  }

  double _strokeWidth(PointerEvent e) {
    if (_colorIdx == 2) return _highlightWidth;
    final range = e.pressureMax - e.pressureMin;
    if (range > 0.0001) {
      final p = ((e.pressure - e.pressureMin) / range).clamp(0.0, 1.0);
      return _penWidth * (0.55 + 0.9 * p);
    }
    return _penWidth;
  }

  void _down(PointerEvent e) {
    if (_activePointer != null) return;
    _activePointer = e.pointer;
    final p = _local(e);
    if (_eraser) {
      _eraseAt(p);
      return;
    }
    setState(() => _current = _Stroke(_colorIdx, _strokeWidth(e), [p]));
  }

  void _move(PointerEvent e) {
    if (e.pointer != _activePointer) return;
    final p = _local(e);
    if (_eraser) {
      _eraseAt(p);
      return;
    }
    setState(() => _current?.points.add(p));
  }

  void _end(PointerEvent e) {
    if (e.pointer != _activePointer) return;
    _activePointer = null;
    if (_eraser) {
      _save();
      return;
    }
    final s = _current;
    _current = null;
    if (s == null) return;
    if (s.points.length < 2) {
      setState(() {}); // 점 하나(탭)는 획으로 남기지 않는다
      return;
    }
    setState(() => _strokes.add(s));
    _save();
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
        // 본문 + 필기그림 — 펜슬은 인식기가 가로채고, 손가락은 아래 본문으로 흘러 스크롤된다.
        Positioned.fill(
          child: RawGestureDetector(
            behavior: HitTestBehavior.translucent,
            gestures: <Type, GestureRecognizerFactory>{
              _DrawRecognizer:
                  GestureRecognizerFactoryWithHandlers<_DrawRecognizer>(
                () => _DrawRecognizer(),
                (r) => r
                  ..allow = _allowKind
                  ..onDown = _down
                  ..onUpdate = _move
                  ..onEnd = _end,
              ),
            },
            child: Stack(
              children: [
                widget.child,
                Positioned.fill(
                  child: IgnorePointer(
                    child: CustomPaint(
                      key: _paintKey,
                      painter: _InkPainter(
                        strokes: _strokes,
                        current: _current,
                        brightness: Theme.of(context).brightness,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // 도구막대 — 인식기 밖(위)에 두어 펜슬로도 버튼을 누를 수 있다.
        Positioned(
          right: 12,
          bottom: 12,
          child: _Toolbar(
            showTools: _showTools,
            fingerDraw: _fingerDraw,
            eraser: _eraser,
            colorIdx: _colorIdx,
            hasInk: _strokes.isNotEmpty,
            onToggleTools: () => setState(() => _showTools = !_showTools),
            onToggleFinger: () => setState(() => _fingerDraw = !_fingerDraw),
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
    required this.showTools,
    required this.fingerDraw,
    required this.eraser,
    required this.colorIdx,
    required this.hasInk,
    required this.onToggleTools,
    required this.onToggleFinger,
    required this.onPickColor,
    required this.onEraser,
    required this.onUndo,
    required this.onClear,
  });

  final bool showTools;
  final bool fingerDraw;
  final bool eraser;
  final int colorIdx;
  final bool hasInk;
  final VoidCallback onToggleTools;
  final VoidCallback onToggleFinger;
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
        if (showTools)
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
                Container(
                  width: 1,
                  height: 22,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  color: Palette.hairline(context),
                ),
                _ToolBtn(
                  icon: Icons.back_hand_outlined,
                  active: fingerDraw,
                  onTap: onToggleFinger,
                  tooltip: fingerDraw ? '손가락 필기 끄기(스크롤)' : '손가락으로도 필기',
                ),
              ],
            ),
          ),
        // 도구막대 여닫기 버튼. 펜슬은 이걸 켜지 않아도 항상 필기된다.
        Material(
          color: showTools ? scheme.primary : Palette.card(context),
          shape: const CircleBorder(),
          elevation: 3,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onToggleTools,
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Icon(
                showTools ? Icons.edit : Icons.edit_outlined,
                size: 22,
                color: showTools ? scheme.onPrimary : scheme.onSurfaceVariant,
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
