/// 공단 출제기준(필기)에서 뽑은 개념 분류 트리.
///
/// 과목 > 주요항목 > 세부항목 > 개념(세세항목) 4단계다.
/// 이 트리가 앱의 축이다 — 학습 기록, 약점 진단, 이론 카드가 전부 개념 ID에 매달린다.
library;

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

/// 세세항목. 학습의 최소 단위.
class Concept {
  const Concept({required this.id, required this.name});

  /// 위치 기반 안정 ID (예: em.1.4.3). 라벨이 바뀌어도 유지된다.
  final String id;
  final String name;

  /// 이 개념이 속한 과목 코드 (em, pw, mc, ct, kec).
  String get subjectId => id.split('.').first;

  factory Concept.fromJson(Map<String, dynamic> j) =>
      Concept(id: j['id'] as String, name: j['name'] as String);
}

/// 세부항목.
class Minor {
  const Minor({required this.id, required this.name, required this.concepts});

  final String id;
  final String name;
  final List<Concept> concepts;

  factory Minor.fromJson(Map<String, dynamic> j) => Minor(
        id: j['id'] as String,
        name: j['name'] as String,
        concepts: (j['concepts'] as List)
            .map((c) => Concept.fromJson(c as Map<String, dynamic>))
            .toList(growable: false),
      );
}

/// 주요항목.
class Major {
  const Major({required this.id, required this.name, required this.minors});

  final String id;
  final String name;
  final List<Minor> minors;

  int get conceptCount =>
      minors.fold(0, (sum, m) => sum + m.concepts.length);

  factory Major.fromJson(Map<String, dynamic> j) => Major(
        id: j['id'] as String,
        name: j['name'] as String,
        minors: (j['minors'] as List)
            .map((m) => Minor.fromJson(m as Map<String, dynamic>))
            .toList(growable: false),
      );
}

/// 필기 과목. 5과목 각 20문항.
class Subject {
  const Subject({
    required this.id,
    required this.name,
    required this.questionCount,
    required this.majors,
  });

  final String id;
  final String name;
  final int questionCount;
  final List<Major> majors;

  int get conceptCount => majors.fold(0, (sum, m) => sum + m.conceptCount);

  Iterable<Concept> get concepts =>
      majors.expand((ma) => ma.minors).expand((mi) => mi.concepts);

  factory Subject.fromJson(Map<String, dynamic> j) => Subject(
        id: j['id'] as String,
        name: j['name'] as String,
        questionCount: j['questionCount'] as int,
        majors: (j['majors'] as List)
            .map((m) => Major.fromJson(m as Map<String, dynamic>))
            .toList(growable: false),
      );
}

/// 합격 기준. 평균 60점 이상 + 과목당 40점 이상(과락).
class PassRule {
  const PassRule({required this.averageMin, required this.perSubjectMin});

  final int averageMin;
  final int perSubjectMin;

  factory PassRule.fromJson(Map<String, dynamic> j) => PassRule(
        averageMin: j['averageMin'] as int,
        perSubjectMin: j['perSubjectMin'] as int,
      );
}

class Taxonomy {
  const Taxonomy({
    required this.version,
    required this.source,
    required this.passRule,
    required this.subjects,
  });

  final String version;
  final String source;
  final PassRule passRule;
  final List<Subject> subjects;

  int get conceptCount => subjects.fold(0, (sum, s) => sum + s.conceptCount);

  Subject subjectById(String id) => subjects.firstWhere((s) => s.id == id);

  /// 개념 ID로 조회. 없으면 null.
  Concept? conceptById(String id) {
    for (final s in subjects) {
      for (final c in s.concepts) {
        if (c.id == id) return c;
      }
    }
    return null;
  }

  factory Taxonomy.fromJson(Map<String, dynamic> j) => Taxonomy(
        version: j['version'] as String,
        source: j['source'] as String,
        passRule: PassRule.fromJson(j['passRule'] as Map<String, dynamic>),
        subjects: (j['subjects'] as List)
            .map((s) => Subject.fromJson(s as Map<String, dynamic>))
            .toList(growable: false),
      );

  static Future<Taxonomy> load() async {
    final raw = await rootBundle.loadString('assets/taxonomy.json');
    return Taxonomy.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }
}
