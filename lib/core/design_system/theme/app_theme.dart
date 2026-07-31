import 'package:flutter/material.dart';

import '../tokens/app_tokens.dart';

// ---------------------------------------------------------------------------
// AppTheme — adapted from .desgin-ui/lib/theme/
// Fonts: Plus Jakarta Display (from assets/fonts/plus_jakarta/)
// Primary: #7B61FF
// ---------------------------------------------------------------------------

abstract final class AppTheme {
  static ThemeData get light => _buildLight();
  static ThemeData get dark => _buildDark();

  static ThemeData _buildLight() => ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        fontFamily: 'PlusJakarta',
        primaryColor: AppColors.primary,
        primarySwatch: AppColors.primarySwatch,
        scaffoldBackgroundColor: AppColors.white,
        iconTheme: const IconThemeData(color: AppColors.black),
        // Text theme
        textTheme: _lightTextTheme,
        // Components
        elevatedButtonTheme: _elevatedButtonTheme,
        textButtonTheme: _textButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme(),
        inputDecorationTheme: _lightInputTheme,
        checkboxTheme: _checkboxTheme.copyWith(
          side: const BorderSide(color: AppColors.black40),
        ),
        appBarTheme: _lightAppBarTheme,
        dividerColor: AppColors.black10,
        dividerTheme: const DividerThemeData(
          color: AppColors.black10,
          thickness: 1,
          space: 0,
        ),
        cardTheme: CardThemeData(
          color: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            side: const BorderSide(color: AppColors.black10),
          ),
          margin: EdgeInsets.zero,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontSize: 12),
          elevation: 0,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppRadius.xl),
            ),
          ),
          elevation: 0,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.lightGrey,
          selectedColor: AppColors.primaryLight,
          side: const BorderSide(color: AppColors.black10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          labelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: 'PlusJakarta',
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          contentTextStyle: const TextStyle(
            color: AppColors.white,
            fontFamily: 'PlusJakarta',
            fontSize: 14,
          ),
        ),
      );

  static ThemeData _buildDark() => ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
        fontFamily: 'PlusJakarta',
        primaryColor: AppColors.primary,
        primarySwatch: AppColors.primarySwatch,
        scaffoldBackgroundColor: AppColors.darkBackground,
        iconTheme: const IconThemeData(color: AppColors.white),
        textTheme: _darkTextTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        textButtonTheme: _textButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme(
          borderColor: AppColors.white20,
        ),
        inputDecorationTheme: _darkInputTheme,
        checkboxTheme: _checkboxTheme.copyWith(
          side: const BorderSide(color: AppColors.white40),
        ),
        appBarTheme: _darkAppBarTheme,
        dividerColor: AppColors.white20,
        dividerTheme: const DividerThemeData(
          color: AppColors.white20,
          thickness: 1,
          space: 0,
        ),
        cardTheme: CardThemeData(
          color: AppColors.darkCard,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            side: const BorderSide(color: AppColors.white20),
          ),
          margin: EdgeInsets.zero,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF101015),
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontSize: 12),
          elevation: 0,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.darkCard,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppRadius.xl),
            ),
          ),
          elevation: 0,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.darkSurface,
          selectedColor: AppColors.primary.withValues(alpha: 0.2),
          side: const BorderSide(color: AppColors.white20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          labelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: 'PlusJakarta',
            color: AppColors.white,
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          contentTextStyle: const TextStyle(
            color: AppColors.black,
            fontFamily: 'PlusJakarta',
            fontSize: 14,
          ),
        ),
      );
}

// ---------------------------------------------------------------------------
// AppBar themes — from .desgin-ui/lib/theme/theme_data.dart
// ---------------------------------------------------------------------------

const AppBarTheme _lightAppBarTheme = AppBarTheme(
  backgroundColor: AppColors.white,
  elevation: 0,
  scrolledUnderElevation: 0,
  iconTheme: IconThemeData(color: AppColors.black),
  titleTextStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: 'PlusJakarta',
  ),
  centerTitle: false,
);

const AppBarTheme _darkAppBarTheme = AppBarTheme(
  backgroundColor: AppColors.darkBackground,
  elevation: 0,
  scrolledUnderElevation: 0,
  iconTheme: IconThemeData(color: AppColors.white),
  titleTextStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: 'PlusJakarta',
  ),
  centerTitle: false,
);

// ---------------------------------------------------------------------------
// Button themes — from .desgin-ui/lib/theme/button_theme.dart
// ---------------------------------------------------------------------------

final ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(AppSpacing.base),
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    minimumSize: const Size(double.infinity, 56),
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
    ),
    textStyle: const TextStyle(
      fontFamily: 'PlusJakarta',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
);

