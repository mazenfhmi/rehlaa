import 'package:flutter/material.dart';

/// Application colors extracted from design reference (.desgin-ui/lib/constants.dart)
abstract final class AppColors {
  // Primary — Violet/Purple #7B61FF
  static const Color primary = Color(0xFF7B61FF);
  static const Color primaryLight = Color(0xFFEFECFF);
  static const Color primaryDark = Color(0xFF6C56DD);

  static const MaterialColor primarySwatch = MaterialColor(
    0xFF9581FF,
    <int, Color>{
      50: Color(0xFFEFECFF),
      100: Color(0xFFD7D0FF),
      200: Color(0xFFBDB0FF),
      300: Color(0xFFA390FF),
      400: Color(0xFF8F79FF),
      500: Color(0xFF7B61FF),
      600: Color(0xFF7359FF),
      700: Color(0xFF684FFF),
      800: Color(0xFF5E45FF),
      900: Color(0xFF6C56DD),
    },
  );

  // Black scale
  static const Color black = Color(0xFF16161E);
  static const Color black80 = Color(0xFF45454B);
  static const Color black60 = Color(0xFF737378);
  static const Color black40 = Color(0xFFA2A2A5);
  static const Color black20 = Color(0xFFD0D0D2);
  static const Color black10 = Color(0xFFE8E8E9);
  static const Color black5 = Color(0xFFF3F3F4);

  // White scale
  static const Color white = Color(0xFFFFFFFF);
  static const Color white80 = Color(0xFFCCCCCC);
  static const Color white60 = Color(0xFF999999);
  static const Color white40 = Color(0xFF666666);
  static const Color white20 = Color(0xFF333333);
  static const Color white10 = Color(0xFF191919);

  // Neutral
  static const Color grey = Color(0xFFB8B5C3);
  static const Color lightGrey = Color(0xFFF8F8F9);
  static const Color darkGrey = Color(0xFF1C1C25);

  // Semantic
  static const Color success = Color(0xFF2ED573);
  static const Color warning = Color(0xFFFFBE21);
  static const Color error = Color(0xFFEA5B5B);
  static const Color info = Color(0xFF31B0D8);

  // Dark mode surfaces
  static const Color darkBackground = Color(0xFF101015);
  static const Color darkSurface = Color(0xFF1C1C25);
  static const Color darkCard = Color(0xFF16161E);

  // Transparent / Scrim
  static const Color transparent = Colors.transparent;
  static const Color scrim = Color(0x80000000);
}
