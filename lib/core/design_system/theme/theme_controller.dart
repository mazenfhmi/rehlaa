import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

/// Controls the active [ThemeMode] at runtime.
///
/// Persists the chosen mode via [PreferencesStore] (wired in Task 8).
/// Widgets use `ref.watch(themeControllerProvider)` and
/// `ref.read(themeControllerProvider.notifier).setThemeMode(mode)`.
@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() => ThemeMode.light;

  void setThemeMode(ThemeMode mode) => state = mode;

  void toggleTheme() {
    state = switch (state) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => ThemeMode.light,
    };
  }
}