OutlinedButtonThemeData _outlinedButtonTheme({
  Color borderColor = AppColors.black10,
}) =>
    OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(AppSpacing.base),
        minimumSize: const Size(double.infinity, 56),
        side: BorderSide(width: 1.5, color: borderColor),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
        ),
        textStyle: const TextStyle(
          fontFamily: 'PlusJakarta',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

final TextButtonThemeData _textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    textStyle: const TextStyle(
      fontFamily: 'PlusJakarta',
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);

// ---------------------------------------------------------------------------
// Input themes — from .desgin-ui/lib/theme/input_decoration_theme.dart
// ---------------------------------------------------------------------------

const _inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
  borderSide: BorderSide(color: Colors.transparent),
);

const _focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
  borderSide: BorderSide(color: AppColors.primary),
);

const _errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
  borderSide: BorderSide(color: AppColors.error),
);

const InputDecorationTheme _lightInputTheme = InputDecorationTheme(
  fillColor: AppColors.lightGrey,
  filled: true,
  hintStyle: TextStyle(color: AppColors.grey, fontFamily: 'PlusJakarta'),
  border: _inputBorder,
  enabledBorder: _inputBorder,
  focusedBorder: _focusedBorder,
  errorBorder: _errorBorder,
  focusedErrorBorder: _errorBorder,
  contentPadding: EdgeInsets.all(AppSpacing.base),
  errorStyle: TextStyle(
    color: AppColors.error,
    fontSize: 12,
    fontFamily: 'PlusJakarta',
  ),
);

const InputDecorationTheme _darkInputTheme = InputDecorationTheme(
  fillColor: AppColors.darkGrey,
  filled: true,
  hintStyle: TextStyle(color: AppColors.white40, fontFamily: 'PlusJakarta'),
  border: _inputBorder,
  enabledBorder: _inputBorder,
  focusedBorder: _focusedBorder,
  errorBorder: _errorBorder,
  focusedErrorBorder: _errorBorder,
  contentPadding: EdgeInsets.all(AppSpacing.base),
  errorStyle: TextStyle(
    color: AppColors.error,
    fontSize: 12,
    fontFamily: 'PlusJakarta',
  ),
);

// ---------------------------------------------------------------------------
// Checkbox theme — from .desgin-ui/lib/theme/checkbox_themedata.dart
// ---------------------------------------------------------------------------

final CheckboxThemeData _checkboxTheme = CheckboxThemeData(
  fillColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) return AppColors.primary;
    return Colors.transparent;
  }),
  checkColor: WidgetStateProperty.all(AppColors.white),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
);

// ---------------------------------------------------------------------------
// Text themes
// ---------------------------------------------------------------------------

TextStyle _t(double size, FontWeight weight, Color color) => TextStyle(
      fontFamily: 'PlusJakarta',
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: 1.5,
    );

final TextTheme _lightTextTheme = TextTheme(
  displayLarge: _t(57, FontWeight.w700, AppColors.black),
  displayMedium: _t(45, FontWeight.w700, AppColors.black),
  displaySmall: _t(36, FontWeight.w700, AppColors.black),
  headlineLarge: _t(32, FontWeight.w700, AppColors.black),
  headlineMedium: _t(28, FontWeight.w700, AppColors.black),
  headlineSmall: _t(24, FontWeight.w600, AppColors.black),
  titleLarge: _t(22, FontWeight.w600, AppColors.black),
  titleMedium: _t(16, FontWeight.w500, AppColors.black),
  titleSmall: _t(14, FontWeight.w500, AppColors.black),
  bodyLarge: _t(16, FontWeight.w400, AppColors.black),
  bodyMedium: _t(14, FontWeight.w400, AppColors.black40),
  bodySmall: _t(12, FontWeight.w400, AppColors.black60),
  labelLarge: _t(14, FontWeight.w600, AppColors.black),
  labelMedium: _t(12, FontWeight.w500, AppColors.black),
  labelSmall: _t(11, FontWeight.w500, AppColors.black40),
);

final TextTheme _darkTextTheme = TextTheme(
  displayLarge: _t(57, FontWeight.w700, AppColors.white),
  displayMedium: _t(45, FontWeight.w700, AppColors.white),
  displaySmall: _t(36, FontWeight.w700, AppColors.white),
  headlineLarge: _t(32, FontWeight.w700, AppColors.white),
  headlineMedium: _t(28, FontWeight.w700, AppColors.white),
  headlineSmall: _t(24, FontWeight.w600, AppColors.white),
  titleLarge: _t(22, FontWeight.w600, AppColors.white),
  titleMedium: _t(16, FontWeight.w500, AppColors.white),
  titleSmall: _t(14, FontWeight.w500, AppColors.white),
  bodyLarge: _t(16, FontWeight.w400, AppColors.white),
  bodyMedium: _t(14, FontWeight.w400, AppColors.white40),
  bodySmall: _t(12, FontWeight.w400, AppColors.white60),
  labelLarge: _t(14, FontWeight.w600, AppColors.white),
  labelMedium: _t(12, FontWeight.w500, AppColors.white),
  labelSmall: _t(11, FontWeight.w500, AppColors.white40),
);
