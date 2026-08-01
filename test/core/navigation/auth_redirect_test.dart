import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rehlaa/core/navigation/app_route_names.dart';
import 'package:rehlaa/core/navigation/auth_redirect.dart';
import 'package:rehlaa/features/authentication/domain/entities/auth_session.dart';
import 'package:rehlaa/features/authentication/domain/entities/auth_user.dart';

// ignore: avoid_implementing_value_types
class MockGoRouterState extends Mock implements GoRouterState {}

GoRouterState _fakeState(String path) {
  final uri = Uri.parse(path);
  final mock = MockGoRouterState();
  when(() => mock.matchedLocation).thenReturn(uri.path);
  when(() => mock.uri).thenReturn(uri);
  return mock;
}

void main() {
  group('authRedirect', () {
    test('guest opening wallet is redirected to sign-in with return path', () {
      final redirect = authRedirect(
        session: const AuthSession.guest(),
        state: _fakeState('/wallet'),
      );
      expect(redirect, equals('${AppRoutePaths.signIn}?returnTo=%2Fwallet'));
    });

    test('authenticated user accessing auth route is redirected to home', () {
      const user = AuthUser(
        id: 'u1',
        email: 'user@rehlaa.com',
        displayName: 'User',
      );
      final redirect = authRedirect(
        session: const AuthSession.authenticated(user: user),
        state: _fakeState(AppRoutePaths.signIn),
      );
      expect(redirect, equals(AppRoutePaths.home));
    });

    test(
      'authenticated user accessing auth route with returnTo is redirected to returnTo',
      () {
        const user = AuthUser(
          id: 'u1',
          email: 'user@rehlaa.com',
          displayName: 'User',
        );
        final redirect = authRedirect(
          session: const AuthSession.authenticated(user: user),
          state: _fakeState('${AppRoutePaths.signIn}?returnTo=%2Fwallet'),
        );
        expect(redirect, equals('/wallet'));
      },
    );

    test('guest accessing home is not redirected', () {
      final redirect = authRedirect(
        session: const AuthSession.guest(),
        state: _fakeState(AppRoutePaths.home),
      );
      expect(redirect, isNull);
    });
  });
}
