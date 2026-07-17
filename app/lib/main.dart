import 'package:flutter/material.dart';

import 'models/card.dart';
import 'models/progress.dart';
import 'models/question.dart';
import 'models/taxonomy.dart';
import 'screens/home_screen.dart';
import 'theme.dart';

void main() => runApp(const VoltyApp());

class VoltyApp extends StatelessWidget {
  const VoltyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volty — 전기기사',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: const _Boot(),
    );
  }
}

/// 출제기준 트리와 이론 카드를 한 번 읽어서 앱 전체에 넘긴다.
class _Boot extends StatefulWidget {
  const _Boot();

  @override
  State<_Boot> createState() => _BootState();
}

class _BootState extends State<_Boot> {
  late final Future<(Taxonomy, CardLibrary, StudyProgress, QuestionBank)>
      _future = _load();

  static Future<(Taxonomy, CardLibrary, StudyProgress, QuestionBank)>
      _load() async {
    final results = await Future.wait([
      Taxonomy.load(),
      CardLibrary.load(),
      StudyProgress.load(),
      QuestionBank.load(),
    ]);
    return (
      results[0] as Taxonomy,
      results[1] as CardLibrary,
      results[2] as StudyProgress,
      results[3] as QuestionBank,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<(Taxonomy, CardLibrary, StudyProgress, QuestionBank)>(
      future: _future,
      builder: (context, snap) {
        if (snap.hasError) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text('학습 자료를 불러오지 못했습니다.\n${snap.error}'),
              ),
            ),
          );
        }
        if (!snap.hasData) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        final (taxonomy, cards, progress, questions) = snap.data!;
        return HomeScreen(
          taxonomy: taxonomy,
          cards: cards,
          progress: progress,
          questions: questions,
        );
      },
    );
  }
}
