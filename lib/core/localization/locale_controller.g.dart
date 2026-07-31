// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localeControllerHash() => r'7f77d24b05e1ccf37b41ee33dbd8e7f72bceba29';

/// Controls the active locale at runtime.
///
/// Persists the chosen locale via [PreferencesStore] (wired in Task 8).
/// Widgets use `ref.watch(localeControllerProvider)` and
/// `ref.read(localeControllerProvider.notifier).setLocale(locale)`.
///
/// Copied from [LocaleController].
@ProviderFor(LocaleController)
final localeControllerProvider =
    NotifierProvider<LocaleController, Locale>.internal(
  LocaleController.new,
  name: r'localeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocaleController = Notifier<Locale>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
