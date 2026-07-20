/// 학습 기록. 카드 학습 완료·즐겨찾기 + 문제 오답노트·모의고사 성적 + 간격반복 복습·통계.
///
/// 직장인은 끊어서 공부한다 — 어디까지 봤는지, 뭘 틀렸는지, 오늘 뭘 복습해야 하는지가
/// 앱을 꺼도 기기에 남아야 이어 갈 수 있다. shared_preferences 가 웹은 localStorage,
/// 네이티브는 각 OS 저장소에 넣는다.
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

/// 한 문항의 간격반복 상태. box(0~5)가 커질수록 복습 간격이 길어진다(Leitner).
class ReviewCard {
  ReviewCard(this.box, this.dueDay);
  int box;
  int dueDay; // 다음 복습 예정일(로컬 자정 기준 일련번호)

  /// box별 복습 간격(일). 틀리면 box 0(오늘 다시), 맞히면 한 칸 올라간다.
  static const intervals = [0, 1, 3, 7, 16, 35];
  static const maxBox = 5;
}

/// 단원(major)별 누적 시도·정답 수.
class MajorStat {
  MajorStat(this.attempts, this.correct);
  int attempts;
  int correct;
  double get accuracy => attempts == 0 ? 0 : correct / attempts;
}

/// 한 문항의 채점 결과(기록용). progress 가 question 모델에 의존하지 않도록 최소 정보만 받는다.
typedef AnswerRecord = ({String id, String major, bool correct});

class StudyProgress extends ChangeNotifier {
  StudyProgress._(
    this._prefs,
    this._studied,
    this._bookmarked,
    this._qBookmarked,
    this._wrong,
    this._exams,
    this._srs,
    this._majorStats,
    this._dayCounts,
    this._wrongReasons,
    this._dailyGoal,
  );

  final SharedPreferences _prefs;
  final Set<String> _studied;
  final Set<String> _bookmarked; // 즐겨찾은 이론 카드 ID
  final Set<String> _qBookmarked; // 즐겨찾은(헷갈린) 문제 ID
  final Set<String> _wrong; // 틀린 문제 ID(오답노트)
  final List<ExamResult> _exams; // 모의고사 이력(최신이 앞)
  final Map<String, ReviewCard> _srs; // 문항ID -> 복습 상태
  final Map<String, MajorStat> _majorStats; // 단원ID -> 누적 통계
  final Map<int, int> _dayCounts; // 일련일 -> 그날 푼 문항 수
  final Map<String, String> _wrongReasons; // 틀린 문항ID -> 오답 원인 태그
  int _dailyGoal;

  /// 오답 원인 태그 후보(순서대로 표시).
  static const wrongReasonTags = ['계산 실수', '개념 부족', '함정에 걸림', '단순 실수'];

  static const _kStudied = 'studied_ids';
  static const _kBookmarked = 'bookmarked_ids';
  static const _kQBookmarked = 'q_bookmarked_ids';
  static const _kWrong = 'wrong_qids';
  static const _kExams = 'exam_log';
  static const _kSrs = 'srs_v1';
  static const _kMajor = 'major_stats_v1';
  static const _kDays = 'day_counts_v1';
  static const _kReasons = 'wrong_reasons_v1';
  static const _kGoal = 'daily_goal';

  static const defaultGoal = 20;

  /// 로컬 자정 기준 일련일(하루 = 1). 타임존/DST 오차는 학습 통계에 무의미해 무시.
  static int dayOf(DateTime d) =>
      DateTime(d.year, d.month, d.day).millisecondsSinceEpoch ~/
      Duration.millisecondsPerDay;

