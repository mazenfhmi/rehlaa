import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';

/// Application theme definitions based on MangoShop semantic colors.
abstract final class AppTheme {
  static ThemeData lightFor(Locale locale) => _build(
    brightness: Brightness.light,
    locale: locale,
    scheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFA7FFEB),
      onPrimaryContainer: Color(0xFF10201D),
      secondary: AppColors.lightSecondary,
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFE1F5FE),
      onSecondaryContainer: Color(0xFF10201D),
      tertiary: AppColors.lightTertiary,
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xFFFFF3E0),
      onTertiaryContainer: Color(0xFF4D2600),
      surface: Colors.white,
      onSurface: Color(0xFF10201D),
      onSurfaceVariant: Color(0xFF526662),
      outline: Color(0xFFD4E5E1),
      surfaceDim: Color(0xFFDDEBE8),
      surfaceBright: Colors.white,
      surfaceContainerLowest: Colors.white,
      surfaceContainerLow: Color(0xFFF2F9F7),
      surfaceContainer: AppColors.lightSurfaceContainer,
      surfaceContainerHigh: Color(0xFFDDEBE8),
      surfaceContainerHighest: Color(0xFFD4E5E1),
    ),
    scaffold: AppColors.lightBackground,
  );

  static ThemeData get light => lightFor(const Locale('en'));

  static ThemeData darkFor(Locale locale) => _build(
    brightness: Brightness.dark,
    locale: locale,
    scheme: const ColorScheme.dark(
      primary: Color(0xFF5CEAD4),
      onPrimary: Color(0xFF00382F),
      primaryContainer: Color(0xFF005047),
      onPrimaryContainer: Color(0xFFB8FFF1),
      secondary: Color(0xFF67D4FF),
      onSecondary: Color(0xFF003546),
      secondaryContainer: Color(0xFF003A4D),
      onSecondaryContainer: Color(0xFFC4EEFF),
      tertiary: Color(0xFFFFB66A),
      onTertiary: Color(0xFF4B2800),
      tertiaryContainer: Color(0xFF663500),
      onTertiaryContainer: Color(0xFFFFDDBA),
      surface: AppColors.darkSurface,
      onSurface: Color(0xFFF3FBF8),
      onSurfaceVariant: Color(0xFFB7CAC5),
      outline: Color(0xFF29443E),
      surfaceDim: AppColors.darkBackground,
      surfaceBright: Color(0xFF29443E),
      surfaceContainerLowest: Color(0xFF091B18),
      surfaceContainerLow: Color(0xFF102520),
      surfaceContainer: AppColors.darkSurfaceContainer,
      surfaceContainerHigh: AppColors.darkSurfaceContainerHigh,
      surfaceContainerHighest: Color(0xFF24423D),
    ),
    scaffold: AppColors.darkBackground,
  );

  static ThemeData get dark => darkFor(const Locale('en'));

  static ThemeData _build({
    required Brightness brightness,
    required Locale locale,
    required ColorScheme scheme,
    required Color scaffold,
  }) {
    final isDark = brightness == Brightness.dark;
    final base = _baseTextTheme(scheme);
    final textTheme = locale.languageCode == 'ar'
        ? GoogleFonts.cairoTextTheme(base)
        : GoogleFonts.nunitoTextTheme(base);
    final inputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.md)),
      borderSide: const BorderSide(color: Colors.transparent),
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.md)),
      borderSide: BorderSide(color: scheme.primary),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.md)),
      borderSide: BorderSide(color: scheme.error),
    );

    return ThemeData(
      useMaterial3: false,
      brightness: brightness,
      colorScheme: scheme,
      primaryColor: scheme.primary,
      scaffoldBackgroundColor: scaffold,
      iconTheme: IconThemeData(color: scheme.onSurface),
      textTheme: textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(AppSpacing.base),
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          minimumSize: const Size(double.infinity, 56),
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(AppSpacing.base),
          minimumSize: const Size(double.infinity, 56),
          side: BorderSide(width: 1.5, color: scheme.outline),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
          ),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: scheme.surfaceContainer,
        filled: true,
        hintStyle: TextStyle(color: scheme.onSurfaceVariant),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        contentPadding: const EdgeInsets.all(AppSpacing.base),
        errorStyle: TextStyle(color: scheme.error, fontSize: 12),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? scheme.primary
              : Colors.transparent;
        }),
        checkColor: WidgetStatePropertyAll(scheme.onPrimary),
        side: BorderSide(color: scheme.outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scaffold,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: scheme.onSurface),
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: scheme.onSurface,
        ),
        centerTitle: false,
      ),
      dividerColor: scheme.outline,
      dividerTheme: DividerThemeData(
        color: scheme.outline,
        thickness: 1,
        space: 0,
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainer,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: BorderSide(color: scheme.outline),
        ),
        margin: EdgeInsets.zero,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scheme.surface,
        selectedItemColor: scheme.primary,
        unselectedItemColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        elevation: 0,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.xl),
          ),
        ),
        elevation: 0,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainer,
        selectedColor: scheme.primaryContainer,
        side: BorderSide(color: scheme.outline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isDark ? scheme.surfaceBright : scheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        contentTextStyle: TextStyle(
          color: isDark ? scheme.onSurface : scheme.surface,
          fontSize: 14,
        ),
      ),
    );
  }

  static TextTheme _baseTextTheme(ColorScheme scheme) => TextTheme(
    displayLarge: _text(57, FontWeight.w700, scheme.onSurface),
    displayMedium: _text(45, FontWeight.w700, scheme.onSurface),
    displaySmall: _text(36, FontWeight.w700, scheme.onSurface),
    headlineLarge: _text(32, FontWeight.w700, scheme.onSurface),
    headlineMedium: _text(28, FontWeight.w700, scheme.onSurface),
    headlineSmall: _text(24, FontWeight.w600, scheme.onSurface),
    titleLarge: _text(22, FontWeight.w600, scheme.onSurface),
    titleMedium: _text(16, FontWeight.w500, scheme.onSurface),
    titleSmall: _text(14, FontWeight.w500, scheme.onSurface),
    bodyLarge: _text(16, FontWeight.w400, scheme.onSurface),
    bodyMedium: _text(14, FontWeight.w400, scheme.onSurfaceVariant),
    bodySmall: _text(12, FontWeight.w400, scheme.onSurfaceVariant),
    labelLarge: _text(14, FontWeight.w600, scheme.onSurface),
    labelMedium: _text(12, FontWeight.w500, scheme.onSurface),
    labelSmall: _text(11, FontWeight.w500, scheme.onSurfaceVariant),
  );

  static TextStyle _text(double size, FontWeight weight, Color color) =>
      TextStyle(fontSize: size, fontWeight: weight, color: color, height: 1.5);
}
