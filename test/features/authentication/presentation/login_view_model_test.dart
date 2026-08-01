import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/features/authentication/data/providers/auth_providers.dart';
import 'package:rehlaa/features/authentication/data/repositories/mock_auth_repository.dart';
import 'package:rehlaa/features/authentication/presentation/view_models/auth_session_controller.dart';
import 'package:rehlaa/features/authentication/presentation/view_models/login_view_model.dart';
import 'package:rehlaa/features/authentication/presentation/view_models/register_view_model.dart';

void main() {
  group('SignInViewModel', () {
    test('signIn success updates session controller', () async {
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(MockAuthRepository()),
        ],
      );
      addTearDown(container.dispose);
      container.listen(signInViewModelProvider, (_, __) {});

      final success = await container
          .read(signInViewModelProvider.notifier)
          .signIn(email: 'user@rehlaa.com', password: 'Password123');

      expect(success, isTrue);
      final session = container.read(authSessionControllerProvider).value;
      expect(session?.isAuthenticated, isTrue);
    });
  });

  group('RegisterViewModel', () {
    test('register success updates session controller', () async {
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(MockAuthRepository()),
        ],
      );
      addTearDown(container.dispose);
      container.listen(registerViewModelProvider, (_, __) {});

      final success = await container
          .read(registerViewModelProvider.notifier)
          .register(
            name: 'New User',
            email: 'newuser@rehlaa.com',
            password: 'Password123',
          );

      expect(success, isTrue);
      final session = container.read(authSessionControllerProvider).value;
      expect(session?.user?.email, equals('newuser@rehlaa.com'));
    });
  });
}
