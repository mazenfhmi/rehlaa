import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/features/authentication/domain/entities/auth_session.dart';
import 'package:rehlaa/features/authentication/domain/entities/auth_user.dart';

void main() {
  group('AuthSession', () {
    test('guest is not authenticated and has null user', () {
      const session = AuthSession.guest();
      expect(session.isAuthenticated, isFalse);
      expect(session.user, isNull);
    });

    test('authenticated session exposes user and is authenticated', () {
      const user = AuthUser(
        id: 'u1',
        email: 'user@example.com',
        displayName: 'User',
      );
      const session = AuthSession.authenticated(user: user);
      expect(session.isAuthenticated, isTrue);
      expect(session.user, equals(user));
    });

    test('unverified session is not authenticated but exposes user', () {
      const user = AuthUser(
        id: 'u2',
        email: 'unverified@example.com',
        displayName: 'Unverified',
        isEmailVerified: false,
      );
      const session = AuthSession.unverified(user: user);
      expect(session.isAuthenticated, isFalse);
      expect(session.user, equals(user));
    });
  });
}
