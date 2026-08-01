import 'package:rehlaa/features/authentication/domain/entities/auth_user.dart';

/// Configurable mock scenarios for testing auth failure cases.
enum AuthMockScenario {
  success,
  invalidCredentials,
  emailAlreadyExists,
  unverifiedEmail,
  networkFailure,
}

/// Simulated data source providing mock user accounts and delay.
class AuthMockDataSource {
  AuthMockDataSource({this.scenario = AuthMockScenario.success});

  AuthMockScenario scenario;

  static const defaultUser = AuthUser(
    id: 'usr_mock_101',
    email: 'user@rehlaa.com',
    displayName: 'Mazen Ahmed',
    photoUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200',
    phoneNumber: '+966500000000',
    isEmailVerified: true,
  );

  static const unverifiedUser = AuthUser(
    id: 'usr_mock_102',
    email: 'new@rehlaa.com',
    displayName: 'New User',
  );

  Future<void> simulateNetwork() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (scenario == AuthMockScenario.networkFailure) {
      throw Exception('Simulated network timeout');
    }
  }
}
