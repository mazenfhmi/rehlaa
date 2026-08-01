// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(secureStorageService)
final secureStorageServiceProvider = SecureStorageServiceProvider._();

final class SecureStorageServiceProvider
    extends
        $FunctionalProvider<
          SecureStorageService,
          SecureStorageService,
          SecureStorageService
        >
    with $Provider<SecureStorageService> {
  SecureStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageServiceHash();

  @$internal
  @override
  $ProviderElement<SecureStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SecureStorageService create(Ref ref) {
    return secureStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecureStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecureStorageService>(value),
    );
  }
}

String _$secureStorageServiceHash() =>
    r'e5925f74bfa21cf00471b780cb816608b4239b29';

@ProviderFor(preferenceStorageService)
final preferenceStorageServiceProvider = PreferenceStorageServiceProvider._();

final class PreferenceStorageServiceProvider
    extends
        $FunctionalProvider<
          PreferenceStorageService,
          PreferenceStorageService,
          PreferenceStorageService
        >
    with $Provider<PreferenceStorageService> {
  PreferenceStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preferenceStorageServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$preferenceStorageServiceHash();

  @$internal
  @override
  $ProviderElement<PreferenceStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PreferenceStorageService create(Ref ref) {
    return preferenceStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PreferenceStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PreferenceStorageService>(value),
    );
  }
}

String _$preferenceStorageServiceHash() =>
    r'8e7726286cb3e2e9e1bd1ea012daa3dbb0174260';
