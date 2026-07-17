/// 학습 기록. 카드 학습 완료·즐겨찾기 + 문제 오답노트·모의고사 성적.
///
/// 직장인은 끊어서 공부한다 — 어디까지 봤는지, 뭘 틀렸는지가 앱을 꺼도 기기에 남아야
/// 이어 갈 수 있다. shared_preferences 가 웹은 localStorage, 네이티브는 각 OS 저장소에 넣는다.
library;

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 모의고사 한 회 결과.
class ExamResult {
  const ExamResult({
    required this.correct,
    required this.total,
    required this.at,
    this.label = '',
  });
  final int correct;
  final int total;
  final DateTime at;

  /// 어느 모의고사인지 — '랜덤', '1회' 등.
  final String label;

  int get score => total == 0 ? 0 : (correct / total * 100).round();

  Map<String, dynamic> toJson() => {
        'c': correct,
        't': total,
        'at': at.millisecondsSinceEpoch,
        'l': label,
      };
  factory ExamResult.fromJson(Map<String, dynamic> j) => ExamResult(
        correct: j['c'] as int,
        total: j['t'] as int,
        at: DateTime.fromMillisecondsSinceEpoch(j['at'] as int),
        label: (j['l'] as String?) ?? '',
      );
}

class StudyProgress extends ChangeNotifier {
  StudyProgress._(this._prefs, this._studied, this._bookmarked, this._wrong,
      this._exams);

  final SharedPreferences _prefs;
  final Set<String> _studied;
  final Set<String> _bookmarked;
  final Set<String> _wrong; // 틀린 문제 ID(오답노트)
  final List<ExamResult> _exams; // 모의고사 이력(최신이 앞)

  static const _kStudied = 'studied_ids';
  static const _kBookmarked = 'bookmarked_ids';
  static const _kWrong = 'wrong_qids';
  static const _kExams = 'exam_log';

  static Future<StudyProgress> load() async {
    final prefs = await SharedPreferences.getInstance();
    final exams = <ExamResult>[];
    for (final s in prefs.getStringList(_kExams) ?? const <String>[]) {
      try {
        exams.add(ExamResult.fromJson(jsonDecode(s) as Map<String, dynamic>));
      } catch (_) {/* 손상된 항목은 건너뛴다 */}
    }
    return StudyProgress._(
      prefs,
      (prefs.getStringList(_kStudied) ?? const []).toSet(),
      (prefs.getStringList(_kBookmarked) ?? const []).toSet(),
      (prefs.getStringList(_kWrong) ?? const []).toSet(),
      exams,
    );
  }

  // ── 카드 ──
  bool isStudied(String id) => _studied.contains(id);
  bool isBookmarked(String id) => _bookmarked.contains(id);
  int get studiedCount => _studied.length;
  int get bookmarkCount => _bookmarked.length;
  Set<String> get bookmarks => Set.unmodifiable(_bookmarked);
  int studiedAmong(Iterable<String> ids) => ids.where(_studied.contains).length;

  void toggleStudied(String id) {
    if (!_studied.remove(id)) _studied.add(id);
    _prefs.setStringList(_kStudied, _studied.toList());
    notifyListeners();
  }

  void toggleBookmark(String id) {
    if (!_bookmarked.remove(id)) _bookmarked.add(id);
    _prefs.setStringList(_kBookmarked, _bookmarked.toList());
    notifyListeners();
  }

  // ── 문제(오답노트·성적) ──
  int get wrongCount => _wrong.length;
  Set<String> get wrongIds => Set.unmodifiable(_wrong);
  List<ExamResult> get exams => List.unmodifiable(_exams);
  ExamResult? get lastExam => _exams.isEmpty ? null : _exams.first;

  /// 특정 모의고사(라벨)의 가장 최근 결과.
  ExamResult? lastExamFor(String label) {
    for (final e in _exams) {
      if (e.label == label) return e;
    }
    return null;
  }

  /// 퀴즈 채점 결과를 반영한다. 맞힌 문제는 오답노트에서 빠지고, 틀린 문제는 들어간다.
  /// 모의고사면 성적 이력에도 한 줄 남긴다.
  void recordQuiz(Map<String, bool> results,
      {bool isExam = false, String examLabel = '', DateTime? now}) {
    var changed = false;
    results.forEach((id, ok) {
      if (ok) {
        if (_wrong.remove(id)) changed = true;
      } else {
        if (_wrong.add(id)) changed = true;
      }
    });
    if (changed) _prefs.setStringList(_kWrong, _wrong.toList());

    if (isExam && results.isNotEmpty) {
      final correct = results.values.where((x) => x).length;
      _exams.insert(
          0,
          ExamResult(
              correct: correct,
              total: results.length,
              at: now ?? DateTime.now(),
              label: examLabel));
      if (_exams.length > 30) _exams.removeRange(30, _exams.length);
      _prefs.setStringList(
          _kExams, _exams.map((e) => jsonEncode(e.toJson())).toList());
    }
    notifyListeners();
  }

  void clearWrong() {
    _wrong.clear();
    _prefs.remove(_kWrong);
    notifyListeners();
  }

  /// 모든 기록(학습·즐겨찾기·오답·성적)을 지운다. 되돌릴 수 없어 호출부에서 확인받는다.
  void clear() {
    _studied.clear();
    _bookmarked.clear();
    _wrong.clear();
    _exams.clear();
    for (final k in [_kStudied, _kBookmarked, _kWrong, _kExams]) {
      _prefs.remove(k);
    }
    notifyListeners();
  }
}
