// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Controls the active [ThemeMode] at runtime.
///
/// Persists the chosen mode via [PreferencesStore] (wired in Task 8).
/// Widgets use `ref.watch(themeControllerProvider)` and
/// `ref.read(themeControllerProvider.notifier).setThemeMode(mode)`.

@ProviderFor(ThemeController)
final themeControllerProvider = ThemeControllerProvider._();

/// Controls the active [ThemeMode] at runtime.
///
/// Persists the chosen mode via [PreferencesStore] (wired in Task 8).
/// Widgets use `ref.watch(themeControllerProvider)` and
/// `ref.read(themeControllerProvider.notifier).setThemeMode(mode)`.
final class ThemeControllerProvider
    extends $NotifierProvider<ThemeController, ThemeMode> {
  /// Controls the active [ThemeMode] at runtime.
  ///
  /// Persists the chosen mode via [PreferencesStore] (wired in Task 8).
  /// Widgets use `ref.watch(themeControllerProvider)` and
  /// `ref.read(themeControllerProvider.notifier).setThemeMode(mode)`.
  ThemeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeControllerHash();

  @$internal
  @override
  ThemeController create() => ThemeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeControllerHash() => r'7db59f441809dc2855d5bae6fb74f3edf20ea4ee';

/// Controls the active [ThemeMode] at runtime.
///
/// Persists the chosen mode via [PreferencesStore] (wired in Task 8).
/// Widgets use `ref.watch(themeControllerProvider)` and
/// `ref.read(themeControllerProvider.notifier).setThemeMode(mode)`.

abstract class _$ThemeController extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
