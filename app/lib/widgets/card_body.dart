/// 카드 본문 렌더러.
///
/// 마크다운 전체를 지원하지 않는다. 카드 본문은 우리가 쓰는 것이고 형식이 정해져
/// 있으므로(data/cards/README.md), 필요한 것만 직접 그린다:
///   - 빈 줄로 나뉜 문단
///   - `$$...$$` 블록 수식
///   - `- ` 로 시작하는 목록
///   - `| a | b |` 표
///   - 문단 안의 `**굵게**` 와 `$인라인 수식$`
///
/// flutter_markdown 은 discontinued 라 의존하지 않는다.
library;

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../theme.dart';

/// 폰트를 반드시 명시해야 한다. 두 군데서 각각 터진다.
///
/// 1. RichText 는 DefaultTextStyle 을 상속하지 않아서, fontFamily 를 비워두면
///    테마의 본문 폰트(NanumGothic)가 아니라 기본 폰트로 떨어진다.
/// 2. Math.tex 는 KaTeX 자체 수학 폰트를 쓰는데 거기엔 한글이 없다. textStyle 에
///    fontFamily 를 주면 `\text{...}` 안의 한글을 이 폰트로 폴백해준다.
///    `E_{\text{내부}}`, `Q_{\text{진전하}}` 같은 첨자가 카드 전반에 깔려 있어서
///    이걸 빠뜨리면 수식 속 한글이 전부 두부(□)가 된다.
const _fontFamily = 'NanumGothic';

class CardBody extends StatelessWidget {
  const CardBody(this.body, {super.key});

  final String body;

  @override
  Widget build(BuildContext context) {
    final blocks = <Widget>[];
    final re = RegExp(r'\$\$(.+?)\$\$', dotAll: true);
    var cursor = 0;

    void addProse(String text) {
      for (final para in text.split(RegExp(r'\n\s*\n'))) {
        final t = para.trim();
        if (t.isEmpty) continue;

        final lines = t.split('\n');
        // '### 소제목'. 빌드는 '## ' 만 섹션으로 자르므로 그보다 깊은 건 본문에 남는다.
        if (lines.first.trimLeft().startsWith('### ')) {
          blocks.add(_SubHeading(lines.first.trimLeft().substring(4).trim()));
          final rest = lines.skip(1).join('\n').trim();
          if (rest.isNotEmpty) addProse(rest);
          continue;
        }
        if (lines.every((l) => l.trim().startsWith('|'))) {
          blocks.add(_Table(lines));
          continue;
        }
        // '- ' 로 시작하는 줄들은 목록으로. 한 문단에 섞여 있을 수 있다.
        if (lines.any((l) => l.trimLeft().startsWith('- '))) {
          blocks.add(_Bullets(lines));
          continue;
        }
        blocks.add(Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: InlineRich(t),
        ));
      }
    }

    for (final m in re.allMatches(body)) {
      addProse(body.substring(cursor, m.start));
      blocks.add(_BlockMath(m.group(1)!.trim()));
      cursor = m.end;
    }
    addProse(body.substring(cursor));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: blocks,
    );
  }
}

