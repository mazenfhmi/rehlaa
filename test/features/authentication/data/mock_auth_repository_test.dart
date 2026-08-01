import 'package:flutter_test/flutter_test.dart';

import 'package:rehlaa/features/authentication/data/data_sources/auth_mock_data_source.dart';
import 'package:rehlaa/features/authentication/data/repositories/mock_auth_repository.dart';

void main() {
  group('MockAuthRepository', () {
    test(
      'signIn with default credentials returns authenticated session',
      () async {
        final repo = MockAuthRepository();
        final result = await repo.signIn(
          email: 'user@rehlaa.com',
          password: 'Password123',
        );

        expect(result.isSuccess, isTrue);
        final session = result.dataOrThrow;
        expect(session.isAuthenticated, isTrue);
        expect(session.user?.email, equals('user@rehlaa.com'));
      },
    );

    test('signIn with unverified email returns unverified session', () async {
      final repo = MockAuthRepository();
      final result = await repo.signIn(
        email: 'unverified@rehlaa.com',
        password: 'Password123',
      );

      expect(result.isSuccess, isTrue);
      final session = result.dataOrThrow;
      expect(session.isAuthenticated, isFalse);
      expect(session.user?.isEmailVerified, isFalse);
    });

    test('signIn with invalid credentials scenario returns failure', () async {
      final dataSource = AuthMockDataSource(
        scenario: AuthMockScenario.invalidCredentials,
      );
      final repo = MockAuthRepository(dataSource: dataSource);

      final result = await repo.signIn(
        email: 'wrong@rehlaa.com',
        password: 'WrongPassword123',
      );

      expect(result.isFailure, isTrue);
    });

    test('signOut sets session to guest', () async {
      final repo = MockAuthRepository();
      await repo.signIn(email: 'user@rehlaa.com', password: 'Password123');

      final signOutResult = await repo.signOut();
      expect(signOutResult.isSuccess, isTrue);

      final restored = await repo.restoreSession();
      final session = restored.dataOrThrow;
      expect(session.isAuthenticated, isFalse);
    });
  });
}
