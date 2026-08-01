import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/authentication/domain/entities/auth_session.dart';

/// Contract defining all authentication operations.
abstract interface class AuthRepository {
  /// Restores persistent session on app startup.
  Future<Result<AuthSession>> restoreSession();

  /// Signs in using email and password.
  Future<Result<AuthSession>> signIn({
    required String email,
    required String password,
  });

  /// Registers a new user account.
  Future<Result<AuthSession>> register({
    required String name,
    required String email,
    required String password,
  });

  /// Signs in using Google OAuth.
  Future<Result<AuthSession>> signInWithGoogle();

  /// Verifies email address using verification code.
  Future<Result<void>> verifyEmail(String code);

  /// Requests password reset email for [email].
  Future<Result<void>> requestPasswordReset(String email);

  /// Resets password using verification token.
  Future<Result<void>> resetPassword({
    required String token,
    required String password,
  });

  /// Signs out current user and resets session to guest.
  Future<Result<void>> signOut();
}