  static Future<StudyProgress> load() async {
    final prefs = await SharedPreferences.getInstance();

    final exams = <ExamResult>[];
    for (final s in prefs.getStringList(_kExams) ?? const <String>[]) {
      try {
        exams.add(ExamResult.fromJson(jsonDecode(s) as Map<String, dynamic>));
      } catch (_) {/* 손상된 항목은 건너뛴다 */}
    }

    final srs = <String, ReviewCard>{};
    try {
      final m = jsonDecode(prefs.getString(_kSrs) ?? '{}') as Map<String, dynamic>;
      m.forEach((k, v) {
        final l = (v as List);
        srs[k] = ReviewCard((l[0] as num).toInt(), (l[1] as num).toInt());
      });
    } catch (_) {/* 무시 */}

    final major = <String, MajorStat>{};
    try {
      final m = jsonDecode(prefs.getString(_kMajor) ?? '{}') as Map<String, dynamic>;
      m.forEach((k, v) {
        final l = (v as List);
        major[k] = MajorStat((l[0] as num).toInt(), (l[1] as num).toInt());
      });
    } catch (_) {/* 무시 */}

    final days = <int, int>{};
    try {
      final m = jsonDecode(prefs.getString(_kDays) ?? '{}') as Map<String, dynamic>;
      m.forEach((k, v) => days[int.parse(k)] = (v as num).toInt());
    } catch (_) {/* 무시 */}

    final reasons = <String, String>{};
    try {
      final m = jsonDecode(prefs.getString(_kReasons) ?? '{}') as Map<String, dynamic>;
      m.forEach((k, v) => reasons[k] = v as String);
    } catch (_) {/* 무시 */}

    return StudyProgress._(
      prefs,
      (prefs.getStringList(_kStudied) ?? const []).toSet(),
      (prefs.getStringList(_kBookmarked) ?? const []).toSet(),
      (prefs.getStringList(_kQBookmarked) ?? const []).toSet(),
      (prefs.getStringList(_kWrong) ?? const []).toSet(),
      exams,
      srs,
      major,
      days,
      reasons,
      prefs.getInt(_kGoal) ?? defaultGoal,
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

  // ── 문제 즐겨찾기(헷갈린 문제 저장) ──
  bool isQuestionBookmarked(String id) => _qBookmarked.contains(id);
  int get questionBookmarkCount => _qBookmarked.length;
  Set<String> get questionBookmarks => Set.unmodifiable(_qBookmarked);

  void toggleQuestionBookmark(String id) {
    if (!_qBookmarked.remove(id)) _qBookmarked.add(id);
    _prefs.setStringList(_kQBookmarked, _qBookmarked.toList());
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

  // ── 간격반복 복습(SRS) ──
  /// 오늘(포함) 이전에 복습 예정일이 잡힌 문항 ID들.
  Set<String> dueIds({DateTime? now}) {
    final today = dayOf(now ?? DateTime.now());
    return {
      for (final e in _srs.entries)
        if (e.value.dueDay <= today) e.key,
    };
  }

  int dueCount({DateTime? now}) => dueIds(now: now).length;

  // ── 스트릭·일일 목표 ──
  int get dailyGoal => _dailyGoal;
  void setDailyGoal(int g) {
    _dailyGoal = g.clamp(5, 200);
    _prefs.setInt(_kGoal, _dailyGoal);
    notifyListeners();
  }

  int todayCount({DateTime? now}) => _dayCounts[dayOf(now ?? DateTime.now())] ?? 0;

  Map<int, int> get dayCounts => Map.unmodifiable(_dayCounts);

  /// 연속 학습일. 오늘 아직 안 했으면 어제까지의 연속을 유지해 보여준다.
  int streak({DateTime? now}) {
    var day = dayOf(now ?? DateTime.now());
    if ((_dayCounts[day] ?? 0) == 0) day -= 1; // 오늘은 아직 안 했을 수 있다
    var s = 0;
    while ((_dayCounts[day] ?? 0) > 0) {
      s++;
      day--;
    }
    return s;
  }

  // ── 단원별 통계 ──
  MajorStat? majorStat(String majorId) => _majorStats[majorId];
  Map<String, MajorStat> get majorStats => Map.unmodifiable(_majorStats);

  // ── 오답 원인 태그 ──
  String? wrongReason(String qid) => _wrongReasons[qid];

  void setWrongReason(String qid, String? reason) {
    if (reason == null) {
      _wrongReasons.remove(qid);
    } else {
      _wrongReasons[qid] = reason;
    }
    _saveReasons();
    notifyListeners();
  }

  /// 오답 원인별 개수(태그 -> 수).
  Map<String, int> reasonCounts() {
    final c = <String, int>{};
    for (final r in _wrongReasons.values) {
      c[r] = (c[r] ?? 0) + 1;
    }
    return c;
  }

  void _saveReasons() =>
      _prefs.setString(_kReasons, jsonEncode(_wrongReasons));

  /// 채점된 문항들을 한 번에 기록: SRS 갱신·오답노트·단원통계·오늘 학습량, 모의고사면 성적 이력.
  void recordAnswers(
    List<AnswerRecord> answers, {
    bool isExam = false,
    String examLabel = '',
    DateTime? now,
  }) {
    if (answers.isEmpty) return;
    final t = now ?? DateTime.now();
    final today = dayOf(t);
    var reasonsChanged = false;

    for (final a in answers) {
      // SRS: 맞히면 상자 한 칸 위(간격↑), 틀리면 0(오늘 다시).
      final rc = _srs[a.id] ?? ReviewCard(0, today);
      if (a.correct) {
        rc.box = (rc.box + 1).clamp(0, ReviewCard.maxBox);
      } else {
        rc.box = 0;
      }
      rc.dueDay = today + ReviewCard.intervals[rc.box];
      _srs[a.id] = rc;

      // 오답노트: 맞히면 빠지고 틀리면 들어간다.
      if (a.correct) {
        _wrong.remove(a.id);
        if (_wrongReasons.remove(a.id) != null) reasonsChanged = true;
      } else {
        _wrong.add(a.id);
      }

      // 단원별 누적.
      final ms = _majorStats[a.major] ?? MajorStat(0, 0);
      ms.attempts++;
      if (a.correct) ms.correct++;
      _majorStats[a.major] = ms;
    }

    _dayCounts[today] = (_dayCounts[today] ?? 0) + answers.length;

    _saveSrs();
    _saveMajor();
    _saveDays();
    if (reasonsChanged) _saveReasons();
    _prefs.setStringList(_kWrong, _wrong.toList());

    if (isExam) {
      final correct = answers.where((a) => a.correct).length;
      _exams.insert(
        0,
        ExamResult(
            correct: correct, total: answers.length, at: t, label: examLabel),
      );
      if (_exams.length > 30) _exams.removeRange(30, _exams.length);
      _prefs.setStringList(
          _kExams, _exams.map((e) => jsonEncode(e.toJson())).toList());
    }
    notifyListeners();
  }

  void _saveSrs() => _prefs.setString(
      _kSrs,
      jsonEncode({
        for (final e in _srs.entries) e.key: [e.value.box, e.value.dueDay],
      }));

  void _saveMajor() => _prefs.setString(
      _kMajor,
      jsonEncode({
        for (final e in _majorStats.entries)
          e.key: [e.value.attempts, e.value.correct],
      }));

  void _saveDays() => _prefs.setString(
      _kDays, jsonEncode({for (final e in _dayCounts.entries) '${e.key}': e.value}));

  void clearWrong() {
    _wrong.clear();
    _prefs.remove(_kWrong);
    notifyListeners();
  }

  /// 모든 기록(학습·즐겨찾기·오답·성적·복습·통계)을 지운다. 되돌릴 수 없어 호출부에서 확인받는다.
  void clear() {
    _studied.clear();
    _bookmarked.clear();
    _qBookmarked.clear();
    _wrong.clear();
    _exams.clear();
    _srs.clear();
    _majorStats.clear();
    _dayCounts.clear();
    _wrongReasons.clear();
    _dailyGoal = defaultGoal;
    for (final k in [
      _kStudied,
      _kBookmarked,
      _kQBookmarked,
      _kWrong,
      _kExams,
      _kSrs,
      _kMajor,
      _kDays,
      _kReasons,
      _kGoal,
    ]) {
      _prefs.remove(k);
    }
    notifyListeners();
  }
}
