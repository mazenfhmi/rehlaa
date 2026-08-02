import 'package:flutter/material.dart';

/// Application colors extracted from design reference (.desgin-ui/lib/constants.dart)
abstract final class AppColors {
  // MangoShop semantic palette
  static const Color brandAccent = Color(0xFF00BFA5);
  static const Color lightPrimary = Color(0xFF00796B);
  static const Color lightSecondary = Color(0xFF0288D1);
  static const Color lightTertiary = Color(0xFFEF6C00);
  static const Color lightBackground = Color(0xFFF7FBFA);
  static const Color lightSurfaceContainer = Color(0xFFE8F4F1);

  // Primary — Violet/Purple #7B61FF
  static const Color primary = Color(0xFF7B61FF);
  static const Color primaryLight = Color(0xFFEFECFF);
  static const Color primaryDark = Color(0xFF6C56DD);

  static const MaterialColor primarySwatch =
      MaterialColor(0xFF9581FF, <int, Color>{
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
      });

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
  static const Color darkBackground = Color(0xFF071816);
  static const Color darkSurface = Color(0xFF0D201D);
  static const Color darkSurfaceContainer = Color(0xFF142B27);
  static const Color darkSurfaceContainerHigh = Color(0xFF1C3631);
  static const Color darkCard = darkSurfaceContainer;

  // Transparent / Scrim
  static const Color transparent = Colors.transparent;
  static const Color scrim = Color(0x80000000);

  // E-Commerce UI (ui.txt) colors
  static const Color ecommercePrimary = Color(0xFFFF7643);
  static const Color ecommercePrimaryLight = Color(0xFFFFECDF);
  static const Color ecommerceSecondary = Color(0xFF979797);
  static const Color ecommerceText = Colors.black;
  static const Gradient ecommercePrimaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );
}
