import 'package:flutter/material.dart';
import 'package:rehlaa/core/storage/storage_service.dart';
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
  ThemeMode build() {
    final prefs = ref.read(preferenceStorageServiceProvider);
    final saved = prefs.getString(PreferenceKeys.themeMode);
    if (saved != null) {
      return ThemeMode.values.firstWhere(
        (e) => e.name == saved,
        orElse: () => ThemeMode.light,
      );
    }
    return ThemeMode.light;
  }

  ThemeMode get themeMode => state;
  set themeMode(ThemeMode mode) {
    state = mode;
    ref
        .read(preferenceStorageServiceProvider)
        .setString(PreferenceKeys.themeMode, mode.name);
  }

  void toggleTheme() {
    themeMode = switch (state) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => ThemeMode.light,
    };
  }
}
