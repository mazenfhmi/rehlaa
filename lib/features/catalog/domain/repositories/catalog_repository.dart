import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/home/domain/entities/home_feed.dart';
import 'package:rehlaa/shared/domain/catalog/category.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';

abstract class CatalogRepository {
  Future<Result<HomeFeed>> getHomeFeed();
  Future<Result<List<Product>>> getProducts();
  Future<Result<Product>> getProductById(String id);
  Future<Result<List<Category>>> getCategories();
}
