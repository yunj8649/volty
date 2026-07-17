/// 이론 카드. 단위는 세부항목이다 (총 198장).
///
/// 폰과 패드가 같은 카드를 다르게 쓴다:
///   폰   — summary + formulas + traps. 한 손으로, 짧게, 끊겨도 되는 복습.
///   패드 — sections 전체. 집중 이론 학습.
/// 그래서 summary 는 '요약'이 아니라 그것만 읽어도 값이 있는 문장이어야 한다.
library;

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

/// 검수 상태. 전기 계산은 틀리면 치명적이라 검수 전이면 앱에 배지를 띄운다.
enum CardStatus { draft, reviewed }

class Formula {
  const Formula({required this.tex, this.label, this.note});

  /// LaTeX 본문 (달러 기호 없이).
  final String tex;
  final String? label;
  final String? note;

  factory Formula.fromJson(Map<String, dynamic> j) => Formula(
        tex: j['tex'] as String,
        label: j['label'] as String?,
        note: j['note'] as String?,
      );
}

class CardSection {
  const CardSection({required this.heading, required this.body});

  final String heading;

  /// 마크다운-라이트. 문단, **굵게**, $인라인수식$, $$블록수식$$ 만 쓴다.
  final String body;

  factory CardSection.fromJson(Map<String, dynamic> j) => CardSection(
        heading: j['heading'] as String,
        body: j['body'] as String,
      );
}

class TheoryCard {
  const TheoryCard({
    required this.id,
    required this.title,
    required this.status,
    required this.subject,
    required this.path,
    required this.summary,
    required this.covers,
    required this.formulas,
    required this.traps,
    required this.related,
    required this.sections,
  });

  /// 세부항목 ID (예: em.1.4). 학습 기록이 여기 매달린다.
  final String id;
  final String title;
  final CardStatus status;
  final String subject;

  /// [과목, 주요항목, 세부항목] 이름.
  final List<String> path;
  final String summary;

  /// 이 카드가 덮는 세세항목 ID. 빌드 시 taxonomy 와 대조된다.
  final List<String> covers;
  final List<Formula> formulas;
  final List<String> traps;
  final List<String> related;
  final List<CardSection> sections;

  bool get isDraft => status == CardStatus.draft;

  factory TheoryCard.fromJson(Map<String, dynamic> j) => TheoryCard(
        id: j['id'] as String,
        title: j['title'] as String,
        status: j['status'] == 'reviewed' ? CardStatus.reviewed : CardStatus.draft,
        subject: j['subject'] as String,
        path: (j['path'] as List).cast<String>(),
        summary: j['summary'] as String,
        covers: (j['covers'] as List).cast<String>(),
        formulas: (j['formulas'] as List)
            .map((f) => Formula.fromJson(f as Map<String, dynamic>))
            .toList(growable: false),
        traps: (j['traps'] as List).cast<String>(),
        related: (j['related'] as List).cast<String>(),
        sections: (j['sections'] as List)
            .map((s) => CardSection.fromJson(s as Map<String, dynamic>))
            .toList(growable: false),
      );
}

/// 카드 모음. 아직 안 쓴 세부항목이 대부분이라 조회는 null 을 낼 수 있다.
class CardLibrary {
  const CardLibrary(this._byId);

  final Map<String, TheoryCard> _byId;

  TheoryCard? byMinorId(String id) => _byId[id];
  TheoryCard? byId(String id) => _byId[id];
  bool has(String id) => _byId.containsKey(id);
  int get count => _byId.length;

  /// 전체 카드. cards.json 의 순서(= 출제기준 과목·항목 순)를 그대로 따른다.
  /// Dart Map 은 삽입 순서를 보존하므로 별도 정렬하지 않는다.
  List<TheoryCard> get all => _byId.values.toList(growable: false);

  static Future<CardLibrary> load() async {
    final raw = await rootBundle.loadString('assets/cards.json');
    final doc = jsonDecode(raw) as Map<String, dynamic>;
    final cards = (doc['cards'] as List)
        .map((c) => TheoryCard.fromJson(c as Map<String, dynamic>));
    return CardLibrary({for (final c in cards) c.id: c});
  }
}