class _SubHeading extends StatelessWidget {
  const _SubHeading(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4, right: 10),
            width: 3,
            height: 16,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: InlineRich(
              text,
              style: TextStyle(
                fontFamily: _fontFamily,
                fontSize: 15.5,
                height: 1.5,
                fontWeight: FontWeight.w800,
                color: accent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Bullets extends StatelessWidget {
  const _Bullets(this.lines);

  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // 목록 항목은 다음 '- ' 가 나오기 전까지 여러 줄에 걸칠 수 있다.
    final items = <String>[];
    for (final raw in lines) {
      final l = raw.trim();
      if (l.startsWith('- ')) {
        items.add(l.substring(2).trim());
      } else if (l.isNotEmpty && items.isNotEmpty) {
        items[items.length - 1] += ' $l';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 9, right: 10),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: scheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Expanded(child: InlineRich(item)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// `| a | b |` 표. 구분선 행(`|---|---|`)은 버린다.
/// 전기기사 내용은 비교표가 자주 필요하다 (점전하 vs 쌍극자, Y결선 vs Δ결선 …).
class _Table extends StatelessWidget {
  const _Table(this.lines);

  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final rows = <List<String>>[];
    for (final l in lines) {
      final t = l.trim();
      if (RegExp(r'^\|[\s\-:|]+\|$').hasMatch(t)) continue; // 구분선
      final cells = t.split('|');
      rows.add(cells.sublist(1, cells.length - 1).map((c) => c.trim()).toList());
    }
    if (rows.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Palette.card(context),
        border: Border.all(color: Palette.hairline(context)),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder.symmetric(
          inside: BorderSide(color: Palette.hairline(context)),
        ),
        children: [
          for (var i = 0; i < rows.length; i++)
            TableRow(
              decoration: i == 0
                  ? BoxDecoration(color: Palette.formulaBg(context))
                  : null,
              children: [
                for (final cell in rows[i])
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: InlineRich(
                      cell,
                      style: TextStyle(
                        fontFamily: _fontFamily,
                        fontSize: 14,
                        height: 1.5,
                        fontWeight: i == 0 ? FontWeight.w700 : null,
                        color: scheme.onSurface,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _BlockMath extends StatelessWidget {
  const _BlockMath(this.tex);

  final String tex;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 14),
      decoration: BoxDecoration(
        color: Palette.mathBg(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Palette.hairline(context)),
      ),
      // 긴 수식은 좁은 폰에서 넘친다. 세로가 아니라 가로로 흘려보낸다.
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Math.tex(
          tex,
          textStyle: TextStyle(
              fontFamily: _fontFamily, fontSize: 17, color: scheme.onSurface),
          onErrorFallback: (e) => Text(
            tex,
            style: TextStyle(
              fontFamily: 'monospace',
              color: scheme.error,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

/// 한 덩어리의 글. `**굵게**` 와 `$인라인 수식$` 을 섞어 그린다.
///
/// 본문 문단뿐 아니라 공식 설명·표 셀처럼 짧은 곳에도 쓴다 — 거기에도 수식과
/// 굵게가 들어가므로 그냥 Text 로 그리면 마크다운 원문이 그대로 노출된다.
class InlineRich extends StatelessWidget {
  const InlineRich(this.text, {super.key, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final base = style ??
        TextStyle(
          fontFamily: _fontFamily,
          fontSize: 16,
          height: 1.8,
          color: scheme.onSurface,
        );

    // 줄바꿈을 먼저 없앤다. 원문에서 인라인 수식이 두 줄에 걸치는 경우가 있어서
    // ($\varepsilon = \varepsilon_0\n\varepsilon_s$) 정규식을 먼저 돌리면 놓친다.
    final flat = text.replaceAll(RegExp(r'\s*\n\s*'), ' ');
    return RichText(text: TextSpan(style: base, children: _spans(flat, base)));
  }

  /// 굵게 안에 수식이 들어갈 수 있어서 재귀로 판다.
  /// 굵게를 통째로 삼키면 그 안의 `$...$` 가 원문 그대로 노출된다.
  static List<InlineSpan> _spans(String text, TextStyle base, {bool bold = false}) {
    final spans = <InlineSpan>[];
    final re = RegExp(r'\$([^$]+?)\$|\*\*(.+?)\*\*');
    final weight = bold ? FontWeight.w700 : null;
    var cursor = 0;

    for (final m in re.allMatches(text)) {
      if (m.start > cursor) {
        spans.add(TextSpan(
          text: text.substring(cursor, m.start),
          style: TextStyle(fontWeight: weight),
        ));
      }
      if (m.group(1) != null) {
        spans.add(WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Math.tex(
            m.group(1)!,
            textStyle: base,
            onErrorFallback: (e) => Text(m.group(1)!, style: base),
          ),
        ));
      } else {
        // 굵게 안쪽을 다시 판다. `.+?` 라 중첩된 ** 는 없으므로 무한재귀는 없다.
        spans.addAll(_spans(m.group(2)!, base, bold: true));
      }
      cursor = m.end;
    }
    if (cursor < text.length) {
      spans.add(TextSpan(
        text: text.substring(cursor),
        style: TextStyle(fontWeight: weight),
      ));
    }
    return spans;
  }
}
