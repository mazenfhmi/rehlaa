// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ViewModel managing the sign-in form submission state.

@ProviderFor(SignInViewModel)
final signInViewModelProvider = SignInViewModelProvider._();

/// ViewModel managing the sign-in form submission state.
final class SignInViewModelProvider
    extends $NotifierProvider<SignInViewModel, AsyncValue<void>> {
  /// ViewModel managing the sign-in form submission state.
  SignInViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInViewModelHash();

  @$internal
  @override
  SignInViewModel create() => SignInViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$signInViewModelHash() => r'8f9728caf1a29d03fb6981f366c7cd7ed86e8240';

/// ViewModel managing the sign-in form submission state.

abstract class _$SignInViewModel extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
