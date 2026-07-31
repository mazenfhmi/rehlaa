// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authSessionControllerHash() =>
    r'b1a7e9b7f0bbfc7953b7bbefe4d1086fe66bb117';

/// Global controller managing the application's active [AuthSession].
///
/// Listened to by `go_router` for route protection and auth redirects.
///
/// Copied from [AuthSessionController].
@ProviderFor(AuthSessionController)
final authSessionControllerProvider =
    AsyncNotifierProvider<AuthSessionController, AuthSession>.internal(
  AuthSessionController.new,
  name: r'authSessionControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authSessionControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthSessionController = AsyncNotifier<AuthSession>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
