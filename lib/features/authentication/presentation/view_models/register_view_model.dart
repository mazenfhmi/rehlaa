import 'package:rehlaa/features/authentication/data/providers/auth_providers.dart';
import 'package:rehlaa/features/authentication/presentation/view_models/auth_session_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_view_model.g.dart';

/// ViewModel managing registration form submission state.
@riverpod
class RegisterViewModel extends _$RegisterViewModel {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.register(
      name: name,
      email: email,
      password: password,
    );

    return result.fold(
      onSuccess: (session) {
        if (ref.mounted) {
          state = const AsyncData(null);
          ref.read(authSessionControllerProvider.notifier).setSession(session);
        }
        return true;
      },
      onFailure: (failure) {
        if (ref.mounted) {
          state = AsyncError(failure, StackTrace.current);
        }
        return false;
      },
    );
  }
}
