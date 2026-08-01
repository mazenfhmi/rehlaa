import 'package:rehlaa/features/authentication/data/providers/auth_providers.dart';
import 'package:rehlaa/features/authentication/presentation/view_models/auth_session_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

/// ViewModel managing the sign-in form submission state.
@riverpod
class SignInViewModel extends _$SignInViewModel {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.signIn(email: email, password: password);

    return result.fold(
      onSuccess: (session) {
        state = const AsyncData(null);
        ref.read(authSessionControllerProvider.notifier).setSession(session);
        return true;
      },
      onFailure: (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
    );
  }

  Future<bool> signInWithGoogle() async {
    state = const AsyncLoading();

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.signInWithGoogle();

    return result.fold(
      onSuccess: (session) {
        state = const AsyncData(null);
        ref.read(authSessionControllerProvider.notifier).setSession(session);
        return true;
      },
      onFailure: (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
    );
  }
}
