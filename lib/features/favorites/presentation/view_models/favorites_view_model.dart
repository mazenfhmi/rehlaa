import 'package:rehlaa/features/favorites/data/repositories/mock_favorites_repository.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_view_model.g.dart';

@riverpod
class FavoritesViewModel extends _$FavoritesViewModel {
  @override
  Future<List<Product>> build() async {
    final repo = ref.watch(favoritesRepositoryProvider);
    final result = await repo.getFavorites();
    
    return result.fold(
      onSuccess: (data) => data,
      onFailure: (failure) => throw Exception(failure.message),
    );
  }

  Future<void> toggleFavorite(Product product) async {
    final previousState = state.value;
    if (previousState == null) return;
    
    final repo = ref.read(favoritesRepositoryProvider);
    final isFavorite = previousState.any((p) => p.id == product.id);
    
    if (isFavorite) {
      state = AsyncData(previousState.where((p) => p.id != product.id).toList());
    } else {
      state = AsyncData([...previousState, product]);
    }
    
    final result = await repo.toggleFavorite(product.id);
    
    if (!ref.mounted) return;

    result.fold(
      onSuccess: (_) {},
      onFailure: (failure) {
        state = AsyncData(previousState);
      },
    );
  }
}
