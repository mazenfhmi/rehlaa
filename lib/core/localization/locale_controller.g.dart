// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Controls the active locale at runtime.
///
/// Persists the chosen locale via [PreferencesStore] (wired in Task 8).
/// Widgets use `ref.watch(localeControllerProvider)` and
/// `ref.read(localeControllerProvider.notifier).setLocale(locale)`.

@ProviderFor(LocaleController)
final localeControllerProvider = LocaleControllerProvider._();

/// Controls the active locale at runtime.
///
/// Persists the chosen locale via [PreferencesStore] (wired in Task 8).
/// Widgets use `ref.watch(localeControllerProvider)` and
/// `ref.read(localeControllerProvider.notifier).setLocale(locale)`.
final class LocaleControllerProvider
    extends $NotifierProvider<LocaleController, Locale> {
  /// Controls the active locale at runtime.
  ///
  /// Persists the chosen locale via [PreferencesStore] (wired in Task 8).
  /// Widgets use `ref.watch(localeControllerProvider)` and
  /// `ref.read(localeControllerProvider.notifier).setLocale(locale)`.
  LocaleControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeControllerHash();

  @$internal
  @override
  LocaleController create() => LocaleController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$localeControllerHash() => r'7f77d24b05e1ccf37b41ee33dbd8e7f72bceba29';

/// Controls the active locale at runtime.
///
/// Persists the chosen locale via [PreferencesStore] (wired in Task 8).
/// Widgets use `ref.watch(localeControllerProvider)` and
/// `ref.read(localeControllerProvider.notifier).setLocale(locale)`.

abstract class _$LocaleController extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
