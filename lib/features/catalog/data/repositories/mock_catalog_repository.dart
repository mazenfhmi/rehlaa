import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/catalog/data/data_sources/catalog_local_data_source.dart';
import 'package:rehlaa/features/catalog/data/mock/catalog_mock_data.dart';
import 'package:rehlaa/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:rehlaa/features/home/domain/entities/home_feed.dart';
import 'package:rehlaa/shared/domain/catalog/category.dart';
import 'package:rehlaa/shared/domain/catalog/product.dart';

class MockCatalogRepository implements CatalogRepository {
  final ConnectivityService _connectivity;
  final CatalogLocalDataSource _localDataSource;
  final Duration _delay;

  MockCatalogRepository({
    required ConnectivityService connectivity,
    required CatalogLocalDataSource localDataSource,
    Duration delay = const Duration(milliseconds: 800),
  })  : _connectivity = connectivity,
        _localDataSource = localDataSource,
        _delay = delay;

  @override
  Future<Result<HomeFeed>> getHomeFeed() async {
    final isConnected = await _connectivity.isConnected;
    if (!isConnected) {
      final cached = await _localDataSource.getCachedHomeFeed();
      if (cached != null) {
        return Success(cached);
      }
      return const Failure(OfflineFailure());
    }

    await Future.delayed(_delay);
    final feed = CatalogMockData.homeFeed;
    await _localDataSource.cacheHomeFeed(feed);
    return Success(feed);
  }

  @override
  Future<Result<List<Product>>> getProducts() async {
    await Future.delayed(_delay);
    return Success(CatalogMockData.products);
  }

  @override
  Future<Result<Product>> getProductById(String id) async {
    await Future.delayed(_delay);
    final product = CatalogMockData.products.where((p) => p.id == id).firstOrNull;
    if (product != null) {
      return Success(product);
    }
    return const Failure(NotFoundFailure(message: 'Product not found.'));
  }

  @override
  Future<Result<List<Category>>> getCategories() async {
    await Future.delayed(_delay);
    return Success(CatalogMockData.categories);
  }
}
