import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';

abstract class FavoritesRepository {
  Future<Result<List<Product>>> getFavorites();
  Future<Result<void>> toggleFavorite(String productId);
  Future<Result<bool>> isFavorite(String productId);
}
