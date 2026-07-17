import 'package:flutter/material.dart';

/// 개념 이름을 화면용으로 다듬는다. 출제기준이 목록 끝에 붙이는 ' 등'(등등의 의미)을
/// 표시에서만 뗀다. 데이터·ID·covers 는 그대로 둔다(공백 뒤 '등'만 제거해 '평등' 등은 안전).
String conceptLabel(String name) =>
    name.replaceFirst(RegExp(r'\s+등$'), '').trimRight();

/// 학습에 집중되는 테마: 따뜻한 종이 배경 + 차분한 인디고 액센트.
///
/// 오래 읽어도 눈이 편하게 — 순백 대신 살짝 따뜻한 종이색, 강한 그림자 대신
/// 옅은 경계선, 넉넉한 줄간격. 핵심(인디고)·함정(앰버)은 형광펜처럼 구분한다.
class AppTheme {
  static const _seed = Color(0xFF4A57C9);

  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness b) {
    final isLight = b == Brightness.light;
    final scheme = ColorScheme.fromSeed(seedColor: _seed, brightness: b).copyWith(
      surface: isLight ? const Color(0xFFFFFFFF) : const Color(0xFF211F26),
      onSurface: isLight ? const Color(0xFF272420) : const Color(0xFFEAE5DC),
    );
    final paper = isLight ? const Color(0xFFF6F3ED) : const Color(0xFF151418);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: 'NanumGothic',
      scaffoldBackgroundColor: paper,
      appBarTheme: AppBarTheme(
        backgroundColor: paper,
        surfaceTintColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'NanumGothic',
          fontSize: 19,
          fontWeight: FontWeight.w800,
          color: scheme.onSurface,
        ),
      ),
      dividerColor: scheme.outlineVariant.withValues(alpha: 0.4),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 16, height: 1.8),
        bodyMedium: TextStyle(fontSize: 15, height: 1.75),
      ).apply(fontFamily: 'NanumGothic'),
    );
  }
}

/// 학습용 강조 색. 밝기에 따라 값이 갈려서 BuildContext 로 뽑는다.
class Palette {
  static bool _dark(BuildContext c) => Theme.of(c).brightness == Brightness.dark;

  /// 카드 배경(종이 위의 흰 카드).
  static Color card(BuildContext c) => Theme.of(c).colorScheme.surface;

  /// 핵심 공식 — 인디고 계열 옅은 박스.
  static Color formulaBg(BuildContext c) =>
      _dark(c) ? const Color(0xFF242433) : const Color(0xFFEEF0FB);
  static Color formulaBorder(BuildContext c) =>
      _dark(c) ? const Color(0xFF39406A) : const Color(0xFFD5DAF3);

  /// 자주 틀리는 것 — 앰버(형광펜) 계열.
  static Color trapBg(BuildContext c) =>
      _dark(c) ? const Color(0xFF2C2617) : const Color(0xFFFBF3E2);
  static Color trapBorder(BuildContext c) =>
      _dark(c) ? const Color(0xFF564722) : const Color(0xFFEED9A8);
  static Color trapFg(BuildContext c) =>
      _dark(c) ? const Color(0xFFE6BA6E) : const Color(0xFF8A5A12);

  /// 요약(한 줄) — 살짝 도드라지는 종이.
  static Color summaryBg(BuildContext c) =>
      _dark(c) ? const Color(0xFF262530) : const Color(0xFFFFFFFF);

  /// 완료/즐겨찾기 강조.
  static Color accent(BuildContext c) => Theme.of(c).colorScheme.primary;
  static Color done(BuildContext c) =>
      _dark(c) ? const Color(0xFF83CFA2) : const Color(0xFF2E7D52);

  /// 본문 블록 수식 배경(차분하게).
  static Color mathBg(BuildContext c) =>
      _dark(c) ? const Color(0xFF1E1D24) : const Color(0xFFF3F1EA);

  static Color hairline(BuildContext c) =>
      Theme.of(c).colorScheme.outlineVariant.withValues(alpha: 0.5);
}
