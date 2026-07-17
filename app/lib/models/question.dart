/// 연습문제. 볼티 원작(출제기준 기반) — 기출 복제가 아니다.
///
/// 문제 데이터는 카드와 분리된 자산(assets/questions.json)이다. 엔진은 문제 수에
/// 무관하게 동작하므로, 문제를 늘리면 단원 연습·모의고사가 그대로 풍부해진다.
library;

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class Question {
  const Question({
    required this.id,
    required this.subject,
    required this.major,
    required this.stem,
    required this.choices,
    required this.answer,
    required this.explanation,
    this.type = '계산',
  });

  final String id;
  final String subject;

  /// 유형 — '계산'(수치·표값 답) 또는 '개념'(설명·명칭 답). 자동 태깅.
  final String type;

  /// 주요항목 ID(예: em.1) — '단원별' 묶음의 단위.
  final String major;

  /// 문제 지문. 인라인 `$수식$` 과 `**굵게**` 를 쓴다.
  final String stem;

  /// 4지선다 보기. 각 보기도 `$수식$` 가능.
  final List<String> choices;

  /// 정답 보기의 인덱스(0-based).
  final int answer;
  final String explanation;

  factory Question.fromJson(Map<String, dynamic> j) => Question(
        id: j['id'] as String,
        subject: j['subject'] as String,
        major: j['major'] as String,
        stem: j['stem'] as String,
        choices: (j['choices'] as List).cast<String>(),
        answer: j['answer'] as int,
        explanation: j['explanation'] as String? ?? '',
        type: j['type'] as String? ?? '계산',
      );
}

class QuestionBank {
  const QuestionBank(this._all);

  final List<Question> _all;

  int get count => _all.length;
  List<Question> get all => List.unmodifiable(_all);

  List<Question> bySubject(String subjectId) =>
      _all.where((q) => q.subject == subjectId).toList();

  List<Question> byMajor(String majorId) =>
      _all.where((q) => q.major == majorId).toList();

  List<Question> byIds(Set<String> ids) =>
      _all.where((q) => ids.contains(q.id)).toList();

  bool hasMajor(String majorId) => _all.any((q) => q.major == majorId);
  int countMajor(String majorId) => byMajor(majorId).length;
  int countSubject(String subjectId) => bySubject(subjectId).length;

  // ── 모의고사 구성 ──
  /// 실제 시험 과목 순서.
  static const examOrder = ['em', 'pw', 'mc', 'ct', 'kec'];
  static const _perSubject = 20; // 과목당 문항 수(실제 시험 = 5과목 × 20)

  /// 만들 수 있는 회차 수 = 과목별 문항을 20개씩 겹치지 않게 나눈 수(최소 과목 기준).
  int get roundCount {
    final counts = examOrder.map((s) => countSubject(s) ~/ _perSubject);
    return counts.reduce((a, b) => a < b ? a : b);
  }

  /// 회차 모의고사(1-based). id 정렬 기준으로 겹치지 않게 잘라 재현 가능.
  List<Question> roundExam(int round) {
    final out = <Question>[];
    for (final s in examOrder) {
      final pool = bySubject(s)..sort((a, b) => a.id.compareTo(b.id));
      out.addAll(pool.skip((round - 1) * _perSubject).take(_perSubject));
    }
    return out;
  }

  /// 랜덤 모의고사 — 과목별 20문항씩 무작위.
  List<Question> randomExam() => customExam({for (final s in examOrder) s: _perSubject});

  /// 과목별 문항 수(counts)·유형(type, null=전체)을 지정한 커스텀 모의시험.
  List<Question> customExam(Map<String, int> counts, {String? type}) {
    final out = <Question>[];
    for (final s in examOrder) {
      var pool = bySubject(s);
      if (type != null) pool = pool.where((q) => q.type == type).toList();
      pool = List<Question>.of(pool)..shuffle();
      out.addAll(pool.take(counts[s] ?? 0));
    }
    return out;
  }

  /// 특정 과목·유형에서 뽑을 수 있는 최대 문항 수.
  int availableFor(String subject, String? type) {
    final pool = bySubject(subject);
    return type == null
        ? pool.length
        : pool.where((q) => q.type == type).length;
  }

  static Future<QuestionBank> load() async {
    try {
      final raw = await rootBundle.loadString('assets/questions.json');
      final doc = jsonDecode(raw) as Map<String, dynamic>;
      final list = (doc['questions'] as List)
          .map((q) => Question.fromJson(q as Map<String, dynamic>))
          .toList(growable: false);
      return QuestionBank(list);
    } catch (_) {
      // 문제 자산이 없거나 깨져도 앱은 떠야 한다.
      return const QuestionBank([]);
    }
  }
}
