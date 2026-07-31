import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/auth_providers.dart';
import '../../domain/entities/auth_session.dart';

part 'auth_session_controller.g.dart';

/// Global controller managing the application's active [AuthSession].
///
/// Listened to by `go_router` for route protection and auth redirects.
@Riverpod(keepAlive: true)
class AuthSessionController extends _$AuthSessionController {
  @override
  Future<AuthSession> build() async {
    final repo = ref.watch(authRepositoryProvider);
    final result = await repo.restoreSession();
    return result.fold(
      onSuccess: (session) => session,
      onFailure: (_) => const AuthSession.guest(),
    );
  }

  /// Updates current session state manually after login/logout.
  void setSession(AuthSession session) {
    state = AsyncData(session);
  }

  /// Signs out and resets session to guest.
  Future<void> signOut() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.signOut();
    state = const AsyncData(AuthSession.guest());
  }
}
