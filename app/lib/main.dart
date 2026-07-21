import 'package:flutter/material.dart';

import 'models/card.dart';
import 'models/progress.dart';
import 'models/question.dart';
import 'models/taxonomy.dart';
import 'screens/home_screen.dart';
import 'theme.dart';
import 'widgets/volty_mascot.dart';

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
          return _Splash(error: '학습 자료를 불러오지 못했습니다.\n${snap.error}');
        }
        if (!snap.hasData) {
          return const _Splash();
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

/// 로딩(스플래시) 화면 — 마스코트 + Volty 로고. 오류 시 메시지도 함께.
class _Splash extends StatelessWidget {
  const _Splash({this.error});
  final String? error;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VoltyMascot(size: 112),
              const SizedBox(height: 20),
              Text(
                'Volty',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                  color: scheme.onSurface,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '전기기사, 한 손에',
                style: TextStyle(fontSize: 13.5, color: scheme.onSurfaceVariant),
              ),
              const SizedBox(height: 28),
              if (error == null)
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                      strokeWidth: 2.5, color: scheme.primary),
                )
              else
                Text(
                  error!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: scheme.error, height: 1.5),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
