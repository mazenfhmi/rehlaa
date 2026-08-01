import 'package:flutter/material.dart';
import 'package:rehlaa/core/storage/storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_controller.g.dart';

/// Supported locales for the application.
const Set<String> _supportedLocales = {'en', 'ar'};

/// Controls the active locale at runtime.
///
/// Persists the chosen locale via [PreferencesStore] (wired in Task 8).
/// Widgets use `ref.watch(localeControllerProvider)` and
/// `ref.read(localeControllerProvider.notifier).setLocale(locale)`.
@Riverpod(keepAlive: true)
class LocaleController extends _$LocaleController {
  @override
  Locale build() {
    final prefs = ref.read(preferenceStorageServiceProvider);
    final saved = prefs.getString(PreferenceKeys.locale);
    if (saved != null && _supportedLocales.contains(saved)) {
      return Locale(saved);
    }
    return const Locale('ar'); // default: Arabic
  }

  void setLocale(Locale locale) {
    if (!_supportedLocales.contains(locale.languageCode)) return;
    state = locale;
    ref
        .read(preferenceStorageServiceProvider)
        .setString(PreferenceKeys.locale, locale.languageCode);
  }

  void toggleLocale() {
    final newLocale = state.languageCode == 'ar'
        ? const Locale('en')
        : const Locale('ar');
    setLocale(newLocale);
  }
}
