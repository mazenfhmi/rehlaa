import '../../../../core/result/result.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_mock_data_source.dart';

/// Mock implementation of [AuthRepository] handling login, registration,
/// verification, and persistent session state.
class MockAuthRepository implements AuthRepository {
  MockAuthRepository({AuthMockDataSource? dataSource})
      : _dataSource = dataSource ?? AuthMockDataSource();

  final AuthMockDataSource _dataSource;
  AuthSession _currentSession = const AuthSession.guest();

  @override
  Future<Result<AuthSession>> restoreSession() async {
    await _dataSource.simulateNetwork();
    return Success(_currentSession);
  }

  @override
  Future<Result<AuthSession>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _dataSource.simulateNetwork();

      if (_dataSource.scenario == AuthMockScenario.invalidCredentials) {
        return const Failure(
          ValidationFailure(message: 'Invalid email or password.'),
        );
      }

      if (email.contains('unverified')) {
        _currentSession = const AuthSession.unverified(
          user: AuthMockDataSource.unverifiedUser,
        );
        return Success(_currentSession);
      }

      _currentSession = const AuthSession.authenticated(
        user: AuthMockDataSource.defaultUser,
      );
      return Success(_currentSession);
    } catch (e) {
      return Failure(NetworkFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<AuthSession>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _dataSource.simulateNetwork();

      if (_dataSource.scenario == AuthMockScenario.emailAlreadyExists) {
        return const Failure(
          ValidationFailure(message: 'An account with this email already exists.'),
        );
      }

      final newUser = AuthUser(
        id: 'usr_${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        displayName: name,
        isEmailVerified: false,
      );

      _currentSession = AuthSession.unverified(user: newUser);
      return Success(_currentSession);
    } catch (e) {
      return Failure(NetworkFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<AuthSession>> signInWithGoogle() async {
    try {
      await _dataSource.simulateNetwork();
      _currentSession = const AuthSession.authenticated(
        user: AuthMockDataSource.defaultUser,
      );
      return Success(_currentSession);
    } catch (e) {
      return Failure(NetworkFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> verifyEmail(String code) async {
    try {
      await _dataSource.simulateNetwork();
      final user = _currentSession.user;
      if (user != null) {
        final verifiedUser = user.copyWith(isEmailVerified: true);
        _currentSession = AuthSession.authenticated(user: verifiedUser);
      }
      return const Success(null);
    } catch (e) {
      return Failure(NetworkFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> requestPasswordReset(String email) async {
    try {
      await _dataSource.simulateNetwork();
      return const Success(null);
    } catch (e) {
      return Failure(NetworkFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> resetPassword({
    required String token,
    required String password,
  }) async {
    try {
      await _dataSource.simulateNetwork();
      return const Success(null);
    } catch (e) {
      return Failure(NetworkFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    await _dataSource.simulateNetwork();
    _currentSession = const AuthSession.guest();
    return const Success(null);
  }
}
