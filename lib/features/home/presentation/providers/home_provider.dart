import 'package:rehlaa/features/catalog/presentation/providers/catalog_provider.dart';
import 'package:rehlaa/features/home/presentation/states/home_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

Duration? _doNotRetry(int retryCount, Object error) => null;

@Riverpod(retry: _doNotRetry)
class HomeViewModel extends _$HomeViewModel {
  @override
  Future<HomeViewState> build() {
    ref.watch(catalogRepositoryProvider);
    return _load();
  }

  Future<HomeViewState> _load() async {
    final repository = ref.read(catalogRepositoryProvider);
    final result = await repository.getHomeFeed();

    return result.fold(
      onSuccess: (feed) => HomeViewState(feed: feed),
      onFailure: (failure) => throw Exception(failure.message),
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading<HomeViewState>();
    state = await AsyncValue.guard(_load);
  }

  void selectCategory(String? categoryId) {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(
      current.copyWith(
        selectedCategoryId: categoryId,
        clearSelectedCategory: categoryId == null,
      ),
    );
  }
}
