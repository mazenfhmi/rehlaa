import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/catalog/data/mock/catalog_mock_data.dart';
import 'package:rehlaa/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';

class MockFavoritesRepository implements FavoritesRepository {
  final Set<String> _favoriteIds = {};

  @override
  Future<Result<List<Product>>> getFavorites() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final products = CatalogMockData.homeFeed.featuredProducts
        .where((p) => _favoriteIds.contains(p.id))
        .toList();
    return Success(products);
  }

  @override
  Future<Result<void>> toggleFavorite(String productId) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }
    return const Success(null);
  }

  @override
  Future<Result<bool>> isFavorite(String productId) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    return Success(_favoriteIds.contains(productId));
  }
}

final favoritesRepositoryProvider = Provider<FavoritesRepository>(
  (ref) => MockFavoritesRepository(),
);
