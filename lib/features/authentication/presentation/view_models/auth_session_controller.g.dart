// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Global controller managing the application's active [AuthSession].
///
/// Listened to by `go_router` for route protection and auth redirects.

@ProviderFor(AuthSessionController)
final authSessionControllerProvider = AuthSessionControllerProvider._();

/// Global controller managing the application's active [AuthSession].
///
/// Listened to by `go_router` for route protection and auth redirects.
final class AuthSessionControllerProvider
    extends $AsyncNotifierProvider<AuthSessionController, AuthSession> {
  /// Global controller managing the application's active [AuthSession].
  ///
  /// Listened to by `go_router` for route protection and auth redirects.
  AuthSessionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authSessionControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authSessionControllerHash();

  @$internal
  @override
  AuthSessionController create() => AuthSessionController();
}

String _$authSessionControllerHash() =>
    r'b1a7e9b7f0bbfc7953b7bbefe4d1086fe66bb117';

/// Global controller managing the application's active [AuthSession].
///
/// Listened to by `go_router` for route protection and auth redirects.

abstract class _$AuthSessionController extends $AsyncNotifier<AuthSession> {
  FutureOr<AuthSession> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthSession>, AuthSession>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthSession>, AuthSession>,
              AsyncValue<AuthSession>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
