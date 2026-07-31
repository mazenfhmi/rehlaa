import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_user.dart';

part 'auth_session.freezed.dart';

/// Represents the current authentication session state.
@freezed
sealed class AuthSession with _$AuthSession {
  const AuthSession._();

  const factory AuthSession.guest() = _AuthSessionGuest;

  const factory AuthSession.unverified({
    required AuthUser user,
  }) = _AuthSessionUnverified;

  const factory AuthSession.authenticated({
    required AuthUser user,
  }) = _AuthSessionAuthenticated;

  /// Returns `true` if the session is fully authenticated and verified.
  bool get isAuthenticated => switch (this) {
        _AuthSessionAuthenticated() => true,
        _ => false,
      };

  /// Returns the associated [AuthUser] if present.
  AuthUser? get user => switch (this) {
        _AuthSessionAuthenticated(:final user) => user,
        _AuthSessionUnverified(:final user) => user,
        _AuthSessionGuest() => null,
      };
}
