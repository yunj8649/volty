import 'package:flutter/material.dart';

/// Volty 마스코트 — 디자인 이미지(image/볼티_마스코트.png 에서 크롭·투명화한 뽀짝 Volty).
class VoltyMascot extends StatelessWidget {
  const VoltyMascot({super.key, this.size = 32});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        'assets/brand/volty_mascot.png',
        fit: BoxFit.contain,
        filterQuality: FilterQuality.medium,
      ),
    );
  }
}

/// Volty 결합 로고(마스코트 + vol⚡y). 앱바용 가로형. 다크모드 자동 전환.
class VoltyLogo extends StatelessWidget {
  const VoltyLogo({super.key, this.height = 30});
  final double height;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Image.asset(
      dark ? 'assets/brand/volty_logo_dark.png' : 'assets/brand/volty_logo.png',
      height: height,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.medium,
    );
  }
}

/// Volty 워드마크(vol⚡y). 다크모드에선 흰색 버전으로 자동 전환.
class VoltyWordmark extends StatelessWidget {
  const VoltyWordmark({super.key, this.height = 22});
  final double height;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Image.asset(
      dark
          ? 'assets/brand/volty_wordmark_dark.png'
          : 'assets/brand/volty_wordmark.png',
      height: height,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.medium,
    );
  }
}
