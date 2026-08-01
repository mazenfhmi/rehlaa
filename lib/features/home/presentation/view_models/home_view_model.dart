import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/mock_home_repository.dart';
import '../../domain/entities/home_category.dart';

part 'home_view_model.g.dart';

Duration? _doNotRetry(int retryCount, Object error) => null;

/// ViewModel managing the state of the Home Page categories.
@Riverpod(retry: _doNotRetry)
class HomeCategoriesViewModel extends _$HomeCategoriesViewModel {
  @override
  Future<List<HomeCategory>> build() async {
    final repository = ref.watch(homeRepositoryProvider);
    final result = await repository.getCategories();

    return result.fold(
      onSuccess: (data) => data,
      onFailure: (failure) => throw failure,
    );
  }

  void selectCategory(String categoryId) {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(
      current.map((c) => c.copyWith(isSelected: c.id == categoryId)).toList(),
    );
  }
}
